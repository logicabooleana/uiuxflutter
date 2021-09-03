import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desingapp/src/model/user.dart';
import 'package:desingapp/src/repository/my_user_repository.dart';

class MyUserCubit extends Cubit<MyUserState> {
  final MyUserRepositoryBase _userRepository;

  late MyUser _user;

  MyUserCubit(this._userRepository) : super(MyUserLoadingState());

  Future<void> getMyUser() async {
    emit(MyUserLoadingState());
    _user = (await _userRepository.getMyUser()) ?? MyUser('', '');
    emit(MyUserReadyState(_user));
  }

  Future<void> saveMyUser(
    String uid,
    String name,
  ) async {
    _user = MyUser(uid, name);
    emit(MyUserReadyState(_user, isSaving: true));
    // Just for testing we add a 3 seconds delay: This allows to see the loading in the home page
    await Future.delayed(Duration(seconds: 3));
    await _userRepository.saveMyUser(_user);
    emit(MyUserReadyState(_user));
  }
}

abstract class MyUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MyUserLoadingState extends MyUserState {}

class MyUserReadyState extends MyUserState {
  final MyUser user;
  final isSaving;

  MyUserReadyState(this.user,{this.isSaving = false});

  @override
  List<Object?> get props => [user, isSaving];
}
