import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/orders_bloc/orders_bloc.dart';
import 'package:kalshi/constants/colors.dart';
import 'package:kalshi/models/markets_model.dart';

class ReviewOrderScreen extends StatefulWidget {
  ReviewOrderScreen({required this.marketData, super.key});
  Market marketData;

  @override
  State<ReviewOrderScreen> createState() => _ReviewOrderScreenState();
}

class _ReviewOrderScreenState extends State<ReviewOrderScreen> {
  bool isSelectedDirectionYes = true;
  double limitPrice = 0, contractAmount = 0, total = 0, potentialProfit = 0;
  TextEditingController limitPriceController = TextEditingController();
  TextEditingController contractPriceController = TextEditingController();

  @override
  initState() {
    super.initState();
    setLimitPrice();
  }

  setLimitPrice() {
    isSelectedDirectionYes
        ? limitPrice = widget.marketData.yesAsk.toDouble()
        : limitPrice = widget.marketData.noAsk.toDouble();
    limitPriceController.text = limitPrice.toString();
    contractAmount = 0;
    contractPriceController.text = contractAmount.toString();
  }

  calculateTotalValue() {
    (limitPrice * contractAmount == 0)
        ? potentialProfit = 0
        : potentialProfit = contractAmount * (1 - (limitPrice / 100));
    total = (limitPrice * contractAmount) + potentialProfit;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ConstantColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Text(widget.marketData.title),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Direction"),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    isSelectedDirectionYes = true;
                    setLimitPrice();
                    calculateTotalValue();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent
                            .withOpacity(isSelectedDirectionYes ? 1 : 0.1),
                        border: Border.all(color: Colors.greenAccent.shade700),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("Yes"),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    isSelectedDirectionYes = false;
                    setLimitPrice();
                    calculateTotalValue();
                    setState(() {});
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent
                            .withOpacity(isSelectedDirectionYes ? 0.1 : 1),
                        border: Border.all(color: Colors.redAccent.shade700),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text("No"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: limitPriceController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  prefixText: "Limit price (¢)",
                  label: Text('Limit price'),
                  // prefix: Text('Limit price'),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                value == '' ? limitPrice = 0 : limitPrice = double.parse(value);
                calculateTotalValue();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: contractPriceController,
              textDirection: TextDirection.rtl,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  label: Text('Contract amount'),
                  // prefix: Text('Limit price'),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixText: 'Contract amount'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                value == ''
                    ? contractAmount = 0
                    : contractAmount = double.parse(value);
                calculateTotalValue();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Valid until market expiration"),
                Checkbox(
                  value: true,
                  onChanged: null,
                  splashRadius: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total"),
              Text("\$$total"),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Potential profit"),
              Text("\$${potentialProfit.toStringAsPrecision(2)}"),
            ],
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              context.read<OrdersBloc>().add(CreateLimitOrder(
                  contractAmount.toInt(),
                  (total * 100).toInt(),
                  isSelectedDirectionYes ? "yes" : "no",
                  widget.marketData.ticker));
            },
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: total == 0
                        ? Colors.grey.withOpacity(0.5)
                        : Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text("Review order")),
          )
        ]),
      ),
    );
  }
}
