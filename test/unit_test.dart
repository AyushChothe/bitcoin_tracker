import 'package:bitcoin_tracker/models/bitcoin_chart.dart';
import 'package:bitcoin_tracker/models/currency.dart';
import 'package:bitcoin_tracker/providers/coindesk_api.dart';
import 'package:bitcoin_tracker/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  group("Coindesk API Tests", () {
    test("/currentprice.json should respond", () async {
      final ref = ProviderContainer();
      final coindeskCtrl = ref.read(coindeskCtrlProvider);
      expect(await coindeskCtrl.getCurrentBthPrice(), isA<BitcoinChart>());
    });

    test(
        "getCurrentPriceForCurrency should return"
        "Currency for vaild currency and null for invalid currency", () async {
      final ref = ProviderContainer();
      final coindeskCtrl = ref.read(coindeskCtrlProvider);

      /// List of valid currencies
      for (final currency in currencyList) {
        expect(await coindeskCtrl.getCurrentPriceForCurrency(currency),
            isA<Currency>());
      }

      /// Invalid currency
      expect(await coindeskCtrl.getCurrentPriceForCurrency("INR"), null);
    });
  });
}
