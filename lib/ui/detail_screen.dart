import 'package:flutter/material.dart';
import 'package:flutter_test_interview/data/model/television.dart';
import 'package:image/image.dart' as img;
import 'package:image_network/image_network.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.televisionResult});
  final TelevisionResult televisionResult;

  @override
  Widget build(BuildContext context) {
    var imageUrl = televisionResult.image?.medium;

    String imageCheck() {
      if (imageUrl != null) {
        return imageUrl;
      } else {
        return "https://www.smaroadsafety.com/wp-content/uploads/2022/06/no-pic.png";
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(televisionResult.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: ImageNetwork(
              image: imageCheck(),
              height: 250,
              width: double.infinity,
              fitAndroidIos: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(28),
            child: Center(
              child: Text(
                televisionResult.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28, left: 28),
            child: Row(
              children: [
                ImageNetwork(
                  image:
                      'https://cdn-icons-png.flaticon.com/512/1828/1828884.png',
                  height: 20,
                  width: 20,
                ),
                Padding(padding: EdgeInsets.only(left: 8), child: Text(televisionResult.rating.average.toString())),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28, left: 28, top: 8),
            child: Text(televisionResult.summary.toString()),
          )
        ],
      ),
    );
  }
}
