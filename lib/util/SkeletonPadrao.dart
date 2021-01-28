
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:microblog/util/AppUtil.dart';

class SkeletonPadrao extends StatelessWidget {
  
  const SkeletonPadrao({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardListSkeleton(
      length: 3,
      style: SkeletonStyle(
        theme:  AppUtil().appBrightness == Brightness.dark
        ? SkeletonTheme.Dark
        : SkeletonTheme.Light,
        
        isShowAvatar: false,
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        barCount: 2,
      ),
    );
  }
}