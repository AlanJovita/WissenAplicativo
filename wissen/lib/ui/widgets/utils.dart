import 'package:flutter/material.dart';

showPage(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}
