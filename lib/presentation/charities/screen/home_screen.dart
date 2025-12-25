
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/presentation/core/style/extensions.dart';
import 'package:charity_app/presentation/charities/notifier/state/charity_list_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(charityListNotifierProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Home Screen', style: context.textSubtitle),
              switch (state) {
                CharityListLoading() => const Center(child: CircularProgressIndicator.adaptive()),
                CharityListEmpty() => const Center(child: Text('No charities...😞')),
                CharityListFilled(charities: final charityList) => Expanded(
                  child: ListView.separated(
                    itemCount: charityList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) => Text(charityList[index].name),
                  ),
                ),
                CharityListError() => const Center(child: Text('Error loading charities...🥲'))
              }
            ],
          ),
        ),
      ),
    );
  }
}
