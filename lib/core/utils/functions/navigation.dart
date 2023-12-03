import 'package:flutter/material.dart';

void naviPushNamed(BuildContext context,String path){
  Navigator.of(context).pushNamed(path);
}
void naviPushReplacementNamed(BuildContext context,String path){
  Navigator.of(context).pushReplacementNamed(path);
}