import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/model/coin.dart';
import 'package:mycoin/data/repository/coin_repository.dart';


part 'coin_state.dart';

class CoinCubit extends Cubit<CoinState> {
  final CoinRepository coinRepository; 
  CoinCubit({required this.coinRepository}) : super(CoinInitial());

  Future<void> getCoinTop() async 
  {
    emit(CoinLoading());
    final List<Coin> coins = await coinRepository.fetchCoinTop();
    emit(CoinLoaded(coins));
  }
}
