import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testassesment/Model/pink_vila_model.dart';
import 'package:testassesment/network/networkHandler.dart';
import 'package:http/http.dart' as http;
class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  String url = "photo-gallery-feed-page";

  ScrollController _scrollController = ScrollController();
  List<dynamic> _list = List();
  List<dynamic> _list2 = List();
  List<dynamic> Photos = [];
  int url_len;
  bool end_Scroll = false;
  String baseUrl = "https://www.pinkvilla.com";
  List<String> urls = ["/photo-gallery-feed-page","/photo-gallery-feed-page/page/1","/photo-gallery-feed-page/page/2"];
  void getData(var urls) async {
      final  stream = await fetchingResponse(urls);
      PinkVilaModel vilaModel = stream;
      setState(() {
        var b = vilaModel.toJson();
        for(var i=0; i<b['nodes'].length;i++){
          _list.add(b['nodes'][i]['node']);
        }
        for (var j =0 ; j<_list.length;j++){
          _list2.add(_list[j]);
        }
        for(var k =0 ; k< _list2.length ; k++){
          Photos.add(baseUrl+_list2[k]['field_photo_image_section']);
        }
      });


    }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(urls[0]);
    url_len = urls.length;


    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        setState(() {
          end_Scroll = true;
          if(end_Scroll && urls.length!=0){
            url_len = url_len-1;
            print(url_len);
            print(urls[url_len]);
            getData(urls[url_len]);
          }

        });


      }
    });

  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos"),),
      body: GridView.count(
        controller: _scrollController,
          crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(Photos.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(Photos[index].toString()),
                  fit: BoxFit.cover,
                  
                ),
                borderRadius: BorderRadius.all(Radius.circular(2.0))
              ),
            ),
          );
        }),
      ),
    );

  }
}
