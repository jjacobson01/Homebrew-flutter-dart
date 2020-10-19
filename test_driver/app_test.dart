// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "French Press"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "63g - course ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for French Press", () async {
      //find the specific strings and assign them into variables.
      final french = find.byValueKey('French');
      final cont1 = find.byValueKey('Continue');
      final cups = find.byValueKey('Cups');
      final cont2 = find.byValueKey('Continue2');
      final done = find.byValueKey('Done');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');

      //will select french press option and then move to cups page
      await driver.tap(french);
      await driver.tap(cont1);

      //on cups page will open number keyboard and select number 5
      //then will continue to recommend page
      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(cont2);

      //we expect to see the right calculations from above comments
      expect(await driver.getText(coffee), "63g - course ground coffee");
      expect(await driver.getText(water), "887g - water");

      //resets to coffee device selection page
      await driver.tap(done);
      await Future.delayed(const Duration(seconds: 1));
    });

    /*
      Given I am on the Coffee Device Selection Screen
      When I tap "Drip Machine"
      And I tap "Continue"
      And I enter "5"
      And I tap "Continue"
      Then I should see "52g - medium ground coffee"
      And I should see "887g - water"
    */
    test("should give recommendation for Drip Machine", () async {
      //find the specific strings and assign them into variables.
      final drip = find.byValueKey('Drip');
      final cont1 = find.byValueKey('Continue');
      final cups = find.byValueKey('Cups');
      final cont2 = find.byValueKey('Continue2');
      final done = find.byValueKey('Done');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');

      //will select french press option and then move to cups page
      await driver.tap(drip);
      await driver.tap(cont1);

      //on cups page will open number keyboard and select number 5
      //then will continue to recommend page
      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(cont2);

      //we expect to see the right calculations from above comments
      expect(await driver.getText(coffee), "52g - medium ground coffee");
      expect(await driver.getText(water), "887g - water");

      //resets to coffee device selection page
      await driver.tap(done);
      await Future.delayed(const Duration(seconds: 1));
    });
  });

  group('Sad Paths', () {
    /*
      Given I am on the Coffee Device Selection Screen
      When I press "French Press" option 2 times
      and I press "Continue"
      and I press "Drip Machine" 2 times
      and I press "Continue"
      Then I expect to still be on the Coffee Device Selection Screen
    */
    test("should not advance from Choose Device Screen without a selection",
        () async {
      final deviceScreen = find.byValueKey('deviceScreen');
      final french = find.byValueKey('French');
      final drip = find.byValueKey('Drip');
      final cont1 = find.byValueKey('Continue');

      //this will press French Press option 2 times, and then will try and press continue.
      await driver.tap(french);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(french);
      await driver.tap(cont1);
      await Future.delayed(const Duration(seconds: 1));
      //this will press Drip Machine option 2 times, and then will try and press continue.
      await driver.tap(drip);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(drip);
      await driver.tap(cont1);
      await Future.delayed(const Duration(seconds: 1));

      //should stay on Device Selection screen.
      expect(await driver.getText(deviceScreen),
          "What coffee maker are you using?");
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      final french = find.byValueKey('French');
      final cont1 = find.byValueKey('Continue');
      final cont2 = find.byValueKey('Continue2');
      final cupScreen = find.byValueKey('cupScreen');
      final backBtn = find.byValueKey('backButton');

      //This will press the French Press option, continue to the next page and will
      //immediatelly press continue.
      await driver.tap(french);
      await driver.tap(cont1);
      await driver.tap(cont2);

      //should stay on the Cup screen.
      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );
      await Future.delayed(const Duration(seconds: 1));
      //go back to device screen
      await driver.tap(backBtn);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "0"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with zero cup amount",
        () async {
      final cont1 = find.byValueKey('Continue');
      final cups = find.byValueKey('Cups');
      final cont2 = find.byValueKey('Continue2');
      final cupScreen = find.byValueKey('cupScreen');
      final backBtn = find.byValueKey('backButton');

      await driver.tap(cont1);
      await driver.tap(cups);
      await driver.enterText('0');
      await driver.waitFor(find.text('0'));
      await driver.tap(cont2);

      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(backBtn);
    });

    /*
      Given I chose "French Press" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    //WILL NOT USE AS KEYBOARD IS NUMBER USE ONLY
    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () {
      //your code here
      //if you can restrict the keyboard to numbers only you can delete this test
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen without cups", () async {
      final drip = find.byValueKey('Drip');
      final cont1 = find.byValueKey('Continue');
      final cont2 = find.byValueKey('Continue2');
      final cupScreen = find.byValueKey('cupScreen');
      final backBtn = find.byValueKey('backButton');

      //This will press the French Press option, continue to the next page and will
      //immediatelly press continue.
      await driver.tap(drip);
      await driver.tap(cont1);
      await driver.tap(cont2);

      //should stay on the Cup screen.
      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );
      await Future.delayed(const Duration(seconds: 1));
      //go back to device screen
      await driver.tap(backBtn);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "0"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    test("should not advance from Choose Cups Screen with zero cup amount",
        () async {
      final cont1 = find.byValueKey('Continue');
      final cups = find.byValueKey('Cups');
      final cont2 = find.byValueKey('Continue2');
      final cupScreen = find.byValueKey('cupScreen');
      final backBtn = find.byValueKey('backButton');

      await driver.tap(cont1);
      await driver.tap(cups);
      await driver.enterText('0');
      await driver.waitFor(find.text('0'));
      await driver.tap(cont2);

      expect(
        await driver.getText(cupScreen),
        "How many cups would you like?",
      );
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(backBtn);
    });

    /*
      Given I chose "Drip Machine" on the Coffee Device Selection Screen
      And I advanced to the Choose Cups Screen
      When I enter "a"
      And I press "Continue"
      Then I expect to still be on the Choose Cups Screen
    */
    //DID NOT RUN AS THE KEYBOARD IS NUMBER USE ONLY
    test(
        "should not advance from Choose Cups Screen with letter for cup amount",
        () {
      //your code here
      //if you can restrict the keyboard to numbers only you can delete this test
    });
  });

  group('Back Button', () {
    test("Should advance to end of screen, then back two times to start screen",
        () async {
      final french = find.byValueKey('French');
      final cont1 = find.byValueKey('Continue');
      final cups = find.byValueKey('Cups');
      final cont2 = find.byValueKey('Continue2');
      final coffee = find.byValueKey('Coffee');
      final water = find.byValueKey('Water');
      final backBtn = find.byValueKey('backButton');
      final backBtn1 = find.byValueKey('backButton1');

      //will select french press option and then move to cups page
      await driver.tap(french);
      await driver.tap(cont1);

      //on cups page will open number keyboard and select number 5
      //then will continue to recommend page
      await driver.tap(cups);
      await driver.enterText('5');
      await driver.waitFor(find.text('5'));
      await driver.tap(cont2);

      //we expect to see the right calculations from above comments
      expect(await driver.getText(coffee), "63g - course ground coffee");
      expect(await driver.getText(water), "887g - water");
      await Future.delayed(const Duration(seconds: 1));

      //go back to beginning screen by pressing back two times
      await driver.tap(backBtn1);
      await Future.delayed(const Duration(seconds: 2));
      await driver.tap(backBtn);
    });
  });
}
