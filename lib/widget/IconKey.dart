import 'package:flutter/material.dart';

class IconKey extends Container {
	IconKey({
		Key? key,
		Function({String? text, Icon? icon})? onPressed,
		VoidCallback? onLongPress,
		FocusNode? focusNode,
		required BuildContext context,
		required Icon icon,
		required double iconSize,
		required double buttonHeight,
		required Color buttonColor,
	}) : super(
		key: key,
		height: MediaQuery.of(context).size.height * buttonHeight,
    margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
		color: buttonColor,
		child: IconButton(
      icon: icon,
      iconSize: iconSize,
      color: Colors.white,
      disabledColor: Colors.white,
			onPressed: () => { onPressed!(icon: icon)},
			focusNode: focusNode,
			autofocus: false,
		)
	);
}
