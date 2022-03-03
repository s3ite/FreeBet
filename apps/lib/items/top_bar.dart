import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;

  void goToBalance(BuildContext context) {
    Navigator.of(context).pushNamed('./balance-screen');
  }

  void goToUser(BuildContext context) {
    Navigator.of(context).pushNamed('./user-screen');
  }

  TopBar({required this.title, required this.appBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(255, 0, 0, 1),
      title: title,
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
        ),
        onPressed: () {
          /*DropdownButton*/
        },
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => goToBalance(context),
            child: Icon(
              Icons.attach_money,
              size: 26.0,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () => goToUser(context),
            child: Icon(Icons.account_circle_outlined),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
