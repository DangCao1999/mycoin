import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/model/coin.dart';
import 'package:mycoin/data/model/history_coin.dart';
import 'package:mycoin/data/model/transaction.dart';
import 'package:mycoin/data/repository/coin_repository.dart';
import 'package:mycoin/data/repository/history_coin_repository.dart';

part 'history_coin_state.dart';

class HistoryCoinCubit extends Cubit<HistoryCoinState> {
  HistoryCoinRepository historyCoinRepository;
  CoinRepository coinRepository;
  HistoryCoinCubit(
      {required this.historyCoinRepository, required this.coinRepository})
      : super(HistoryCoinInitial());

  saveHistoryCoin(
      String uid, int cid, String symbolCoin, TransactionCoin transaction) {
    emit(HistoryCoinSaving());
    historyCoinRepository.saveTransaction(uid, cid, symbolCoin, transaction);
    emit(HistoryCoinSaveDone());
  }

  getHistoryCoin(String uid) async {
    // get all list coin of user
    // make request get price for every coin
    // calculate total price total value and profit

    emit(HistoryCoinLoading());

    List<HistoryCoin> listHistoryCoin =
        await historyCoinRepository.getAllHistoryCoin(uid);
    List<String> tempCids = [];
    if (listHistoryCoin.isNotEmpty) {
      for (var e in listHistoryCoin) {
        tempCids.add(e.cid);
        e.calculateMoneyAndValue();
      }
    }

    Map<String, Coin> listCoinsPrice =
        await coinRepository.getInfoCoin(tempCids);

    //print(listCoinsPrice);

    for (var historyCoin in listHistoryCoin) {
      double newPrice = listCoinsPrice[historyCoin.cid]!.quote!.price;
      historyCoin.calculateProfit(newPrice);
    }

    //print(listHistoryCoin);
    emit(HistoryCoinLoaded(listHistoryCoin));
  }
}
