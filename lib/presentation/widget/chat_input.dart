import 'package:flutter/material.dart';
import 'package:submission_flutter_dasar/res/app_colors.dart';
import 'package:submission_flutter_dasar/res/app_text_style.dart';

import 'curved_nav/src/nav_custom_painter.dart';

class InputChatComponent extends StatefulWidget {
  final TextEditingController msgInput;
  final FocusNode msgNode;
  final VoidCallback? onPressed;

  const InputChatComponent(
      {super.key,
      required this.msgInput,
      required this.msgNode,
      required this.onPressed});

  @override
  State<InputChatComponent> createState() => _InputChatComponentState();
}

class _InputChatComponentState extends State<InputChatComponent> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 75,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          //input layout
          Positioned(
            child: CustomPaint(
              painter:
              NavCustomPainter(0.5, 2, Directionality.of(context)),
              child: Container(
                height: 75.0,
              ),
            ),
          ),
          //layout glass
          Positioned(
            left: 0,
            width: size.width/1.6,
            child: Material(
              type: MaterialType.transparency,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: TextField(
                  controller: widget.msgInput,
                  focusNode: widget.msgNode,
                  style: AppTextStyle.regular,
                  decoration: InputDecoration(
                    hintText: "input the message",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    filled: true,
                    fillColor: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ),
          //tombol action
          Positioned(
              bottom: 40,
              left: 0.5 * size.width,
              width: size.width / 2 ,
              child: Center(
                child: InkWell(
                  onTap: widget.onPressed,
                  child: Transform.rotate(
                    angle: 12,
                    child: const Material(
                      color: AppColors.primaryColor,
                      type: MaterialType.circle,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(Icons.send,size: 25,color: AppColors.textColor),
                      ),
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

// Row(
//   children: [

//   ],
// ),
