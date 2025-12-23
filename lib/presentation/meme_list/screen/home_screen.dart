import 'package:charity_app/core/app_route.dart';
import 'package:charity_app/core/di.dart';
import 'package:charity_app/presentation/meme_list/widget/meme_template_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/presentation/meme_list/notifier/state/meme_template_list_state.dart';
import 'package:charity_app/presentation/create_meme/screen/create_meme_screen.dart';

import '../../../domain/model/meme_template.dart';

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
                        return GestureDetector(
                            onTap: () => _redirectToCreateMemeScreen (context, memeList[index]),
                            child: MemeTemplateListItem(
                                imageUrl: memeList[index].url,
                                name: memeList[index].name));
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

   void _redirectToCreateMemeScreen(BuildContext context, final MemeTemplate meme) =>
       Navigator.pushNamed(
     context,
     AppRoute.createMemeScreen,
     arguments: meme
   );
}
