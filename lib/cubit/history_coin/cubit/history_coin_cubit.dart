import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/model/history_coin.dart';
import 'package:mycoin/data/repository/history_coin_repository.dart';

part 'history_coin_state.dart';

class HistoryCoinCubit extends Cubit<HistoryCoinState> {
  HistoryCoinRepository historyCoinRepository;
  HistoryCoinCubit(this.historyCoinRepository) : super(HistoryCoinInitial());

  saveHistoryCoin(String uid, HistoryCoin historyCoin)
  {
    emit(HistoryCoinSaving());
    historyCoinRepository.saveHistoryCoin(uid, historyCoin);
    emit(HistoryCoinSaveFail());
  }
}
