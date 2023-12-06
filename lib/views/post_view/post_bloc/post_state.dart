part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}


class PostDataLoaded extends PostState {
  Map<String,dynamic> data;
  PostDataLoaded(this.data);
}


