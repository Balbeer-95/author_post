import 'dart:async';
import 'dart:developer';

import 'package:authors_post/views/home_view/home_respository.dart';
import 'package:authors_post/views/home_view/home_screen.dart';
import 'package:authors_post/views/home_view/models/authors_model.dart';
import 'package:authors_post/views/home_view/models/home_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetHomeData>((event, emit) async{
      var postList = await HomeService().getPosts("https://jsonplaceholder.typicode.com/posts");
      var authorList = await HomeService().getAuthors("https://jsonplaceholder.typicode.com/users");
      if(postList.isNotEmpty && authorList.isNotEmpty){
        List<HomeModel> homeData=[];
        Map<int, AuthorsModel> authorMap = {};
        for (var author in authorList) {
          authorMap[author.id] = author;
        }
        for (var post in postList) {
          AuthorsModel? authorInfo = authorMap[post.userId];
          homeData.add(HomeModel(userId: post.userId, id: post.id, title: post.title, body: post.body, authorsName: authorInfo?.name??"Unknown"));
        }
        emit(HomeLoaded(homeData));
      }else{

      }
    });
  }
}
