import 'package:chemistryapp/core/config/appcolors.dart';
import 'package:chemistryapp/core/services/get/get.dart';
import 'package:chemistryapp/core/widgets/datehandler.dart';
import 'package:chemistryapp/riverpod/appState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/icons.dart';
import 'notesdetail.dart';

class GridNews extends ConsumerWidget {
  const GridNews({
    super.key,
    required this.category,
  });
  final String category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider(category));
    return notes.when(
      error: (error, stackTrace) => Text('Error is found'),
      loading: () => CircularProgressIndicator(),
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0.r),
          itemBuilder: (context, index) {
            final note = data[index];
            return GestureDetector(
              onTap: () => Get.to(NotesDetail(note: note)),
              child: Card(
                color: Get.isDark ? AppColor.white.o3 : AppColor.grey.o2,
                elevation: 5,
                shadowColor: AppColor.black.o2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0.r)),
                semanticContainer: true,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Hero(
                        tag: note.id,
                        child: Image.network(
                          'https://images.indianexpress.com/2018/07/jhanvi-kapoor-759.jpg?w=414',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(DateHandler.formatDate(note.date),
                              style: Get.displaySmall.px16),
                          MySave(note: note),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 1.0, left: 8.0, right: 8.0, bottom: 8.0),
                      child: Text(note.title,
                          style: Get.displayMedium,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
