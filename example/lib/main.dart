import 'package:flutter/material.dart';
import 'package:azure_communication_calling/azure_communication_calling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formKey = GlobalKey<FormState>();

  final chatTokenTextController = TextEditingController();
  final roomIdTextController = TextEditingController();
  final displayNameTextController = TextEditingController();

  @override
  void initState() {
    super.initState();

    chatTokenTextController.text =
    "eyJhbGciOiJSUzI1NiIsImtpZCI6IjZDODBDMjc5MUZBMEVCODczMDI2NzlFRDhFQzFDRTE5OTNEQTAwMjMiLCJ4NXQiOiJiSURDZVItZzY0Y3dKbm50anNIT0daUGFBQ00iLCJ0eXAiOiJKV1QifQ.eyJza3lwZWlkIjoiYWNzOmFkMDNjYWU0LWE1NTItNDU5ZS1iZjhlLWUzZjA1MmI1NGU3N18wMDAwMDAyOC1iYTZjLWQxYWEtNDY2Ny00NDNhMGQwMDU5NzgiLCJzY3AiOjE3OTIsImNzaSI6IjE3NTY1NTM1MDQiLCJleHAiOjE3NTY1NTcxMDQsInJnbiI6ImNoIiwiYWNzU2NvcGUiOiJjaGF0LHZvaXAiLCJyZXNvdXJjZUlkIjoiYWQwM2NhZTQtYTU1Mi00NTllLWJmOGUtZTNmMDUyYjU0ZTc3IiwicmVzb3VyY2VMb2NhdGlvbiI6InN3aXR6ZXJsYW5kIiwiaWF0IjoxNzU2NTUzNTA0fQ.ZfUshUoXmFk44YlUJ6fgjdH6v3dn8O_sek93voCEdcWAdK5rWyK6HK8J3iKnSrRWpIvCP42LtWuXSeskpXQX3DxH5_LD5Vj7WvqzxtiLQO2CbPYALW9dPsSswIv58imn7ezOikd90UMaT0DFnPpCW-tgcEAr-x4aAc-moZtR-ulVZtKYB5I1KgC4aymaauYbpf79Wn3nAC792QUzpZVBCilWezL4kRAQSUbRB-4lZzRVUr5dTycpBV7SrmRlQzVtuibk7PpZcdY-OiCQVp-QQZmL5w88P4bzYEDA2DodqHqFdCfO98Typckey5l-ZopRLJxS8poRxhenBkiwmMhe1A";

    roomIdTextController.text = "99582882923860041";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Azure Communication Calling example app'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      height: 200,
                      child: TextFormField(
                        controller: chatTokenTextController,
                        decoration: InputDecoration(
                          label: Text("Chat Token"),
                          border: OutlineInputBorder(),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        expands: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Chat Token";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        controller: roomIdTextController,
                        decoration: InputDecoration(
                          label: Text("Room Id"),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Room Id";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: TextFormField(
                        controller: displayNameTextController,
                        decoration: InputDecoration(
                          label: Text("Display Name"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();

                  if (formKey.currentState!.validate()) {
                    final chatToken = chatTokenTextController.text;
                    final roomId = roomIdTextController.text;
                    final displayName = displayNameTextController.text;

                    final error = await AzureCommunicationCalling().startCall(
                      chatToken: chatToken,
                      roomId: roomId,
                      displayName: displayName,
                    );

                    if (error != null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Start Chat Fail"),
                            content: Text(error),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  }
                },
                child: Text("Start Call"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
