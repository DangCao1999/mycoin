import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mycoin/cubit/coin_cubit.dart';
import 'package:mycoin/data/model/coin.dart';
import 'package:mycoin/data/repository/coin_repository.dart';
import 'package:mycoin/screens/trending/widget/card_coin_top.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CoinCubit>(context).getCoinTop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoinCubit, CoinState>(
      builder: (context, state) {
        if (state is CoinLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<Coin> coins = (state as CoinLoaded).coins;
        return Container(
          child: ListView.builder(
              itemCount: coins.length,
              itemBuilder: (BuildContext context, index) {
                return CardCoinTop(coin: coins[index]);
              }),
        );
      },
    );
  }
}
