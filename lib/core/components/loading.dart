import 'package:flutter/material.dart';

Widget buildLoading({double? height}) {
  return Container(
    height: height,
    alignment: Alignment.center,
    child: const CircularProgressIndicator(),
  );
}
