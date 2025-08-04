import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        shadowColor: Colors.grey, // not final
        cardColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        textTheme: TextTheme(
          displayMedium: TextStyle(color: Colors.black, fontSize: 30),
          displayLarge: TextStyle(fontSize: 22),
          displaySmall: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ),
      home: BuilderWidgets(),
    );
  }
}

class BuilderWidgets extends StatelessWidget {
  final List<MenuItemType> firstItemListMenu = [
    MenuItemType(Icons.favorite, 'Favorite'),
    MenuItemType(Icons.phone, 'Phone'),
    MenuItemType(Icons.computer, 'Computer'),
    MenuItemType(Icons.folder, 'Folder'),
  ];
  final List<MenuItemType> secondItemsListMenu = [
    MenuItemType(Icons.notifications, 'Notifications'),
    MenuItemType(Icons.privacy_tip, 'Confidentiality'),
    MenuItemType(Icons.data_array, 'Data and memory'),
    MenuItemType(Icons.brush, 'Alerts'),
    MenuItemType(Icons.language, 'Language'),
    MenuItemType(Icons.sticky_note_2, 'Stickers'),
  ];
  final List<MenuItemType> thirtItemsListMenu = [
    MenuItemType(Icons.watch, 'Aple watch'),
  ];
  final List<MenuItemType> fourthItemsListMenu = [
    MenuItemType(Icons.help, 'Help'),
    MenuItemType(Icons.question_answer, 'Question telegram'),
    MenuItemType(Icons.link, 'Durov link'),
    MenuItemType(Icons.link, 'Durov link 2'),
  ];

  BuilderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Settings', )),),
      backgroundColor: Theme.of(context).shadowColor,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                InfoUser(),
                SizedBox(height: 18),
                _menuItem(menuItemList: firstItemListMenu),
                SizedBox(height: 18),
                _menuItem(menuItemList: secondItemsListMenu),
                SizedBox(height: 18),
                _menuItem(menuItemList: thirtItemsListMenu),
                SizedBox(height: 18),
                _menuItem(menuItemList: fourthItemsListMenu),
              ],
            ),
          ),
          Positioned(top: 25, right: 30, child:  Text('Change'))
        ],
      ),
    );
  }
}

class InfoUser extends StatelessWidget {
  const InfoUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Column(
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
      ),
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
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(data.icon),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                data.text,
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Icon(Icons.chevron_right, color: Theme.of(context).shadowColor,),
          ],
        ),
      ),
    );
  }
}

class _menuItem extends StatelessWidget {
  final List<MenuItemType> menuItemList;
  _menuItem({required this.menuItemList});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: menuItemList
          .map<Widget>((data) => MenuOneItem(data: data))
          .toList(),
    );
  }
}
