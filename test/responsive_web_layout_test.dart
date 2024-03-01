import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

void main() {
  group('ResponsiveWebLayout Tests', () {
    testWidgets('Desktop Layout Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ResponsiveWebLayout.buildDesktopLayout(
                context: context,
                quadHDLayout: _buildContainer('Quad HD Layout', Colors.red),
                fullHDLayout: _buildContainer('Full HD Layout', Colors.green),
                hdLayout: _buildContainer('HD Layout', Colors.blue),
                sdLayout: _buildContainer('SD Layout', Colors.yellow),
              );
            },
          ),
        ),
      );

      expect(find.text('Quad HD Layout'), findsOneWidget);
      expect(find.text('Full HD Layout'),
          findsNothing); // Should not be visible on desktop
      expect(find.text('HD Layout'),
          findsNothing); // Should not be visible on desktop
      expect(find.text('SD Layout'),
          findsNothing); // Should not be visible on desktop
    });

    testWidgets('Tablet Layout Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ResponsiveWebLayout.buildTabletLayout(
                context: context,
                highResTabletLayout:
                    _buildContainer('High Res Tablet Layout', Colors.orange),
                standardTabletLayout:
                    _buildContainer('Standard Tablet Layout', Colors.purple),
              );
            },
          ),
        ),
      );

      expect(find.text('High Res Tablet Layout'), findsOneWidget);
      expect(find.text('Standard Tablet Layout'),
          findsNothing); // Should not be visible on tablets
    });

    testWidgets('Mobile Layout Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ResponsiveWebLayout.buildMobileLayout(
                context: context,
                largeMobileLayout:
                    _buildContainer('Large Mobile Layout', Colors.pink),
                mediumMobileLayout:
                    _buildContainer('Medium Mobile Layout', Colors.teal),
                smallMobileLayout:
                    _buildContainer('Small Mobile Layout', Colors.indigo),
              );
            },
          ),
        ),
      );

      expect(find.text('Large Mobile Layout'), findsOneWidget);
      expect(find.text('Medium Mobile Layout'),
          findsNothing); // Should not be visible on large mobiles
      expect(find.text('Small Mobile Layout'),
          findsNothing); // Should not be visible on large mobiles
    });

    testWidgets('Platform Specific Layout Test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (BuildContext context) {
              return ResponsiveWebLayout.buildPlatformSpecificLayout(
                context: context,
                quadHDLayout: _buildContainer('Quad HD Layout', Colors.red),
                fullHDLayout: _buildContainer('Full HD Layout', Colors.green),
                hdLayout: _buildContainer('HD Layout', Colors.blue),
                sdLayout: _buildContainer('SD Layout', Colors.yellow),
                largeMobileLayout:
                    _buildContainer('Large Mobile Layout', Colors.pink),
                mediumMobileLayout:
                    _buildContainer('Medium Mobile Layout', Colors.teal),
                smallMobileLayout:
                    _buildContainer('Small Mobile Layout', Colors.indigo),
                highResTabletLayout:
                    _buildContainer('High Res Tablet Layout', Colors.orange),
                standardTabletLayout:
                    _buildContainer('Standard Tablet Layout', Colors.purple),
              );
            },
          ),
        ),
      );

      // Assuming a standard tablet width
      expect(find.text('High Res Tablet Layout'),
          findsNothing); // Should not be visible on tablets
      expect(find.text('Standard Tablet Layout'), findsOneWidget);
      expect(find.text('Large Mobile Layout'),
          findsNothing); // Should not be visible on large mobiles
      expect(find.text('Medium Mobile Layout'),
          findsNothing); // Should not be visible on large mobiles
      expect(find.text('Small Mobile Layout'),
          findsNothing); // Should not be visible on large mobiles
    });
  });
}

Widget _buildContainer(String text, Color color) {
  return Container(
    alignment: Alignment.center,
    color: color,
    child: Text(
      text,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
  );
}
