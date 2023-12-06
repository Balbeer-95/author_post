import 'dart:convert';

import 'package:http/http.dart' as http;

class PostService{

  Future<dynamic> getPostData(String postUrl) async {
    try{
      var response = await http.get(Uri.parse(postUrl));
      if(response.statusCode==200){
        print(response.body);
        return jsonDecode(response.body);
      }else{
        return jsonDecode(response.body);
      }
    }catch(e){
      return "Error : $e";
    }

  }


}