import 'package:flutter/material.dart';
import 'package:flutter_gravatar/flutter_gravatar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'design.dart';

Widget getRandomTokenAssetIcon(int hashCode) => ClipOval(
      child: Image.network(
        Gravatar('$hashCode@example.com').imageUrl(),
      ),
    );

Widget getTokenAssetIcon(String logoURI) => SvgPicture.network(logoURI);

Widget getTonAssetIcon() => Assets.images.ton.svg();

double getKeyboardInsetsBottom(BuildContext context) {
  final double _keyboardInsetsBottom = context.keyboardInsets.bottom;

  if (context.router.root.current.name == MainFlowRoute.name) {
    return _keyboardInsetsBottom - kBottomBarHeight;
  }

  return _keyboardInsetsBottom;
}
