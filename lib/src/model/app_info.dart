import 'package:equatable/equatable.dart';

class AppInfo extends Equatable {
  final int version;
  AppInfo(this.version);

  @override
  List<Object?> get props => [version];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'version': version,
    };
  }

  AppInfo.fromFirebaseMap(Map<String, Object?> data): version = data['version'] as int;
}
