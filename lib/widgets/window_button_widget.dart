import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtonWidget extends StatelessWidget {
  const WindowButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(1, -1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MinimizeWindowButton(
            colors: WindowButtonColors(
              iconNormal: const Color(0xFF805306),
              mouseOver: const Color(0xFFF6A00C),
              mouseDown: const Color(0xFF805306),
              iconMouseOver: Colors.white,
              iconMouseDown: const Color(0xFFFFD500),),
          ),
          CloseWindowButton(
              colors: WindowButtonColors(
                  mouseOver: const Color(0xFFD32F2F),
                  mouseDown: const Color(0xFFB71C1C),
                  iconNormal: const Color(0xFF805306),
                  iconMouseOver: Colors.white)),
        ],
      ),
    );
  }
}