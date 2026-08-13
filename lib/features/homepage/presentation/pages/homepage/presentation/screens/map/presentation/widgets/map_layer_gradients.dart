import 'package:flutter/material.dart';

Widget buildGradients() {
  return Column(
    mainAxisAlignment: .spaceBetween,
    children: [
      //Top gradient(Protects search bar)
      Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white.withOpacity(0.6), Colors.transparent],
          ),
        ),
      ),
      //Bottom gradient(Protects Details card)
      Container(
        height: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.white.withOpacity(0.4), Colors.transparent],
          ),
        ),
      ),
    ],
  );
}
