import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/darkTheme.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isNotificationAllowed = false;
  bool isMobileDataAllowed = false;
  bool isWifiOnlyAllowed = false;
  bool isDarkTheme = false;
  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<darktheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Back", ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            buildToggleSwitch("Allow notifications", isNotificationAllowed,
                    (value) {
                  setState(() {
                    isNotificationAllowed = value;
                  });
                },Icons.notifications

            ),
            buildToggleSwitch(
                "Use mobile data with download", isMobileDataAllowed, (value) {
              setState(() {
                isMobileDataAllowed = value;
              });
            },
                Icons.signal_cellular_alt
            ),
            buildToggleSwitch("Use only WiFi with download", isWifiOnlyAllowed,
                    (value) {
                  setState(() {
                    isWifiOnlyAllowed = value;
                  });
                },
                Icons.wifi),
            buildToggleSwitch("Upply dark theme", isDarkTheme,
                    (value) {
                  setState(() {
                    isDarkTheme = value;
                    provider.change();
                  }
                  );
                },Icons.dark_mode),
          ],
        ),
      ),
    );
  }

  Widget buildToggleSwitch(String label, bool switchValue, ValueChanged<bool> onChanged,IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(icon),
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: Colors.green,
        ),
      ],
    );
  }
}
