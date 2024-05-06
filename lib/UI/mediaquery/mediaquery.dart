import 'package:flutter/material.dart';

class MediaQueryValues {
  final BuildContext context;

  MediaQueryValues(this.context);

  bool get isMobileScreen => MediaQuery.of(context).size.width < 700;
  bool get isMediumScreen => MediaQuery.of(context).size.width < 1366;
  bool get isUltrawideScreen => MediaQuery.of(context).size.width < 3440;

  double get widthMaximized {
    if (isMobileScreen) {
      return 0.5;
    } else if (isMediumScreen) {
      return 0.2;
    } else if (isUltrawideScreen) {
      return 0.1;
    } else {
      return 0.2;
    }
  }

  double get width {
    return MediaQuery.of(context).size.width;
  }
}
