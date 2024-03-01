# responsive-layout

![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)
<!-- ![Pub Version](https://img.shields.io/pub/v/breadcrumbs_web.svg) -->

A Flutter package for creating responsive layouts for web,tablet and mobile applications. `responsive-layout` simplifies the process of building adaptive UIs in Flutter, allowing developers to create designs that seamlessly adjust to various screen sizes and orientations.

## Features

- **Responsive Design:** Easily create layouts that adapt to different screen sizes and orientations.

- **Fully Customizable:** It's up to you how you want to customize the UI for different layouts as it only requires a single widget for every different layout.

- **Web and Mobile Support:** Works seamlessly on web,tablet and mobile platforms, ensuring consistent user experiences across devices.

- **Media Queries:** Integrate media queries to apply specific styles based on device characteristics, such as screen width and height.

- **Flexibility:** Offers flexibility and compfort in designing complex UIs, including multi-column layouts, grid systems, and responsive navigation.

## Getting Started

To use this package, add `responsive_layout`  as a dependency in your pubspec.yaml file.

```yaml
dependencies:
responsive_layout: ^1.0.0
```

To use this package for specifically the web platform, add `responsive_web_layout`  as a dependency in your pubspec.yaml file.

```yaml
dependencies:
responsive_web_layout: ^1.0.0
```

To use this package for specifically the mobile platform, add `responsive_mobile_layout` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
responsive_mobile_layout: ^1.0.0
```

To use this package for specifically the tablet platform, add `responsive_tablet_layout` as a dependency in your pubspec.yaml file.

```yaml
dependencies:
responsive_tablet_layout: ^1.0.0
```

## Usage

Here is a quick example to get you started:

```dart

import 'package:flutter/material.dart';
import 'package:responsive_web_layout/responsive_web_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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

```

## Contributing

Contributions are welcome! If you have a feature request or bug report, please open an issue on our
GitHub repository.

## License

This project is licensed under the MIT License- see the LICENSE file for details.
