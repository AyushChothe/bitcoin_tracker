import 'package:bitcoin_tracker/providers/coindesk_api.dart';
import 'package:bitcoin_tracker/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceTextStyle =
        Theme.of(context).textTheme.displayMedium?.copyWith(color: priceColor);

    final coindeskCtrl = ref.watch(coindeskCtrlProvider);
    final selectedItem = useState('');

    final priceSnap = useFuture(
      useMemoized(
        () => coindeskCtrl.getCurrentPriceForCurrency(selectedItem.value),
        [selectedItem.value],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                bitcoinImage,
                height: 180,
              ),
              const Spacer(),
              Text(
                priceSnap.hasError
                    ? 'Error'
                    : priceSnap.data?.rateFloat?.toStringAsFixed(2) ?? 'Price',
                style: priceTextStyle,
              ),
              const Spacer(
                flex: 7,
              ),
              Expanded(
                flex: 4,
                child: CupertinoPicker.builder(
                  childCount: currencyList.length,
                  itemExtent: 40,
                  useMagnifier: true,
                  magnification: 1.1,
                  selectionOverlay: Container(
                    decoration: const BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(width: 0.2),
                      ),
                    ),
                  ),
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: Text(currencyList[i]),
                    ),
                  ),
                  onSelectedItemChanged: (idx) {
                    selectedItem.value = currencyList[idx];
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
