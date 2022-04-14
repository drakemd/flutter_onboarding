import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/models/car_model.dart';

List<Car> data = [
  Car('Classic Car', '\$34/day', 'assets/image/car_classic.png', false, 0xFFB67853),
  Car('Sport Car', '\$55/day', 'assets/image/car_sport.png', false, 0xFF60B5F4),
  Car('Flying Car', '\$500/day', 'assets/image/car_flying.png', false, 0xFF8382C2),
  Car('Electric Car', '\$45/day', 'assets/image/car_electric.png', false, 0xFF2A3640)
];

final carDataSourceProvider = Provider<CarDataSource>((ref){
  return CarDataSourceDummy();
});

abstract class CarDataSource{
  Future<List<Car>> getAll();
  Future<Car> getById(int index);
  Future<Car> toggleFavorite(int index);
}

class CarDataSourceDummy implements CarDataSource{
  Future<List<Car>> getAll() => Future.delayed(const Duration(seconds: 1), () => data);
  Future<Car> getById(int index) => Future.delayed(const Duration(seconds: 1), () => data[index]);
  Future<Car> toggleFavorite(int index){
    List<Car> temp = [...data];
    temp[index] = temp[index].copyWith(isFavorite: !temp[index].isFavorite);
    data = [...temp];
    return Future.delayed(const Duration(milliseconds: 500), () => temp[index]);
  }
}