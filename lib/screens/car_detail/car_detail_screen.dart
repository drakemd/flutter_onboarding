import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/models/car_model.dart';
import 'package:ob_tj_day_one/screens/car_detail/car_detail_provider.dart';
import 'package:ob_tj_day_one/widgets/my_appbar.dart';

class CarDetailScreen extends ConsumerWidget {
  final int _index;

  const CarDetailScreen({Key? key, required int index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Car> _state = ref.watch(carDetailProvider(_index));

    return Scaffold(
        appBar: const MyAppBar(title: 'Cars'),
        body: _state.when(
          error: (exception, stacktrace) =>
              Center(child: const Text("Something went wrong")),
          loading: () => Center(child: const CircularProgressIndicator()),
          data: (Car car) {
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  flex: 4,
                  child: Image.asset(car.asset),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.only(
                            left: 30, top: 30, right: 30, bottom: 10),
                        decoration: BoxDecoration(
                            color: Color(car.color),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  car.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 39,
                                    color: Colors.white,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(
                                            carDetailProvider(_index).notifier)
                                        .toggleFavorite(_index);
                                  },
                                  child: Icon(
                                    car.isFavorite
                                        ? Icons.star_rounded
                                        : Icons.star_outline_rounded,
                                    size: 33,
                                    color: car.isFavorite
                                        ? Colors.yellow
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              car.price,
                              style: const TextStyle(
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            Container(
                              width: 315,
                              child: const Text(
                                "Wanna ride the coolest sport car in the world?",
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                                onTap: () => {
                                      Navigator.pushNamed(context, '/carDetail')
                                    },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  height: 57,
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  margin: const EdgeInsets.only(top: 10),
                                  child: const Text("Book Now",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                )),
                          ],
                        )))
              ],
            );
          },
        ));
  }
}
