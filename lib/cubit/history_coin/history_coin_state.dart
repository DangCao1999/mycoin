part of 'history_coin_cubit.dart';

abstract class HistoryCoinState extends Equatable {
  const HistoryCoinState();

  @override
  List<Object> get props => [];
}

class HistoryCoinInitial extends HistoryCoinState {}

class HistoryCoinSaving extends HistoryCoinState {}

class HistoryCoinSaveDone extends HistoryCoinState {}

class HistoryCoinSaveFail extends HistoryCoinState {}

class HistoryCoinLoading extends HistoryCoinState {}

class HistoryCoinLoaded extends HistoryCoinState {
  final List<HistoryCoin> list;
  HistoryCoinLoaded(this.list);
}

class HistoryCoinLoadFail extends HistoryCoinState {}
