import 'package:flutter/material.dart';
import 'package:modern_music_player/components/snackbar.dart';

class NotImplementedAction {
  NotImplementedAction({required BuildContext context}) {
    ShowSnackbar(
        context: context, message: 'Action unimplemented');
  }
}