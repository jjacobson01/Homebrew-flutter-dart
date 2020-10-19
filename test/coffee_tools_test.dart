import 'package:homebrew/utils/coffee_tools.dart';
import 'package:test/test.dart';

void main() {
  group("easy calculations", () {
    test('does calculation of grams with 1 cup of water', () {
      double water = CoffeeTools.water(1);
      expect(water, 177.42);
    });
    test('does calculation of grams with 2 cups of water', () {
      double water = CoffeeTools.water(2);
      expect(water, 354.84);
    });

    test('does calculation of 1 cup of French Press', () {
      double french = CoffeeTools.french(1);
      expect(french, 12.672857142857142);
    });
    test('does calculation of 2 cups of French Press', () {
      double french = CoffeeTools.french(2);
      expect(french, 25.345714285714283);
    });

    test('does calculation of 1 cup of Drip Machine', () {
      double drip = CoffeeTools.drip(1);
      expect(drip, 10.436470588235293);
    });
    test('does calculation of 2 cups of Drip Machine', () {
      double drip = CoffeeTools.drip(2);
      expect(drip, 20.872941176470587);
    });
  });
}
