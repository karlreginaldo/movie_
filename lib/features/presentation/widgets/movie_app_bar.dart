import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/core/utils/size_extension.dart';

import '../../../core/constants/size_constants.dart';
import '../../../core/utils/screen_utils.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      child: Row(children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svgs/mune.svg',
            height: Sizes.dimen_12.h,
          ),
        ),
        const Expanded(
          child: Logo(height: Sizes.dimen_14),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.white,
            size: Sizes.dimen_12.h,
          ),
        )
      ]),
    );
  }
}
