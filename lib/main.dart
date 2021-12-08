import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:mycoin/cubit/coin.dart/coin_cubit.dart';
import 'package:mycoin/cubit/coinDTO/coindto_cubit.dart';
import 'package:mycoin/cubit/history_coin/history_coin_cubit.dart';
import 'package:mycoin/cubit/user/user_cubit.dart';
import 'package:mycoin/data/dto/coin_dto.dart';
import 'package:mycoin/data/repository/coin_repository.dart';
import 'package:mycoin/data/repository/history_coin_repository.dart';
import 'package:mycoin/data/repository/user_repository.dart';
import 'package:mycoin/screens/general/dialog_add_transaction.dart';
import 'package:mycoin/screens/mycoin/my_coin_screen.dart';
import 'package:mycoin/screens/trending/trending_screen.dart';

void main() => runApp(MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (_) => CoinRepository()),
      RepositoryProvider(create: (_) => UserRepository()),
      RepositoryProvider(create: (_) => HistoryCoinRepository())
    ], child: const MyApp()));

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: "OpenSands",
        ),
        title: _title,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => CoinCubit(
                    coinRepository:
                        RepositoryProvider.of<CoinRepository>(context))),
            BlocProvider(
                create: (context) =>
                    UserCubit(RepositoryProvider.of<UserRepository>(context))),
            BlocProvider(
                create: (context) => CoinDTOCubit(
                    RepositoryProvider.of<CoinRepository>(context))),
            BlocProvider(
              create: (context) => HistoryCoinCubit(
                coinRepository: RepositoryProvider.of<CoinRepository>(context),
                historyCoinRepository:
                  RepositoryProvider.of<HistoryCoinRepository>(context)),
            ),
          ],
          child: const MyStatefulWidget(),
        ));
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  bool _initialized = false;
  bool _error = false;
  late CoinDTOCubit coinDTOCubit;
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    TrendingScreen(),
    MyCoinScreen(),
  ];

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      screenLock(context: context, correctString: "1234");
    });
    initializeFlutterFire();
    coinDTOCubit = BlocProvider.of<CoinDTOCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Text("Some thing went wrong!"),
          ),
        ),
      );
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
      return Scaffold(
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("MyCoin"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: 'Trending',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Your coin',
            backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.insights),
          backgroundColor: Colors.amber.shade700,
          onPressed: () {
            showDialog<void>(
                context: context,
                builder: (_) => MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                          value: BlocProvider.of<CoinDTOCubit>(context),
                        ),
                        BlocProvider.value(
                          value: BlocProvider.of<HistoryCoinCubit>(context),
                        ),
                      ],
                      child: DialogAddTransaction(),
                    ));
          }),
    );
  }
}
