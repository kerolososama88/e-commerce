import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLogoAuth extends StatelessWidget {
   const ImageLogoAuth({super.key,});
  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Center(
      child: CachedNetworkImage(
        width:width*.6 ,
        height:height*.4 ,
        imageUrl:
        'https://img.freepik.com/free-vector/delivery-service-illustrated_23-2148505081.jpg?w=826&t=st=1697683289~exp=1697683889~hmac=cf2d9b681fdf8a6a90205e76a677395e73aa2dd41fba89a673ea988e3dd468b0',
      ),
    );
  }
}
