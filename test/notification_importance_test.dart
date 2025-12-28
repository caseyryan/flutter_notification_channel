import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_notification_channel/notification_importance.dart';

void main() {
  group('NotificationImportance', () {
    test('should have correct constant values', () {
      expect(NotificationImportance.IMPORTANCE_MIN, equals(1));
      expect(NotificationImportance.IMPORTANCE_LOW, equals(2));
      expect(NotificationImportance.IMPORTANCE_DEFAULT, equals(3));
      expect(NotificationImportance.IMPORTANCE_HIGH, equals(4));
      expect(NotificationImportance.IMPORTANCE_MAX, equals(5));
    });

    test('should have IMPORTANCE_MAX as highest value', () {
      final allImportanceLevels = [
        NotificationImportance.IMPORTANCE_MIN,
        NotificationImportance.IMPORTANCE_LOW,
        NotificationImportance.IMPORTANCE_DEFAULT,
        NotificationImportance.IMPORTANCE_HIGH,
        NotificationImportance.IMPORTANCE_MAX,
      ];

      expect(NotificationImportance.IMPORTANCE_MAX,
          equals(allImportanceLevels.reduce((a, b) => a > b ? a : b)));
    });

    test('should maintain proper ordering', () {
      expect(NotificationImportance.IMPORTANCE_MIN,
          lessThan(NotificationImportance.IMPORTANCE_LOW));
      expect(NotificationImportance.IMPORTANCE_LOW,
          lessThan(NotificationImportance.IMPORTANCE_DEFAULT));
      expect(NotificationImportance.IMPORTANCE_DEFAULT,
          lessThan(NotificationImportance.IMPORTANCE_HIGH));
      expect(NotificationImportance.IMPORTANCE_HIGH,
          lessThan(NotificationImportance.IMPORTANCE_MAX));
    });
  });
}
