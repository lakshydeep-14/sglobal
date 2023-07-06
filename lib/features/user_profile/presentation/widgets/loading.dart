import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  final double height, width;
  const ShimmerText({super.key, this.height = 10, this.width = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(50))),
    );
  }
}

class LoadingWid extends StatefulWidget {
  const LoadingWid({super.key});

  @override
  State<LoadingWid> createState() => _LoadingWidState();
}

class _LoadingWidState extends State<LoadingWid> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, i) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                title: ShimmerText(),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ShimmerText(),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ShimmerText(),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.link,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ShimmerText(),
                        ],
                      )
                    ]),
                trailing: ShimmerText(),
              ),
            );
          }),
    );
  }
}
