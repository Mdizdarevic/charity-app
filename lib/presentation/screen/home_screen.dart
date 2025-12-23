import 'package:charity_app/di.dart';
import 'package:charity_app/presentation/widget/meme_template_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:charity_app/presentation/notifier/state/meme_template_list_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(memeTemplateListStateNotifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Meme Templates",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
              ),
              switch (listState) {
                LoadingState() => Expanded(child: Center(child: CircularProgressIndicator())),
                EmptyState() => Center(child: Text("No more templates... :(")),
                ErrorState() => Center(child: Text("Oh no, there was an error...")),
                SuccessState(result: final memeList) => Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 20,),
                      itemCount: memeList.length,
                      itemBuilder: (context, index) {
                        return MemeTemplateListItem(imageUrl: memeList[index].url, name: memeList[index].name);
                      },
                    ),
                  ),
                }
            ],
          ),
        ),
      ),
    );
  }
}
