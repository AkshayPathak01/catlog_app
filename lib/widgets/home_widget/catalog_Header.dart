import 'package:catlog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App"
            .text
            .xl5
            .bold
            .color(MyTheme.darkBlue)
            .make(), //xl5 size of text
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
