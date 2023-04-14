import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/markets_bloc/markets_bloc.dart';
import 'package:kalshi/models/events_model.dart';
import 'package:kalshi/screens/markets_screen.dart';

class SearchListWidget extends StatefulWidget {
  SearchListWidget({required this.events, super.key});
  List<Event> events;

  @override
  State<SearchListWidget> createState() => _SearchListWidgetState();
}

class _SearchListWidgetState extends State<SearchListWidget> {
  List<Event> searchedEvents = [];

  @override
  void initState() {
    searchedEvents = widget.events;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                onChanged: (value) {
                  searchedEvents = [];
                  widget.events.forEach((event) {
                    if (event.title
                        .toLowerCase()
                        .contains(value.toLowerCase())) {
                      searchedEvents.add(event);
                    }
                  });
                  setState(() {});
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
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
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(searchedEvents[index].title),
                      ),
                    ),
                  );
                })),
          ],
        ),
      ),
    );
  }
}
