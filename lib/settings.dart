import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SETTINGS',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSettingItem(
              context,
              'Edit Profile',
              Icons.person_outline,
              onTap: () {
                // Handle Edit Profile
              },
            ),
            buildSettingItem(
              context,
              'Notification Settings',
              Icons.notifications_none,
              onTap: () {
                // Handle Notification Settings
              },
            ),
            buildSettingItem(
              context,
              'Address Change',
              Icons.location_on,
              onTap: () {
                // Handle Address Change
              },
            ),
            buildSettingItem(
              context,
              'Select Language',
              Icons.language,
              onTap: () {
                // Handle Select Language
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSettingItem(BuildContext context, String title, IconData icon,
      {VoidCallback? onTap}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Theme
                  .of(context)
                  .cardColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 24.0,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                    SizedBox(width: 16.0),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Theme
                            .of(context)
                            .textTheme
                            .bodyText1!
                            .color,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18.0,
                  color: Theme
                      .of(context)
                      .colorScheme
                      .secondary,
                ),
              ],
            ),
          ),
        ),
        Divider(height: 0), // Added Divider
      ],
    );
  }
}