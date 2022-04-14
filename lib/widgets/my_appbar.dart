import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String _title;

  const MyAppBar({
    Key? key, String title = "Beepy"
  }) : _title = title, super(key: key);

  _renderActionIcon(){
    if(_title != "Beepy"){
      return Container(
          height: 39,
          width: 39,
          margin: const EdgeInsets.only(right: 30),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff2A3640),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset("assets/image/user.png", height: 24, width: 24,)],
          )
      );
    }else{
      return Container();
    }
  }

  _renderLeadingButton(context){
    if(_title != "Beepy"){
      return IconButton(
        icon: IconTheme(
          child: Icon(
              Icons.arrow_back_ios
          ),
          data: Theme.of(context).primaryIconTheme,
        ),
        onPressed: () => Navigator.of(context).pop(),
      );
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      title: Text(_title, style: Theme.of(context).primaryTextTheme.headline6),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: _renderLeadingButton(context),
      actions: [
        _renderActionIcon()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
