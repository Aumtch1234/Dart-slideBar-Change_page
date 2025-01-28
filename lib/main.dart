import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/favourites_page.dart';
import 'package:flutter_application_2/screens/form_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FormScreen();
                }));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const NavigationDrawer(),
      body: Center(
        child: Text('$index',
            style: const TextStyle(
                fontSize: 120,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.orange),
        ),
        child: CurvedNavigationBar(
          index: index,
          height: 60.0,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.favorite, size: 30),
            Icon(Icons.settings, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.blue.shade200,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
          letIndexChange: (value) => true,
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.blue.shade700,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: const Column(
          children: [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage(
                  'https://st3.depositphotos.com/1738826/12569/i/950/depositphotos_125694098-stock-illustration-cute-tiger-cartoon-for-you.jpg'),
            ),
            SizedBox(height: 12),
            Text(
              'Flutter Dev',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              'taweechok.k@lu.th',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(Icons.home_max_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const MyHomePage(title: 'Home page')));
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border),
            title: const Text('Favorite'),
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const FavouritesPage()));
            },
          ),
          ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('Workflow'),
              onTap: () {}),
          ListTile(
            leading: const Icon(Icons.update),
            title: const Text('Update'),
            onTap: () {},
          ),
          const Divider(
            color: Colors.black54,
          ),
          ListTile(
            leading: const Icon(Icons.account_tree_outlined),
            title: const Text('Plugins'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Notifications'),
            onTap: () {},
          )
        ],
      ));
}
