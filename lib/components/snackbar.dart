import 'package:flutter/material.dart';

class ShowSnackbar {
  ShowSnackbar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}