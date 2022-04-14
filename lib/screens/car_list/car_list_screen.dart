import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/common/routes.dart';
import 'package:ob_tj_day_one/models/car_model.dart';
import 'package:ob_tj_day_one/screens/car_list/car_list_provider.dart';
import 'package:ob_tj_day_one/widgets/my_appbar.dart';

class CarListScreen extends ConsumerWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Car>> _state = ref.watch(carListProvider);

    return Scaffold(
        appBar: MyAppBar(title: "Cars"),
        body: _state.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (exception, stackTrace) {
            return Center(child: Text("Something went wrong"));
          },
          data: (cars) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: cars.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 160,
                  width: 305,
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(
                      bottom: 47,
                      left: 35,
                      right: 35,
                      top: index == 0 ? 47 : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(cars[index].color),
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.pushNamed(context, MyRoutes.CAR_DETAIL,
                              arguments: index)
                          .then((value) =>
                              ref.read(carListProvider.notifier).loadData())
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cars[index].name,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          cars[index].price,
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              // height: MediaQuery.of(context).size.height,
                            ),
                            Positioned(
                                top: -15,
                                right: -20,
                                child: Container(
                                  height: 124,
                                  width: 200,
                                  child: Image.asset(cars[index].asset),
                                )),
                          ],
                        ),
                        Icon(
                          // Icons.star_outline_rounded,
                          cars[index].isFavorite
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 33,
                          // color: Colors.white,
                          color: cars[index].isFavorite
                              ? Colors.yellow
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
