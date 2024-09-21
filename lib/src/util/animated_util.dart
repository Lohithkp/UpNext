import 'dart:ui';

class AnimatedUtil {
  static List<Color> generateColors(int count) {
    List<Color> colors = [];
    for (int i = 0; i < count; i++) {
      if (i % 3 == 0) {
        colors.add(const Color.fromRGBO(231, 129, 109, 1.0)); // Color 1
      } else if (i % 3 == 1) {
        colors.add(const Color.fromRGBO(99, 138, 223, 1.0)); // Color 2
      } else {
        colors.add(const Color.fromRGBO(111, 194, 173, 1.0)); // Color 3
      }
    }
    return colors;
  }

  static List<Color> generateColorsnew(int count) {
    List<Color> colors = [];
    List<Color> colorPalette = [
      const Color.fromRGBO(231, 129, 109, 1.0), // Color 1
      const Color.fromRGBO(99, 138, 223, 1.0), // Color 2
      const Color.fromRGBO(111, 194, 173, 1.0), // Color 3
      const Color.fromRGBO(255, 193, 7, 1.0), // Color 4 (Amber)
      const Color.fromRGBO(76, 175, 80, 1.0), // Color 5 (Green)
      const Color.fromRGBO(156, 39, 176, 1.0), // Color 6 (Purple)
      const Color.fromRGBO(33, 150, 243, 1.0), // Color 7 (Blue)
    ];

    for (int i = 0; i < count; i++) {
      colors.add(colorPalette[
          i % colorPalette.length]); // Cycle through the color palette
    }
    return colors;
  }
}
