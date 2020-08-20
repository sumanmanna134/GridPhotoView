import 'dart:convert';
import 'package:logger/logger.dart';

import 'package:http/http.dart' as http;
import 'package:testassesment/Model/pink_vila_model.dart';
Future<Stream<PinkVillaModel>> fetchingResponse(String urls) async {
  String baseUrl = "https://www.pinkvilla.com/";
  final client = http.Client();
  String finalUrl = baseUrl + urls;
  final streamedRest = await client.send(http.Request('get',Uri.parse(finalUrl)));
  if(streamedRest.statusCode == 200 || streamedRest.statusCode == 201){
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => PinkVillaModel.fromJson(data));


  }else{
    throw Exception('Unable to fetch data');
  }
}
