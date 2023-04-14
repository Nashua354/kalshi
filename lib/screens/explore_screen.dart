import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/events_bloc/events_bloc.dart';
import 'package:kalshi/bloc/markets_bloc/markets_bloc.dart';
import 'package:kalshi/constants/colors.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/screens/markets_screen.dart';
import 'package:kalshi/screens/portfolio_screen.dart';
import 'package:kalshi/screens/widgets/search_list_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
  });

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(FetchEvents());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: context.read<EventsBloc>(),
      builder: (context, state) {
        print(state);
        if (state is LoadedEventState) {
          return SearchListWidget(events: state.eventsData.events);
        } else if (state is LoadingEventState) {
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
