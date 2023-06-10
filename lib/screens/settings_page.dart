import 'package:flutter/material.dart';
import 'package:modern_music_player/components/heading.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const id = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeadingWidget(text: 'Settings'),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: ListTile(
                  onTap: () {
                    showDialogBox();
                  },
                  leading: const Icon(Icons.color_lens_rounded),
                  title: const Text('Change Background Color'),
                  subtitle:
                      const Text('Choose from many shades of purple color.'),
                ),
              ),
              ElevatedButton(onPressed: (){
                showLicensePage(context: context, applicationName: 'Modern Music Player',applicationVersion: 'v1.0.0');
              }, child: const Text('Open Source Licenses'))
            ],
          ),
        ),
      ),
    );
  }

  void showDialogBox() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Background color'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Apply'),
            ),
          ],
        );
      },
    );
  }
}
