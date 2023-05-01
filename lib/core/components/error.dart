import 'package:flutter/material.dart';

Widget buildError({String? message, double? height}) {
  return Container(
    height: height,
    alignment: Alignment.center,
    child: Text(message ?? ''),
  );
}
