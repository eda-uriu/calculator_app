import 'package:calculator_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculator 単体テスト', () {
    test('addメソッド', () {
      // Arrange
      Calculator calculator = Calculator();

      // Assert (事前の確認)
      // resultが0であることを確認
      expect(calculator.result, equals(0.0));

      // Act
      calculator.add(5.0);

      // Assert
      expect(calculator.result, equals(5.0));
    });

    test('subtractメソッド', () {
      // Arrange
      Calculator calculator = Calculator();

      // Assert (事前の確認)
      // resultが0であることを確認
      expect(calculator.result, equals(0.0));

      // Act
      calculator.subtract(3.0);

      // Assert
      expect(calculator.result, equals(-3.0));
    });

    test('resetメソッド', () {
      Calculator calculator = Calculator();

      // Act (事前の実行)
      // resultに5.0を足す
      calculator.add(5.0);
      // Assert (事前の確認)
      // resultが5.0であることを確認
      expect(calculator.result, equals(5.0));

      // Act
      calculator.reset();

      // Assert
      expect(calculator.result, equals(0.0));
    });
  });
}
