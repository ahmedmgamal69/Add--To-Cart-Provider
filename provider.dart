import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider extends StatefulWidget {
  const MyProvider({super.key});

  @override
  State<MyProvider> createState() => _MyProviderState();
}

class _MyProviderState extends State<MyProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Model>(
            create: (context) => Model(),
          ),
          ChangeNotifierProvider<Prov>(
            create: (context) => Prov(),
          ),
        ],
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Provider"),
            ),
            body: ListView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                // *************
                // Model Column
                // *************
                Column(
                  children: [
                    Container(height: 10),
                    Selector<Model, String>(
                        selector: (context, models1) => models1.showNameOne,
                        builder: (context, model, child) {
                          return Text("${model}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold));
                        }),
                    Container(height: 10),

                    // **********
                    // Buttom (1)
                    // **********
                    Consumer<Model>(builder: (context, model, child) {
                      return MaterialButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          model.changeName();
                        },
                        child: const Text("Change Name",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      );
                    }),
                    Container(height: 10),
                    // **********
                    // Buttom (2)
                    // **********
                    Consumer<Model>(builder: (context, model, child) {
                      return MaterialButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          model.changeName2();
                        },
                        child: const Text("Change Name 2",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      );
                    }),
                  ],
                ),

                // ***********
                // Prov Column
                // ***********
                Container(width: 50),
                Column(
                  children: [
                    Container(height: 10),
                    Selector<Prov, String>(
                        selector: (context, provs1) => provs1.getCountry,
                        builder: (context, prov, child) {
                          return Text("${prov}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold));
                        }),
                    Container(height: 10),

                    // **********
                    // Buttom (1)
                    // **********
                    Consumer<Prov>(builder: (context, prov, child) {
                      return MaterialButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          prov.changeNameProv();
                        },
                        child: const Text("Change Country",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      );
                    }),
                    Container(height: 10),
                    // **********
                    // Buttom (2)
                    // **********
                    Consumer<Prov>(builder: (context, prov, child) {
                      return MaterialButton(
                        color: Colors.black,
                        textColor: Colors.white,
                        onPressed: () {
                          prov.changeNameProv2();
                        },
                        child: const Text("Change Country 2",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      );
                    }),
                  ],
                ),
              ],
            )));
  }
}

class Model extends ChangeNotifier {
  String name = "Welcome";

  get showNameOne => name;

  changeName() {
    name = "Ahmed";
    notifyListeners();
  }

  changeName2() {
    name = "Ahmed 2";
    notifyListeners();
  }
}

class Prov extends ChangeNotifier {
  String CountryName = "America";

  get getCountry => CountryName;

  changeNameProv() {
    CountryName = "Egypt";
    notifyListeners();
  }

  changeNameProv2() {
    CountryName = "Sudi Arabia";
    notifyListeners();
  }
}
