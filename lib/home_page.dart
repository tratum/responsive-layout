import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    if (ResponsiveWebLayout.isSdLayout(context: context)) print("----------------------SD layout");
    if(ResponsiveWebLayout.isHdLayout(context: context)) print("-----------------------HD Layout");
    if(ResponsiveWebLayout.isFullHDLayout(context: context)) print("-------------------Full HD Layout");
    if(ResponsiveWebLayout.isQuadHDLayout(context: context)) print("------------------Quad Layout");
    if(ResponsiveWebLayout.isHighResTabletLayout(context: context)) print("----------------High Res Tablet");
    if(ResponsiveWebLayout.isStandardTabletLayout(context: context)) print("----------------SD Tablet");
    if(ResponsiveWebLayout.isSmallMobileLayout(context: context)) print("-------------------Small Mobile Layout");
    if(ResponsiveWebLayout.isMediumMobileLayout(context: context)) print("------------------Medium Mobile Layout");
    if(ResponsiveWebLayout.isLargeMobileLayout(context: context)) print("-------------------Large Mobile Layout");
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive Layout Example')),
      body: ResponsiveWebLayout.buildPlatformSpecificLayout(
        context: context,
        quadHDLayout: _buildLayoutContainer("Quad HD Desktop Layout", Colors.red),
        fullHDLayout: _buildLayoutContainer("Full HD Desktop Layout", Colors.green),
        hdLayout: _buildLayoutContainer("HD Desktop Layout", Colors.blue),
        sdLayout: _buildLayoutContainer("SD Desktop Layout", Colors.yellow),
        largeMobileLayout: _buildLayoutContainer("Large Mobile Layout", Colors.pink),
        mediumMobileLayout: _buildLayoutContainer("Medium Mobile Layout", Colors.teal),
        smallMobileLayout: _buildLayoutContainer("Small Mobile Layout", Colors.indigo),
        highResTabletLayout: _buildLayoutContainer("High Resolution Tablet Layout", Colors.orange),
        standardTabletLayout: _buildLayoutContainer("Standard Resolution Tablet Layout", Colors.purple),
      ),
    );
  }

  Widget _buildLayoutContainer(String text, Color color) {
    return Container(
      alignment: Alignment.center,
      color: color,
      child: Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
