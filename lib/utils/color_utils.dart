import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class ColorUtils {
  // Calculate dominant color from ImageProvider
  static Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor?.color ?? Colors.white;
  }

  static Color getInvertColor(Color color) {
    final r = 255 - color.red;
    final g = 255 - color.green;
    final b = 255 - color.blue;

    return Color.fromARGB((color.opacity * 255).round(), r, g, b);
  }
}
