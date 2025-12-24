
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/presentation/core/style/extensions.dart';
import 'package:charity_app/presentation/sights/notifier/state/sight_list_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sightListNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Screen', style: context.textSubtitle),
              switch (state) {
                SightListLoading() => const Center(child: CircularProgressIndicator.adaptive()),
                SightListEmpty() => const Center(child: Text('No sights...😞')),
                SightListFilled(sights: final sightList) => Expanded(
                  child: ListView.separated(
                    itemCount: sightList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) => Text(sightList[index].title),
                  ),
                ),
                SightListError() => const Center(child: Text('Error loading sights...🥲'))
              }
            ],
          ),
        ),
      ),
    );
  }
}
