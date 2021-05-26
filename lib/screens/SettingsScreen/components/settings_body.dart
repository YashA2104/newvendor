

import 'package:flutter/material.dart';
import 'package:vendor/components/buttons.dart';

class SettingsBody extends StatefulWidget {
  const SettingsBody({Key key}) : super(key: key);

  @override
  _SettingsBodyState createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  bool value1 = true;
  bool value2 = true;
  bool value3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSwitch('Notifications', 'Enable notifications', value1,
            (newValue) {
          setState(() {
            value1 = newValue;
          });
        }, context),
        _buildSwitch(
            'Show Success', 'Shows that order is successfully placed', value2,
            (newValue) {
          setState(() {
            value2 = newValue;
          });
        }, context),
        _buildSwitch(
            'Enable Premium', 'Get premium services and offers', value3,
            (newValue) {
          setState(() {
            value3 = newValue;
          });
        }, context),
        Spacer(),
        Spacer(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Button(inputText: 'Save Changes')),
        Spacer()
      ],
    );
  }
}

Widget _buildSwitch(String title, String descripton, bool val,
    Function updateValue, BuildContext ctx) {
  return SwitchListTile(
    activeColor: Theme.of(ctx).primaryColor,
    title: Text(title),
    subtitle: Text(descripton),
    value: val,
    onChanged: updateValue,
  );
}
