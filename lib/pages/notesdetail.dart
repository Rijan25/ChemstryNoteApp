import 'package:chemistryapp/core/services/model/notesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:share_plus/share_plus.dart';
import '../core/services/get/get.dart';
import '../core/widgets/datehandler.dart';
import '../core/widgets/icons.dart';
import '../main.dart';

class NotesDetail extends StatelessWidget {
  const NotesDetail({super.key, required this.note});
  final NotesModel note;
  @override
  Widget build(BuildContext context) {
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
                value: value == PlatformStyle.Cupertino,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0.r),
              child: ClipRRect(
                child: Image.network(
                    'https://images.indianexpress.com/2018/07/jhanvi-kapoor-759.jpg?w=414',
                    fit: BoxFit.fill),
              ),
            ),
            // Text(note.type, style: Get.displaySmall.px16),
            HtmlWidget(
              note.title,
              textStyle: Get.displayMedium,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(DateHandler.formatDate(note.date),
                          style: Get.displaySmall.px16)),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyLiked(
                          notes: note,
                        ),
                        IconButton(
                          onPressed: () async {
                            await Share.share(note.noteUrl);
                          },
                          icon: Icon(Get.share, size: 28.r),
                        ),
                        MySave(
                          note: note,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2.r,
              thickness: 3.r,
              color: Get.disabledColor,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HtmlWidget(note.content,
                  textStyle: Get.displayMedium.disabled.copyWith()),
            ),
          ],
        ),
      ),
    );
  }
}
