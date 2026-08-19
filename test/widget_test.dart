import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:timepass/main.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    HttpOverrides.global = null;
    FlutterError.onError = (FlutterErrorDetails details) {
      if (details.exception is NetworkImageLoadException) {
        return;
      }
      FlutterError.presentError(details);
    };

    await tester.pumpWidget(const StitchApp());
    expect(find.text('Stitch'), findsWidgets);
  });
}
