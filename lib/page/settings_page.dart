import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
appBar: AppBar(
  scrolledUnderElevation: 0,
  backgroundColor: Colors.transparent,
  elevation: 0,
  foregroundColor: Colors.grey,
  centerTitle: true,

  title: Text("Settings"),
),
    );
  }
}
