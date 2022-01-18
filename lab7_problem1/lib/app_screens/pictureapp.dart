import 'package:flutter/material.dart';

class PictureCall extends StatelessWidget {
  const PictureCall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/mypic.jpg");
    Image image = Image(
      image: assetImage,
      width: 400,
    );
    return Container(margin: const EdgeInsets.only(top: 0), child: image);
  }
}
