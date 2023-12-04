import 'package:flutter/material.dart';

void unfocusOnTapOutside(event) {
    FocusManager.instance.primaryFocus!.unfocus();
  }