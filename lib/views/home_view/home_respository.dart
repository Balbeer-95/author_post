import 'dart:convert';
import 'dart:developer';

import 'package:authors_post/views/home_view/models/authors_model.dart';
import 'package:authors_post/views/home_view/models/post_model.dart';
import 'package:http/http.dart' as http;

class HomeService{
  
  Future<List<AuthorsModel>> getAuthors(String apiUrl) async {
    try{
      var response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        return List.from(jsonDecode(response.body)).map((e)=>AuthorsModel.fromJson(e)).toList();
      }else{
        return List.from(jsonDecode(response.body)).map((e)=>AuthorsModel.fromJson(e)).toList();
      }
    }catch(e){
      return List.from([]).map((e)=>AuthorsModel.fromJson(e)).toList();
    }
  }


  Future<List<PostModel>> getPosts(String apiUrl) async {
    try{
      var response = await http.get(Uri.parse(apiUrl));
      if(response.statusCode==200){
        return List.from(jsonDecode(response.body)).map((e)=>PostModel.fromJson(e)).toList();
      }else{
        return List.from(jsonDecode(response.body)).map((e)=>PostModel.fromJson(e)).toList();
      }
    }catch(e){
      return List.from([]).map((e)=>PostModel.fromJson(e)).toList();
    }
  }
  
}