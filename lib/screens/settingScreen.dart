import 'dart:async';

import 'package:flutter/material.dart';
import 'package:funfacts/screens/widgets/themeSwitcher.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [Themeswitcher()],
      ),
    );
  }
}
