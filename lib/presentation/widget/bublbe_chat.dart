import 'package:flutter/material.dart';
import 'package:submission_flutter_dasar/domain/model/chat_type.dart';
import 'package:submission_flutter_dasar/res/app_colors.dart';
import 'package:submission_flutter_dasar/res/app_text_style.dart';

import '../../domain/model/chat_room.dart';

class BubbleChat extends StatelessWidget {
  final ChatRoom chat;
  const BubbleChat({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width * 0.5; // Set max width to 50% of screen width

     const BorderRadius borderChat = BorderRadius.only(
      bottomLeft: Radius.circular(18),
      bottomRight: Radius.circular(18),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 6),
      child: Column(
        crossAxisAlignment: chat.type == ChatType.sendFrom ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: chat.type == ChatType.sendFrom
                ? AppColors.primaryColor
                  :AppColors.altColor
                ,
              borderRadius: chat.type == ChatType.sendFrom
                  ? borderChat.copyWith(topLeft: const Radius.circular(18))
                  : borderChat.copyWith(topRight: const Radius.circular(18))
            ),
            constraints: BoxConstraints(
              maxWidth: maxWidth
            ),
            child: Text(
              chat.message,
              softWrap: true,
              style: AppTextStyle.regular.copyWith(
                color: AppColors.textColor
              )
            ),
          )
        ],
      ),
    );
  }
}
