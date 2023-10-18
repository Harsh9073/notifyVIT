import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/gmail/v1.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


void main() => runApp(MaterialApp(
  home: GmailApp(),
));

class GmailApp extends StatefulWidget {
  @override
  _GmailAppState createState() => _GmailAppState();
}

class _GmailAppState extends State<GmailApp> {
  final List<Message> _emails = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gmail Fetcher'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () async {
              final gmailApi = await _initializeGmailApi();
              final emails = await _fetchOfficialNotices(gmailApi);
              setState(() {
                _emails.addAll(emails);
              });
            },
            child: Text('Fetch Official Notices'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _emails.length,
              itemBuilder: (context, index) {
                final email = _emails[index];
                final snippet = email.snippet ?? 'No snippet available';
                return ListTile(
                  title: Text(snippet),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void PromptUserForConsent(String authorizationUrl) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Authorize Access"),
            content: Text("Please visit the following URL to authorize access:\n\n$authorizationUrl"),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () async {
                  Navigator.pop(context);
                  await launchUrlString(authorizationUrl);
                },
              ),
            ],
          );
        }
    );
  }




  Future<GmailApi> _initializeGmailApi() async {
    final clientId = ClientId(
      'http://524101107248-us1i9lk58s7iu0n6hqmc1ev3g67rtb43.apps.googleusercontent.com', // Replace with your actual client ID
      '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', // Replace with your actual client secret
    );
    final authUrl = 'https://accounts.google.com/o/oauth2/auth?'
        'response_type=code&'
        'client_id=http://524101107248-us1i9lk58s7iu0n6hqmc1ev3g67rtb43.apps.googleusercontent.com&' // Replace with your actual client ID
        'redirect_uri=http://localhost/oauth2callback&' // Specify your redirect URI
        'scope=https://www.googleapis.com/auth/gmail.readonly';
 
    final credentials = await clientViaUserConsent(
      clientId,
      ['https://www.googleapis.com/auth/gmail.readonly'],
            (String authorizationUrl) => PromptUserForConsent('https://accounts.google.com/o/oauth2/auth') // Use the function here
    );

    return GmailApi(credentials);
  }


  Future<List<Message>> _fetchOfficialNotices(GmailApi gmailApi) async {
    try {
      final response = await gmailApi.users.messages.list('me', q: 'label:Placement Office');
      final messages = response.messages;
      final emailList = <Message>[];

      for (final message in messages!) {
        final email = await gmailApi.users.messages.get('me', message.id!);
        emailList.add(email);
      }

      return emailList;
    } catch (e) {
      print('Error fetching official notices: $e');
      return [];
    }
  }
}
