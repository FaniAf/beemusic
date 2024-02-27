import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:beemusic/app/utils/query/query.dart';
import 'package:flutter/material.dart';

class ShimmerHome extends StatelessWidget {
  const ShimmerHome({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.036,
            top: screenHeight * 0.01,
            bottom: screenHeight * 0.02),
        child: ShimmerLoading(
            child: Row(
          children: [
            Container(
                height: 20,
                width: 75,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey))
          ],
        )),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: screenHeight * 0.24,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            padding: EdgeInsets.only(
                left: screenWidth * 0.040, right: screenWidth * 0.040),
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ShimmerLoading(
                    child:
                        Container(height: 150, width: 150, color: Colors.grey),
                  ),
                  spaceWidth02,
                ],
              );
            },
          ),
        ),
      ),
    ]);
  }
}
