import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/model/history_coin.dart';
import 'package:mycoin/data/model/transaction.dart';
import 'package:mycoin/data/repository/history_coin_repository.dart';

part 'history_coin_state.dart';

class HistoryCoinCubit extends Cubit<HistoryCoinState> {
  HistoryCoinRepository historyCoinRepository;
  HistoryCoinCubit(this.historyCoinRepository) : super(HistoryCoinInitial());

  saveHistoryCoin(String uid, int cid, String symbolCoin, TransactionCoin transaction)
  {
    emit(HistoryCoinSaving());
    historyCoinRepository.saveTransaction(uid, cid, symbolCoin, transaction);
    emit(HistoryCoinSaveDone());
  }


  getHistoryCoin(String uid) async 
  {
    emit(HistoryCoinLoading());
    List<HistoryCoin> list = await historyCoinRepository.getAllHistoryCoin(uid);
    emit(HistoryCoinLoaded(list));
  }

}
