import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ob_tj_day_one/common/routes.dart';
import 'package:ob_tj_day_one/providers/theme_provider.dart';
import 'package:ob_tj_day_one/widgets/my_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/image/car_home.png"),
            ),
          ),
          Expanded(
              flex: 3,
              child: Column(
                children: [
                  const Text("Find Your Vehicle",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Container(
                    width: 264,
                    alignment: Alignment.center,
                    child: const Text(
                      "Find the perfect vehicle for every occasion!",
                      maxLines: 2,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Consumer(builder: (context, ref, child) {
                    final _switchValue = ref.watch(themeProvider);
                    return Switch(
                      activeTrackColor: Color(0XFFEB5757),
                      activeColor: Colors.white,
                      value: _switchValue.isDark,
                      onChanged: (_switchValue) => {
                        if (_switchValue)
                          {ref.read(themeProvider.notifier).setDark()}
                        else
                          {ref.read(themeProvider.notifier).setLight()}
                      },
                    );
                  }),
                  InkWell(
                      onTap: () => {
                            Navigator.pushNamed(
                                context, MyRoutes.CAR_LIST_SCREEN)
                          },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).primaryColor,
                        ),
                        height: 57,
                        width: 305,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: const Text("Continue",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      )),
                  const SizedBox(height: 24)
                ],
              )),
        ],
      ),
    );
  }
}
