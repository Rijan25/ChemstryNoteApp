import 'package:chemistryapp/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/config/appcolors.dart';
import '../core/services/get/get.dart';
import '../main.dart';
import '../riverpod/appState.dart';
import 'gridnotes.dart';
import 'likednotes.dart';
import 'savednotes.dart';
import 'searchnotes.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  int selectedCardIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          'Chemistry Notes',
          style: Get.headlineMedium,
        ),
        trailingActions: [
          ValueListenableBuilder(
            valueListenable: appPlatform,
            builder: (context, value, child) {
              return Switch(
                value: value == PlatformStyle.Material,
                onChanged: (values) {
                  if (value == PlatformStyle.Cupertino) {
                    appPlatform.value = PlatformStyle.Material;
                    Get.notify('Switched to Android View');
                  } else {
                    appPlatform.value = PlatformStyle.Cupertino;
                    Get.notify('Switched to IOS View');
                  }
                },
              );
            },
          )
        ],
      ),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          ref.invalidate(pageNumber);
          ref.invalidate(previousNotes);
          ref.invalidate(notesProvider);
          await Future.delayed(const Duration(seconds: 2));
        },
        child: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, value, child) {
            return Expanded(child: screens[value]);
          },
        ),
      ),
      bottomNavBar: PlatformNavBar(
        height: 55,
        cupertino: (context, platform) => CupertinoTabBarData(
          activeColor: AppColor.grey,
          currentIndex: index.value,
          inactiveColor: Get.disabledColor,
        ),
        material: (context, platform) => MaterialNavBarData(
            iconSize: 22.sp,
            // currentIndex: index.value,
            unselectedItemColor: AppColor.black,
            showUnselectedLabels: true,
            selectedItemColor: AppColor.grey,
            unselectedIconTheme: IconThemeData(color: Get.disabledColor)),
        itemChanged: (p0) {
          index.value = p0;
        },
        items: navbar,
      ),
    );
  }
}

List<BottomNavigationBarItem> navbar = [
  BottomNavigationBarItem(icon: Icon(Get.home), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Get.search), label: 'Search'),
  BottomNavigationBarItem(icon: Icon(Get.save), label: 'Saved'),
  BottomNavigationBarItem(icon: Icon(Get.developer), label: 'Developer')
];

List<Widget> screens = [
  const HomePage(),
  const SearchNotes('nanochemistry'),
  const SavedNewsDisplay(),
  const GridNews(category: 'nanochemistry')
];

final index = ValueNotifier(0);
