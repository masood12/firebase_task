import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/sizes.dart';
import 'package:flutter/material.dart';

class CusineWidget extends StatelessWidget {
  const CusineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CachedNetworkImage(
            imageUrl:
                "https://migrationology.com/wp-content/uploads/2019/01/pakistani-food-guide.jpg",
            height: 100.flexibleHeight,
            width: 100.flexibleWidth,
            fit: BoxFit.cover,
          ),
        ),
        5.verticalSpace,
        Text(
          "Chicken Barayni",
          style: StyleText.mediumDarkGray15,
        ),
        5.verticalSpace,
        Text(
          "Pakistani",
          style: StyleText.regularDarkGrey14,
        )
      ],
    );
  }
}
