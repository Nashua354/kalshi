import 'package:flutter/material.dart';
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
  int limitPrice = 0, contractAmount = 0, total = 0, potentialProfit = 0;
  TextEditingController limitPriceController = TextEditingController();
  TextEditingController contractPriceController = TextEditingController();

  @override
  initState() {
    super.initState();
    setLimitPrice();
  }

  setLimitPrice() {
    isSelectedDirectionYes
        ? limitPrice = widget.marketData.yesAsk
        : limitPrice = widget.marketData.noAsk;
    limitPriceController.text = limitPrice.toString();
    contractAmount = 0;
    contractPriceController.text = contractAmount.toString();
  }

  calculateTotalValue() {
    (limitPrice * contractAmount == 0)
        ? potentialProfit = 0
        : potentialProfit = 30;
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
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Direction"),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {
                    isSelectedDirectionYes = true;
                    setLimitPrice();
                    calculateTotalValue();
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent
                            .withOpacity(isSelectedDirectionYes ? 1 : 0.1),
                        border: Border.all(color: Colors.greenAccent.shade700),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("Yes"),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    isSelectedDirectionYes = false;
                    setLimitPrice();
                    calculateTotalValue();
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.redAccent
                            .withOpacity(isSelectedDirectionYes ? 0.1 : 1),
                        border: Border.all(color: Colors.redAccent.shade700),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("No"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: limitPriceController,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  prefixText: "Limit price (¢)",
                  label: Text('Limit price'),
                  // prefix: Text('Limit price'),
                  floatingLabelBehavior: FloatingLabelBehavior.never),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                value == '' ? limitPrice = 0 : limitPrice = int.parse(value);
                calculateTotalValue();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: contractPriceController,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
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
                    : contractAmount = int.parse(value);
                calculateTotalValue();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total"),
              Text("$total"),
            ],
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Potential profit"),
              Text("$potentialProfit"),
            ],
          ),
          SizedBox(height: 10),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  color: total == 0
                      ? Colors.grey.withOpacity(0.5)
                      : Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15)),
              child: Text("Review order"))
        ]),
      ),
    );
  }
}
