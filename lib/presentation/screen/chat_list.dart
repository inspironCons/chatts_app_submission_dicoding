import 'package:flutter/material.dart';
import 'package:submission_flutter_dasar/presentation/screen/chat_room_screen.dart';
import 'package:submission_flutter_dasar/presentation/widget/glassmorphism/glassmorphism.dart';
import 'package:submission_flutter_dasar/res/app_colors.dart';
import 'package:submission_flutter_dasar/res/app_text_style.dart';

import '../../domain/model/chat_list.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      padding: EdgeInsets.all(16),
      start: 0.925,
      end: 0.925,
      color: AppColors.cardColor,
      child:ListView.separated(
          itemCount: chatList.length,
          separatorBuilder: (context,index)=> const Divider(
            color: Colors.black,
          ),
          itemBuilder: (context,index) {
            ChatList data = chatList[index];
            return InkWell(
                onTap: (){
                  goesToChatRoom(context,data);
                },
                child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(data.imageUrl),
                            radius: 20,
                          ),
                          SizedBox(width: 16),
                          Text(
                            data.name,
                            style: AppTextStyle.regular,
                          )
                        ],
                      )
                      ,
                    )
                )
            );
          }
      ),
    );
  }
}

void goesToChatRoom(BuildContext context,ChatList data) {
  Navigator.push(context, MaterialPageRoute(builder: (builder) {
    return ChatRoomScreen(header: data);
  }));
}
