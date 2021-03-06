import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds ancestor', (WidgetTester tester) async {
    await tester.pumpWidget(
      Container(
        child: Opacity(
          opacity: 0.5,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Text('hello'),
          ),
        ),
      ),
    );

    expect(
        tester
            .widget<Opacity>(
              find.ancestor(
                of: find.text('hello'),
                matching: find.byType(Opacity),
              ),
            )
            .opacity,
        0.5);
  });
}
