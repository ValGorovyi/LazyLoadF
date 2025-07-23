import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.purple,
        textTheme: TextTheme(
          displayMedium: TextStyle(color: Colors.black, fontSize: 30),
          displaySmall: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ),
      home: BuilderWidgets(),
    );
  }
}

class BuilderWidgets extends StatelessWidget {
  final List<MenuItemType> menuItemList = [
    MenuItemType(Icons.favorite, 'Favorite'),
    MenuItemType(Icons.phone, 'Phone'),
    MenuItemType(Icons.computer, 'Computer'),
    MenuItemType(Icons.folder, 'Folder'),
  ];
  BuilderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            InfoUser(),
            SizedBox(height: 15),
            FirstMenuWidget(menuItemList: menuItemList),
          ],
        ),
      ),
    );
  }
}

class InfoUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        Container(width: 100, height: 100, child: Placeholder()),
        SizedBox(height: 20),
        Text(
          'User <228> Name',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(height: 10),
        Text('+3801234567890', style: Theme.of(context).textTheme.displaySmall),
      ],
    );
  }
}

class MenuItemType {
  final IconData icon;
  final String text;
  MenuItemType(this.icon, this.text);
}

class MenuOneItem extends StatelessWidget {
  final MenuItemType data;
  MenuOneItem({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 16),
          Expanded(child: Text(data.text)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class FirstMenuWidget extends StatelessWidget {
  final List<MenuItemType> menuItemList;
  FirstMenuWidget({required this.menuItemList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuItemList
          .map<Widget>((data) => MenuOneItem(data: data))
          .toList(),
    );
  }
}
