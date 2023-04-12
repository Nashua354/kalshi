import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/events_bloc/events_bloc.dart';
import 'package:kalshi/bloc/markets_bloc/markets_bloc.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/screens/markets_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<Event> searchedEvents = [];
  @override
  void initState() {
    super.initState();
    context.read<EventsBloc>().add(FetchEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder(
          bloc: context.read<EventsBloc>(),
          builder: (context, state) {
            print(state);
            if (state is LoadedEventState) {
              searchedEvents = state.eventsData.events;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: searchedEvents.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider(
                                create: (context) =>
                                    MarketsBloc(InitialMarketsState()),
                                child: MarketsScreen(
                                    searchedEvents[index].seriesTicker))));
                      },
                      child: Card(
                        child: Text(searchedEvents[index].title),
                      ),
                    );
                  }));
            } else if (state is LoadingEventState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
