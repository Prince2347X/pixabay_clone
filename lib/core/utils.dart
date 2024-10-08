class Utilities {
  /// To decide the number of columns based on the screen width
  static int calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 1200) {
      return 5;
    } else if (screenWidth > 900) {
      return 4;
    } else if (screenWidth > 600) {
      return 3;
    } else {
      return 2;
    }
  }
}
