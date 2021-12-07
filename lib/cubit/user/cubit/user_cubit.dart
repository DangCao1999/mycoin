import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mycoin/data/model/user.dart';
import 'package:mycoin/data/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  UserCubit(this.userRepository) : super(UserInitial());

  Future<void> saveUser(User user) async {
    emit(UserSaving());
    await userRepository.saveUser(user);
    emit(UserSaved());
  }
}
