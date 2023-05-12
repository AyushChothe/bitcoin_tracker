import 'package:bitcoin_tracker/models/bitcoin_chart.dart';
import 'package:bitcoin_tracker/models/currency.dart';
import 'package:bitcoin_tracker/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// [CoindeskController] instance provider
final coindeskCtrlProvider = Provider((ref) => CoindeskController());

class CoindeskController {
  final _dio = Dio(BaseOptions(baseUrl: baseUrl));

  /// Gets current Bitcoin price from endpoint and parses it to [BitcoinChart]
  Future<BitcoinChart> getCurrentBthPrice() async {
    final res = await _dio.get(currentPriceEndpoint);
    return BitcoinChart.fromRawJson(res.data);
  }

  /// Gets current Bitcoin price and returns the [Currency] if valid
  Future<Currency?> getCurrentPriceForCurrency(String currency) async {
    if (currency.isEmpty) return null;
    final chart = await getCurrentBthPrice();
    return switch (currency) {
      'EUR' => chart.bpi!.eur,
      'GBP' => chart.bpi!.gbp,
      'USD' => chart.bpi!.usd,
      _ => null
    };
  }
}
