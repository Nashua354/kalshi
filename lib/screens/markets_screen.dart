import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/constants/colors.dart';
import 'package:kalshi/screens/review_order_screen.dart';

import '../bloc/markets_bloc/markets_bloc.dart';

class MarketsScreen extends StatefulWidget {
  MarketsScreen(this.seriesTicker, {super.key});
  String seriesTicker;

  @override
  State<MarketsScreen> createState() => _MarketsScreenState();
}

class _MarketsScreenState extends State<MarketsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MarketsBloc>().add(FetchMarkets(widget.seriesTicker));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(),
      body: BlocBuilder(
        bloc: context.read<MarketsBloc>(),
        builder: (context, state) {
          print(state);
          if (state is LoadingMarketState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedMarketState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.marketsData.markets.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.marketsData.markets[index].title),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Volume ${state.marketsData.markets[index].volume}",
                                style: const TextStyle(fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.greenAccent.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                        "Yes : ${state.marketsData.markets[index].yesAsk}"),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        color:
                                            Colors.redAccent.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                        "No : ${state.marketsData.markets[index].noAsk}"),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => ReviewOrderScreen(
                                          marketData: state
                                              .marketsData.markets[index])));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text("BUY/SELL"),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
