import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desingapp/src/repository/app_info_repository.dart';
import 'package:desingapp/src/model/app_info.dart';

class AppInfoCubit extends Cubit<AppInfoState> {
  final AppInfoRepositoryBase _appInfoRepositoryBase;

  late AppInfo appInfo;

  AppInfoCubit(this._appInfoRepositoryBase) : super(AppInfoLoadingState());

  Future<void> getAppInfo() async {
    emit(AppInfoLoadingState());
    appInfo = (await _appInfoRepositoryBase.getAppInfo()) ?? AppInfo(0);
    emit(AppInfoReadyState(appInfo));
  }
}

abstract class AppInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppInfoLoadingState extends AppInfoState {}

class AppInfoReadyState extends AppInfoState {
  final AppInfo appInfo;

  AppInfoReadyState(this.appInfo);

  @override
  List<Object?> get props => [appInfo];
}
