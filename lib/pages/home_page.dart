import 'package:flutter/material.dart';
import '../model/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      photo: 'images/sugar.png',
      stock: 10,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      photo: 'images/salt.png',
      stock: 15,
      rating: 4.0,
    ),
    Item(
      name: 'Rice',
      price: 12000,
      photo: 'images/rice.png',
      stock: 8,
      rating: 4.8,
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/item',
                arguments: item,
              );
            },
            splashColor: Colors.blue.withOpacity(0.3),
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.all(8),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: item.name,
                      child: Image.asset(
                        item.photo,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text("Rp ${item.price}", textAlign: TextAlign.center),
                    Text("Stok: ${item.stock}", textAlign: TextAlign.center),
                    Text("⭐ ${item.rating}", textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[50],
        padding: const EdgeInsets.all(8.0),
        child: const Text(
          "Nama: Afgan Galih | NIM: 2341760004",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}