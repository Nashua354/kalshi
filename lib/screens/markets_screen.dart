import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    child: Column(
                      children: [
                        Text(state.marketsData.markets[index].title),
                        Text(
                            "Yes : ${state.marketsData.markets[index].yesAsk}"),
                        Text("No : ${state.marketsData.markets[index].noAsk}")
                      ],
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
