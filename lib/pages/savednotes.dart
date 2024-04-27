import 'package:chemistryapp/core/services/boxes/boxes.dart';
import 'package:chemistryapp/core/services/model/notesmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../core/services/get/get.dart';
import '../core/widgets/icons.dart';
import 'notesdetail.dart';

class SavedNewsDisplay extends StatelessWidget {
  const SavedNewsDisplay({super.key});
  

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<NotesModel>>(
      valueListenable: Boxes.getData().listenable(),
      builder: (context, savedNews, child) {
        var data =
            savedNews.values.toList().cast<NotesModel>().reversed.toList();
        return (data.isEmpty
            ? Text(
                'No Notes Saved Currently',
                style: Get.displayLarge,
              )
            : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: savedNews.length,
                  itemBuilder: (BuildContext context, int index) {
                    var notes = data[index];
                    return Container(
                      height: 100,
                      child: GestureDetector(
                        onTap: () => Get.to(NotesDetail(note: notes)),
                        child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Container(
                                height: 150.r,
                                width: 100.r,
                                child: Image.network(
                                    'https://images.indianexpress.com/2018/07/jhanvi-kapoor-759.jpg?w=414'),
                              ),
                            ),
                            title: Text(notes.title,
                                maxLines: 3, style: Get.displayMedium.px19),
                            trailing: MySave(note: notes)),
                      ),
                    );
                  },
                ),
              ));
      },
    );
  }
}
