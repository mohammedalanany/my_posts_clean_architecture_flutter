import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final int? id;
  final String? title;
  final String? body;

  const PostEntity({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      body,
    ];
  }
}
