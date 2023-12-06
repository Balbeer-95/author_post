import 'dart:async';

import 'package:authors_post/views/post_view/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../home_view/home_respository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostData>((event, emit) async {
      var postData = await PostService().getPostData("https://jsonplaceholder.typicode.com/posts/${event.postId}");
      if(!postData.toString().contains("Error : ")){
        emit(PostDataLoaded(postData));
      }
    });
  }
}
