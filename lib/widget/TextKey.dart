import 'package:flutter/material.dart';

class TextKey extends Container {
	TextKey({
		Key? key,
		Function({String? text, Icon? icon})? onPressed,
		VoidCallback? onLongPress,
		FocusNode? focusNode,
		required BuildContext context,
		required String buttonText,
		required Color buttonTextColor,
		required double buttonFontSize,
		required double buttonHeight,
		required Color buttonColor,
	}) : super(
		key: key,
		height: MediaQuery.of(context).size.height * buttonHeight,
    margin: EdgeInsets.fromLTRB(1, 1, 1, 1),
		color: buttonColor,
		child: TextButton(
			onPressed: () => { onPressed!(text: buttonText)},
			onLongPress: onLongPress,
			focusNode: focusNode,
			autofocus: false,
			clipBehavior: Clip.none,
			child: Text(
				buttonText,
				style: TextStyle(
					fontSize: buttonFontSize,
					fontWeight: FontWeight.normal,
					color: buttonTextColor
				)
			)
		)
	);
}
