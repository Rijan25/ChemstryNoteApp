import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../main.dart';
import '../../config/appcolors.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
typedef Router = Future<Object?>;

class Get {
//Application State
  static NavigatorState get _currentState => navigatorKey.currentState!;
  static BuildContext get context => _currentState.context;

//dimentions
  static Size get size => MediaQuery.sizeOf(context);
  static double get width => size.width;
  static double get height => size.height;

//constant

  static bool get isIOS => //Platform.isIOS
      appPlatform.value == PlatformStyle.Cupertino;

//Navigation
  static Router to(Widget page) => _currentState
      .push(platformPageRoute(context: context, builder: (context) => page));
  static Router off(Widget page) => _currentState.pushReplacement(
      platformPageRoute(context: context, builder: (context) => page));
  static Router offAll(Widget page) => _currentState.pushAndRemoveUntil(
      platformPageRoute(context: context, builder: (context) => page),
      (Route<dynamic> route) => false);
  static void pop() => _currentState.pop();

//Theme
  static ThemeData get _theme => Theme.of(context);
  static TextTheme get _textTheme => _theme.textTheme;

//Screen Brightness
  static bool get isDark => _theme.brightness == Brightness.dark;

//Theme TextStyles
  static TextStyle get bodyLarge => _textTheme.bodyLarge!;
  static TextStyle get bodyMedium => _textTheme.bodyMedium!;
  static TextStyle get bodySmall => _textTheme.bodySmall!;

  static TextStyle get headlineMedium => _textTheme.headlineMedium!;
  static TextStyle get headlineLarge => _textTheme.headlineLarge!;

  static TextStyle get displaySmall => _textTheme.displaySmall!;
  static TextStyle get displayMedium => _textTheme.displayMedium!;
  static TextStyle get displayLarge => _textTheme.displayLarge!;

  static TextStyle get titleLarge => _textTheme.titleLarge!;
  static TextStyle get titleMedium => _textTheme.titleMedium!;

//Theme Colors
  static Color get disabledColor => _theme.disabledColor;
  static Color get scaffoldBackgroundColor => _theme.scaffoldBackgroundColor;
  static Color get unselectedWidgetColor => _theme.unselectedWidgetColor;
  static Color get primaryColor => _theme.primaryColor;

//Icons
  static IconData get back => PlatformIcons(context).back;
  static IconData get settings => PlatformIcons(context).settings;
  static IconData get search => PlatformIcons(context).search;
  static IconData get delete => PlatformIcons(context).deleteSolid;
  static IconData get padLock => PlatformIcons(context).padlockOutline;
  static IconData get info => PlatformIcons(context).info;
  static IconData get bookmark => PlatformIcons(context).bookmarkSolid;
  static IconData get qr => Icons.qr_code;
  static IconData get music => Icons.headphones;
  static IconData get play => PlatformIcons(context).playArrow;
  static IconData get repeat => Icons.repeat_one;
  static IconData get previous => Icons.skip_previous;
  static IconData get next => Icons.skip_next;
  static IconData get playlistplay => Icons.playlist_play;
  static IconData get share => Icons.share;
  static IconData get pause => PlatformIcons(context).pause;
  static IconData get save => PlatformIcons(context).bookmark;
  static IconData get unsave => Icons.bookmark_outline;
  static IconData get unliked => Icons.favorite_outline;
  static IconData get liked => Icons.favorite;
  static IconData get home => Icons.home;
  static IconData get developer => Icons.person;
  static IconData get clear => Icons.clear;

//notifications

  static notify(String msg) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.green,
        textColor: AppColor.white,
        fontSize: 16.0);
  }
}

extension Styling on TextStyle {
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
}

extension SizeExtension on TextStyle {
  TextStyle get px10 => copyWith(fontSize: 10.sp);
  TextStyle get px11 => copyWith(fontSize: 11.sp);
  TextStyle get px12 => copyWith(fontSize: 12.sp);
  TextStyle get px13 => copyWith(fontSize: 13.sp);
  TextStyle get px14 => copyWith(fontSize: 14.sp);
  TextStyle get px15 => copyWith(fontSize: 15.sp);
  TextStyle get px16 => copyWith(fontSize: 16.sp);
  TextStyle get px17 => copyWith(fontSize: 17.sp);
  TextStyle get px18 => copyWith(fontSize: 18.sp);
  TextStyle get px19 => copyWith(fontSize: 19.sp);
  TextStyle get px20 => copyWith(fontSize: 20.sp);
  TextStyle get px21 => copyWith(fontSize: 21.sp);
  TextStyle get px22 => copyWith(fontSize: 22.sp);
  TextStyle get px23 => copyWith(fontSize: 23.sp);
  TextStyle get px24 => copyWith(fontSize: 24.sp);
  TextStyle get px25 => copyWith(fontSize: 25.sp);
  TextStyle get px26 => copyWith(fontSize: 26.sp);
  TextStyle get px27 => copyWith(fontSize: 27.sp);
  TextStyle get px28 => copyWith(fontSize: 28.sp);
  TextStyle get px29 => copyWith(fontSize: 29.sp);
  TextStyle get px30 => copyWith(fontSize: 30.sp);
  TextStyle get px31 => copyWith(fontSize: 31.sp);
  TextStyle get px32 => copyWith(fontSize: 32.sp);
  TextStyle get px33 => copyWith(fontSize: 33.sp);
  TextStyle get px34 => copyWith(fontSize: 34.sp);
  TextStyle get px35 => copyWith(fontSize: 35.sp);
  TextStyle get px36 => copyWith(fontSize: 36.sp);
  TextStyle get px37 => copyWith(fontSize: 37.sp);
  TextStyle get px38 => copyWith(fontSize: 38.sp);
  TextStyle get px39 => copyWith(fontSize: 39.sp);
  TextStyle get px40 => copyWith(fontSize: 40.sp);
}

extension Boldness on TextStyle {
  TextStyle get w100 => copyWith(fontWeight: FontWeight.w100);
  TextStyle get w200 => copyWith(fontWeight: FontWeight.w200);
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get w800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get w900 => copyWith(fontWeight: FontWeight.w900);
}

extension Textcolor on TextStyle {
  TextStyle get primary => copyWith(color: Get.primaryColor);
  TextStyle get disabled => copyWith(color: Get.disabledColor);
  TextStyle get white => copyWith(color: AppColor.white);
  TextStyle get scaffoldBackground =>
      copyWith(color: Get.scaffoldBackgroundColor);
  TextStyle get disabledO5 => copyWith(color: Get.disabledColor.o5);
}

extension OpacityX on Color {
  Color get o1 => withOpacity(0.1);
  Color get o2 => withOpacity(0.2);
  Color get o3 => withOpacity(0.3);
  Color get o4 => withOpacity(0.4);
  Color get o5 => withOpacity(0.5);
  Color get o6 => withOpacity(0.6);
  Color get o7 => withOpacity(0.7);
  Color get o8 => withOpacity(0.8);
  Color get o9 => withOpacity(0.9);
  Color get oo8 => withOpacity(0.08);
}

extension Emoji on String {
  String get emoji => _emojiDecoder(this);
}

String _emojiDecoder(String text) {
  try {
    List<int> bytes = text.codeUnits;
    return utf8.decode(bytes);
  } catch (e) {
    return text;
  }
}
