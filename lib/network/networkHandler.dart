import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import 'package:testassesment/Model/pink_vila_model.dart';
Future<dynamic> fetchingResponse(var url) async {
  String baseUrl = "https://www.pinkvilla.com"+url;
  var response = await http.get(baseUrl);
  if(response.statusCode == 200){

  var jsonDec = json.decode(response.body);
  return PinkVilaModel.fromJson(jsonDec);

////  /  String finalUrl = baseUrl + urls;
////  final streamedRest = await client.send(http.Request('get',Uri.parse(baseUrl)));
////  if(streamedRest.statusCode == 200 || streamedRest.statusCode == 201){
////  return streamedRest.stream
////      .transform(utf8.decoder)
////      .transform(json.decoder)
////      .map((data) => PinkVillaModel.fromJson(data as Map<String,dynamic>)); final client = http.Client();
///


  }else{
    throw Exception('Unable to fetch data');
  }
}
