part of 'coindto_cubit.dart';

abstract class CoinDTOState extends Equatable {
  const CoinDTOState();

  @override
  List<Object> get props => [];
}

class CoinDTOInitial extends CoinDTOState {}

class CoinDTOLoading extends CoinDTOState {}

class CoinDTOLoaded extends CoinDTOState {
  final List<CoinDTO> coinsDTO;
  const CoinDTOLoaded(this.coinsDTO);
}

class CoinDTOLoadFail extends CoinDTOState {}
