import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kwidth,
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Image.network(
          "http://zoeice.com/assets/img/uploads/profile.png",
          width: 30,
          height: 30,
        ),
        kwidth,
      ],
    );
  }
}
