part of 'post_bloc.dart';

@immutable
abstract class PostEvent {}

class GetPostData extends PostEvent {
  final String postId;
  GetPostData({required this.postId});
}
