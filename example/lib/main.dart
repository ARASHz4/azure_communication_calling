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
              child: ElevatedButton.icon(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();

                  if (formKey.currentState!.validate()) {
                    final String chatToken = chatTokenTextController.text;
                    final String roomId = roomIdTextController.text;
                    final String displayName = displayNameTextController.text;

                    final String? error = await AzureCommunicationCalling().startCall(
                      chatToken: chatToken,
                      roomId: roomId,
                      displayName: displayName,
                    );

                    if (error != null) {
                      showError(title: "Start Chat Fail", error: error);
                    }
                  }
                },
                label: Text("Start Call"),
                icon: Icon(Icons.call),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showError({required String title, required String error}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
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
