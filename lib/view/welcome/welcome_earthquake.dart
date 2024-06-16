import 'package:dpip/view/welcome/welcome_notify.dart';
import 'package:flutter/material.dart';

class WelcomeEarthquakePage extends StatefulWidget {
  const WelcomeEarthquakePage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _WelcomeEarthquakePageState();
}

class _WelcomeEarthquakePageState extends State<WelcomeEarthquakePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("強震監視器")),
            body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("內文"),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) => const WelcomeNotifyPage()));
                          },
                          child: const Text("下一步")))
                ]))));
  }
}
