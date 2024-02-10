import 'package:flutter/material.dart';

List<Color> earthyTones = [
  const Color(0xFF8b5d2e), // Brown
  const Color(0xFF1e4720), // Forest Green
  const Color(0xFFa68b48), // Tan
  const Color(0xFF524c42), // Olive
  const Color(0xFF635d4c), // Taupe
];
List<Color> softPastels = [
  const Color(0xFFffc0cb), // Pink
  const Color(0xFF98fb98), // Pale Green
  const Color(0xFFf0e68c), // Khaki
];
List<Color> warmSunset = [
  const Color(0xFFff7f50), // Coral
  const Color(0xFFfd5e53), // Red-Orange
];
List<Color> oceanBlues = [
  const Color(0xFF4682b4), // Steel Blue
  const Color(0xFF6495ed), // Cornflower Blue
  const Color(0xFF87ceeb), // Sky Blue
];
List<Color> grayscaleNeutrals = [
  const Color(0xFFc0c0c0), // Silver
  const Color(0xFFa9a9a9), // Dark Gray
  const Color(0xFF808080), // Gray
];

final List<Color> allBgColors = [
  ...earthyTones,
  ...softPastels,
  ...warmSunset,
  ...oceanBlues,
  ...grayscaleNeutrals
];
