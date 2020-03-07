import 'package:flutter/material.dart';



BoxDecoration custonDecoraton = BoxDecoration(
  color: Colors.grey.shade100,
  borderRadius: BorderRadius.circular(10),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.075),
      offset: Offset(10, 10),
      blurRadius: 10,
    ),
    BoxShadow(
      color: Colors.white,
      offset: Offset(-10.0, -10.0),
      blurRadius: 10,
    ),
  ],
);
