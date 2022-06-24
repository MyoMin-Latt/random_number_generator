import 'package:black/providers.dart';
import 'package:black/randomizer_page.dart';
import 'package:black/range_selector_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RangeSelectorPage extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Select Range')),
      ),
      body: Column(
        children: [
          RangeSelectorForm(
            formKey: formKey,
          ),
          Checkbox(
              value: ref.watch(checkBoxchangeNotifierProvider).checkboxState[0],
              onChanged: (val) {
                ref.read(checkBoxchangeNotifierProvider).changeCheckboxState(0);
              }),
          Checkbox(
              value: ref.watch(checkBoxchangeNotifierProvider).checkboxState[1],
              onChanged: (val) {
                ref.read(checkBoxchangeNotifierProvider).changeCheckboxState(1);
              }),
          Checkbox(
              value: ref.watch(checkBoxchangeNotifierProvider).checkboxState[2],
              onChanged: (val) {
                ref.read(checkBoxchangeNotifierProvider).changeCheckboxState(2);
              }),
          TextButton(
              onPressed: () {
                ref.read(checkBoxchangeNotifierProvider).printCheckboxTrue();
              },
              child: Text('Print Ture'))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RandomizerPage(),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
