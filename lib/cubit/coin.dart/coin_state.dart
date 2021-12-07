part of 'coin_cubit.dart';

abstract class CoinState extends Equatable {
  const CoinState();

  @override
  List<Object> get props => [];
}

class CoinInitial extends CoinState {}

class CoinLoading extends CoinState{}

class CoinLoaded extends CoinState{
  final List<Coin> coins;
  const CoinLoaded(this.coins);
}

class CoinError extends CoinState{}