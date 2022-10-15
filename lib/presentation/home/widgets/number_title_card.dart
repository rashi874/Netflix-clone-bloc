import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constant.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widget/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.postersLists,
  }) : super(key: key);
  final List<String> postersLists;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(5.0),
          child: MainTitle(
            title: "Top 10 Tv shows In India Today",
          ),
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              // postersLists.length,
              (index) => NumberCard(
                index: index,
                imageUrl: postersLists[index],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
