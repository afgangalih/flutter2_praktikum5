import 'package:flutter/material.dart';
import '../model/item.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Item? itemArgs = ModalRoute.of(context)!.settings.arguments as Item?;
    if (itemArgs == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Item tidak ditemukan')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(itemArgs.name)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: itemArgs.name,
            child: Image.asset(
              itemArgs.photo,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Nama: ${itemArgs.name}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text("Harga: Rp ${itemArgs.price}", textAlign: TextAlign.center),
          Text("Stok: ${itemArgs.stock}", textAlign: TextAlign.center),
          Text("Rating: ⭐ ${itemArgs.rating}", textAlign: TextAlign.center),
        ],
      ),
    );
  }
}