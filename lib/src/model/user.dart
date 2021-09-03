import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  MyUser(this.id, this.name);

  @override
  List<Object?> get props => [id];

  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data): id = data['id'] as String,name = data['name'] as String;
}
