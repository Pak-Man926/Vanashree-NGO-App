import 'package:flutter/material.dart';

final accountItems = [
  AccountItems(icon: Icons.person_outline, title: "Edit Profile"),
  AccountItems(
    icon: Icons.phone_android_outlined,
    title: "Change Mobile Number",
  ),
  AccountItems(icon: Icons.logout, title: "Log out"),
];

final aboutAppItems = [
  AccountItems(icon: Icons.info_outline, title: "About Vanasree"),
  AccountItems(icon: Icons.help_center_outlined, title: "Help & Supprot"),
  AccountItems(
    icon: Icons.phone_iphone_outlined,
    title: "App Version",
    value: null,
  ),
];

class AccountItems {
  final IconData icon;
  final String title;
  final String? value;

  AccountItems({required this.icon, required this.title, this.value});
}
