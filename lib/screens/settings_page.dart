import 'package:flutter/material.dart';
import 'package:modern_music_player/components/heading.dart';
import 'package:modern_music_player/provider/change_theme_provider.dart';
import 'package:modern_music_player/theme/background_colors.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const id = '/settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int themeSelectedIndex = 0;
  ChangeThemeProvider? changeThemeProvider;

  @override
  void initState() {
    super.initState();
    themeSelectedIndex = StaticTheme.themeSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChangeThemeProvider>(
      builder: (context, ChangeThemeProvider value, child) {
        changeThemeProvider = value;

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
                      subtitle: const Text(
                          'Choose from many shades of purple color.'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showLicensePage(
                            context: context,
                            applicationName: 'Modern Music Player',
                            applicationVersion: 'v1.0.0');
                      },
                      child: const Text('Open Source Licenses'))
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Display dialog box for applying a theme
  void showDialogBox() {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, Function setState) {
            return AlertDialog(
              scrollable: true,
              title: const Text('Background color'),
              content: Column(
                children: List.generate(
                  BackgroundColorsData.colors.length,
                  (index) {
                    return RadioListTile(
                      value: index,
                      title: Text(BackgroundColorsData.colors[index].shade),
                      secondary: CircleAvatar(
                          backgroundColor:
                              BackgroundColorsData.colors[index].color),
                      groupValue: themeSelectedIndex,
                      onChanged: (value) {
                        setState(() {
                          themeSelectedIndex = value!;
                        });
                      },
                    );
                  },
                ),
              ),
              actions: dialogBoxActions(),
            );
          },
        );
      },
    );
  }

  // Apply Theme or cancel dismiss.
  List<Widget> dialogBoxActions() {
    return [
      TextButton(
        onPressed: () {
          themeSelectedIndex = StaticTheme.themeSelectedIndex;
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: () {
          applyBackgroundTheme();
        },
        child: const Text('Apply'),
      ),
    ];
  }

  // Apply theme color and notify to provider
  void applyBackgroundTheme() {
    setState(() {
      StaticTheme.themeSelectedIndex = themeSelectedIndex;
      changeThemeProvider!.changeTheme();
    });
    Navigator.of(context).pop();
  }
}
