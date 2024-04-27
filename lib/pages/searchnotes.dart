import 'package:chemistryapp/core/services/model/searchnotesmodel.dart';
import 'package:chemistryapp/core/services/searchhttp/basesearchhttp.dart';
import 'package:chemistryapp/pages/notesdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/services/get/get.dart';
import '../riverpod/appState.dart';

class SearchNotes extends ConsumerWidget {
  const SearchNotes(this.Category, {super.key});
  final String Category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _controller = TextEditingController();
    final searchNotes = ref.watch(searchnotesProvider(Category));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                filled: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      _controller.clear();
                    },
                    icon: Icon(Get.clear)),
                hintText: 'Search Here',
              ),
              enableSuggestions: true,
              showCursor: true,
              onChanged: (value) {
                ref.read(search.notifier).state = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recent Searches',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            ),
          ),
          Container(
            child: Expanded(
              child: searchNotes.when(
                error: (error, stackTrace) => Text('ERROR IS FOUND'),
                loading: () => Center(child: CircularProgressIndicator()),
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      SearchNoteModel note = data[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () async {
                            Get.notify('Redirecting');
                            final notes =
                                await ref.read(notesurlProvider(note.url));
                            if (notes != null) {
                              Get.to(NotesDetail(note: notes));
                            }
                          },
                          title: Text(note.title, maxLines: 3),
                          subtitle: Text(note.subtype, style: Get.displaySmall),
                          leading: Image.network(
                              'https://images.indianexpress.com/2018/07/jhanvi-kapoor-759.jpg?w=414'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
