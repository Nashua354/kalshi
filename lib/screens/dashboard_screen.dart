import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/events_bloc/events_bloc.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              return ListView.builder(
                  itemCount: state.events.events.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(state.events.events[index].title),
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
