extension IntExtension on int {
  /// Extension to format the number to K or M
  ///
  /// Example - 1000 -> 1K, 1000000 -> 1M
  String get asFormattedValue {
    if (this < 1000) {
      return toString();
    } else if (this < 1000000) {
      return '${(this / 1000).toStringAsFixed(1)}K';
    } else {
      return '${(this / 1000000).toStringAsFixed(1)}M';
    }
  }
}
