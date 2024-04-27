import 'package:chemistryapp/pages/gridnotes.dart';
import 'package:flutter/material.dart';

import '../core/config/appcolors.dart';
import '../core/services/get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> category = [
      'For You',
      'Organic',
      'Inorganic',
      'BioChemistry',
      'Physical',
      'Nano Chemistry'
    ];

    List<String> notetype = [
      'posts',
      'organic_notes',
      'inorganic_notes',
      'biochemistry',
      'nanochemistry',
      'physical'
    ];

    return ValueListenableBuilder(
      valueListenable: catindex,
      builder: (context, value, child) {
        return Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: category.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    catindex.value = index;
                  },
                  child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: value == index
                          ? Get.disabledColor.o1
                          : Get.disabledColor.o6,
                      shadowColor: AppColor.grey,
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(category[index],
                              style: Get.bodyMedium.px22.copyWith(
                                  color: Get.isDark
                                      ? AppColor.white
                                      : AppColor.white)),
                        ),
                      )),
                ),
              ),
            ),
            Expanded(child: GridNews(category: notetype[value]))
          ],
        );
      },
    );
  }
}

final catindex = ValueNotifier(0);
