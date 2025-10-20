import 'package:flutter/material.dart';

List produtos = [
  {
    "id": 1,
    "nome": "Lápis 4B",
    "desc": "Lápis 4B Faber Castell",
    "valor": 15.00,
    "qnt": 10,
  },
  {
    "id": 2,
    "nome": "Lápis 6B",
    "desc": "Lápis 6B Faber Castell",
    "valor": 20.00,
    "qnt": 5,
  },
  {
    "id": 3,
    "nome": "Lápis 2B",
    "desc": "Lápis 2B Faber Castell",
    "valor": 9.00,
    "qnt": 15,
  },
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Loja IFES'),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: produtos.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                      onTap: () => {},
                      leading: Text(produtos[index]["valor"].toString()),
                      title: Text(produtos[index]['nome']),
                      subtitle: Text(produtos[index]["desc"]),
                      trailing: IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.add_shopping_cart,
                              color: Colors.green)));
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Principal',
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Minhas Compras',
              activeIcon: Icon(Icons.shopping_bag_sharp)),
        ]));
  }
}
