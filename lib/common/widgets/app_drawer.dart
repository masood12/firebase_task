import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebasetask/common/widgets/shimmer_effect.dart';
import 'package:firebasetask/core/utils/app_text_styles.dart';
import 'package:firebasetask/core/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            width: 374.flexibleWidth,
            height: 146.flexibleHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9, top: 60),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://i.imgur.com/zLCYdR9.jpg',
                        imageBuilder: (context, imageProvider) => Container(
                          width: 65.flexibleWidth,
                          height: 65.flexibleHeight,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.fill),
                          ),
                        ),
                        placeholder: (context, url) => ShimmerEffect(
                            width: 65.flexibleWidth,
                            height: 65.flexibleHeight,
                            isCircular: true),
                        errorWidget: (context, url, error) => ShimmerEffect(
                            width: 65.flexibleWidth,
                            height: 65.flexibleHeight,
                            isCircular: true),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Muhammad Masood',
                              style: StyleText.boldDarkGrey20,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Flutter developer',
                              style: StyleText.regularDarkGray13,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          45.verticalSpace,
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(
              "assets/images/home.svg",
              width: 22,
              height: 22,
            ),
            title: Text(
              'Home',
              style: StyleText.regularDarkGrey20,
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(
              "assets/images/logout.svg",
              width: 22.flexibleWidth,
              height: 22.flexibleHeight,
            ),
            title: Text(
              'Logout',
              style: StyleText.regularDarkGrey20,
              textAlign: TextAlign.start,
            ),
            onTap: () {
              Navigator.of(context).pop();
              //  Navigator.of(context).pushReplacementNamed(Login.routeName);
            },
          ),
        ],
      ),
    );
  }
}
