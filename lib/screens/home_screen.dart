import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalshi/bloc/balance_bloc/balance_bloc.dart';
import 'package:kalshi/bloc/events_bloc/events_bloc.dart';
import 'package:kalshi/bloc/positions_bloc/positions_bloc.dart';
import 'package:kalshi/constants/colors.dart';
import 'package:kalshi/screens/explore_screen.dart';
import 'package:kalshi/screens/portfolio_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBottomNavigationIndex = 0;
  List<Widget> bottomNavigationBarItems = [
    BlocProvider(
        create: (context) => EventsBloc(InitialEventState()),
        child: const ExploreScreen()),
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => PositionBloc(InitialPositionState())),
      BlocProvider(create: (context) => BalanceBloc(InitialBalanceState()))
    ], child: const PortfolioScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedBottomNavigationIndex,
        onTap: (value) {
          selectedBottomNavigationIndex = value;
          setState(() {});
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.explore), label: "Explore"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Portfolio")
        ],
      ),
      backgroundColor: ConstantColors.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Kalshi"),
      ),
      body: bottomNavigationBarItems[selectedBottomNavigationIndex],
    );
  }
}
