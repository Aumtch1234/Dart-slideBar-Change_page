import 'package:flutter/material.dart';
import 'main.dart' as m;

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const m.NavigationDrawer(),
    );
  }
}
