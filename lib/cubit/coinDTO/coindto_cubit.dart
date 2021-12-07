import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/dto/coin_dto.dart';
import 'package:mycoin/data/repository/coin_repository.dart';

part 'coindto_state.dart';

class CoinDTOCubit extends Cubit<CoinDTOState> {
  final CoinRepository _coinRepository;
  CoinDTOCubit(this._coinRepository) : super(CoinDTOInitial());

  getAllCoins() async {
    emit(CoinDTOLoading());
    List<CoinDTO> coinsDTO = await _coinRepository.fetchAllCoinMap();
    emit(CoinDTOLoaded(coinsDTO));
  }
}
