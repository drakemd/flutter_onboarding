import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/models/theme_model.dart';

final themeProvider = StateNotifierProvider<ThemeState, ThemeModel>((ref) => ThemeState());

class ThemeState extends StateNotifier<ThemeModel> {
  ThemeState() : super(ThemeModel(false));

  void setDark() {
    state = ThemeModel(true);
  }

  void setLight() {
    state = ThemeModel(false);
  }
}