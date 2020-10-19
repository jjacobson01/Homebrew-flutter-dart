class CoffeeTools {
  // Input: number of cups (positive integer)
  // Output: number of ounces in a cup

  static int cupsToOunces(int cups) {
    if (cups <= 0) {
      throw ArgumentError();
    }
    return cups * 6;
  }

  static double water(int oz) {
    double grams = oz * 177.42;
    return grams;
  }

  static double french(int oz) {
    double grams = oz * 177.42;
    return grams / 14;
  }

  static double drip(int oz) {
    double grams = oz * 177.42;
    return grams / 17;
  }
}
