import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/models/car_model.dart';
import 'package:ob_tj_day_one/providers/car_data_provider.dart';

final carDetailProvider =
    StateNotifierProvider.family.autoDispose<CarDetail, AsyncValue<Car>, int>((ref, index) {
  var provider = CarDetail(AsyncLoading(), ref.read(carDataSourceProvider));
  provider.getCarById(index);
  return provider;
});

class CarDetail extends StateNotifier<AsyncValue<Car>> {
  final CarDataSource _carDataSource;

  CarDetail(AsyncValue<Car> state, CarDataSource carDataSource)
      : _carDataSource = carDataSource,
        super(state);

  getCarById(int index) async {
    try {
      state = AsyncLoading();
      Car result = await _carDataSource.getById(index);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }

  toggleFavorite(int index) async {
    try {
      state = AsyncLoading();
      Car result = await _carDataSource.toggleFavorite(index);
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}
