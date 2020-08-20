import 'package:flutter/material.dart';
import 'package:testassesment/Model/pink_vila_model.dart';
import 'package:testassesment/network/networkHandler.dart';
class PhotoGrid extends StatefulWidget {
  @override
  _PhotoGridState createState() => _PhotoGridState();
}

class _PhotoGridState extends State<PhotoGrid> {
  List<PinkVillaModel> pinkvilaModel = <PinkVillaModel>[];
  String url = "photo-gallery-feed-page";
  void getPhotos()async{
      final Stream<PinkVillaModel> stream = await fetchingResponse(url);
      stream.listen((PinkVillaModel pinkVillaModel) {
        setState(() {
          pinkvilaModel.add(pinkVillaModel);
        });
      });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPhotos();
    print(pinkvilaModel.length);
    print(pinkvilaModel);
  }
  @override
  Widget build(BuildContext context) {
    return Container();

  }
}
