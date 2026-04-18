import 'package:http/http.dart' as http;

import '../models/post_model.dart';
var base = "https://dummyjson.com";

getPosts() async {

  Uri url = Uri.parse("$base/products");
  var res =  await http.get(url);

  try{
  if(res.statusCode == 200){
    var data = postsModelFromJson(res.body);
    return data.products;
  }else{
    print("Error during connection");
  } }catch(e){
    print(e.toString());
  }
}