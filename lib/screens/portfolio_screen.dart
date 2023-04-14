import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/balance_bloc/balance_bloc.dart';
import 'package:kalshi/bloc/markets_bloc/markets_bloc.dart';
import 'package:kalshi/bloc/positions_bloc/positions_bloc.dart';
import 'package:kalshi/constants/colors.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/screens/markets_screen.dart';
import 'package:kalshi/screens/portfolio_screen.dart';
import 'package:kalshi/screens/widgets/search_list_widget.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({
    super.key,
  });

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PositionBloc>().add(FetchPositionEvent());
    context.read<BalanceBloc>().add(FetchBalanceEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<PositionBloc>(),
      builder: (context, state) {
        print(state);
        if (state is LoadedPositionState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Balance",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder(
                        bloc: context.read<BalanceBloc>(),
                        builder: (context, state) {
                          if (state is LoadedBalanceState) {
                            return Text("\$${state.data.balance / 100}");
                          }
                          return Container();
                        })
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "My positions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: state.positionsData.eventPositions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        state.positionsData.eventPositions[index].eventTicker),
                    subtitle: Text(
                        "Total Cost \$${state.positionsData.eventPositions[index].totalCost / 100}"),
                    trailing: Text(
                        "P/L \$${state.positionsData.eventPositions[index].realizedPnl / 100}"),
                  );
                },
              ),
            ],
          );
        } else if (state is LoadingPositionState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
