import 'package:black/randomizer_change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkBoxchangeNotifierProvider = ChangeNotifierProvider(
  (ref) => CheckboxChangeNotifier(),
);
