import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../config/appcolors.dart';
import '../services/boxes/boxes.dart';
import '../services/get/get.dart';
import '../services/model/notesmodel.dart';

class MySave extends StatelessWidget {
  const MySave({super.key, required this.note});
  final NotesModel note;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, savedNews, child) {
        var data = savedNews.values.toList().cast<NotesModel>();
        final isSaved = data.any(
          (element) {
            return element.id == note.id;
          },
        );
        return PlatformIconButton(
          onPressed: () {
            if (isSaved) {
              delete(note);
            } else {
              final box = Boxes.getData();
              box.add(note);
            }

            Get.notify(!isSaved ? 'Notes Saved' : 'Notes Unsaved');
          },
          icon: Icon(
            isSaved ? Get.save : Get.unsave,
            color: isSaved ? AppColor.green : Get.disabledColor,
            size: 25.sp,
          ),
        );
      },
    );
  }
}

void delete(NotesModel notesModel) async {
  await notesModel.delete();
}

class MyLiked extends StatelessWidget {
  const MyLiked({super.key, required this.notes});

  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Liked_boxes.getData().listenable(),
      builder: (context, LikedNotes, child) {
        var data = LikedNotes.values.toList().cast<NotesModel>();

        final isLiked = data.any(
          (element) {
            return element.id == notes.id;
          },
        );
        return PlatformIconButton(
            onPressed: () {
              if (isLiked) {
                delete(notes);
              } else {
                final box = Liked_boxes.getData();
                box.add(notes);
              }

              Get.notify(isLiked ? 'Notes UnLiked' : 'Notes Liked');
            },
            icon: Icon(
              isLiked ? Get.liked : Get.unliked,
              color: isLiked ? AppColor.red : Get.disabledColor,
              size: 28.sp,
            ));
      },
    );
  }
}
