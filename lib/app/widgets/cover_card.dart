// ignore_for_file: file_names

import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PosterCard extends StatelessWidget {
  const PosterCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl, // Replace 'imageUrl' with your actual image URL
            width: 150, // Set your desired width
            height: 150, // Set your desired height
            imageBuilder: (context, imageProvider) => Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      imageProvider, // Use the imageProvider from CachedNetworkImage
                ),
              ),
            ),
            placeholder: (context, url) => ShimmerLoading(
                child: Container(
              width: 150,
              height: 150,
              color: Colors.grey,
            )), // You can customize the placeholder
            errorWidget: (context, url, error) =>
                const Icon(Icons.error), // You can customize the error widget
          ),
        ],
      ),
    );
  }
}
