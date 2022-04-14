import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/models/car_model.dart';
import 'package:ob_tj_day_one/providers/car_data_provider.dart';

final carListProvider =
    StateNotifierProvider<CarList, AsyncValue<List<Car>>>((ref) {
  var provider = CarList(AsyncLoading(), ref.read(carDataSourceProvider));
  provider.loadData();
  return provider;
});

class CarList extends StateNotifier<AsyncValue<List<Car>>> {
  final CarDataSource _carDataSource;

  CarList(AsyncValue<List<Car>> state, CarDataSource carDataSource)
      : _carDataSource = carDataSource,
        super(state);

  loadData() async {
    try {
      state = AsyncLoading();
      List<Car> result = await _carDataSource.getAll();
      state = AsyncData(result);
    } catch (exception) {
      state = AsyncError(exception);
    }
  }
}
