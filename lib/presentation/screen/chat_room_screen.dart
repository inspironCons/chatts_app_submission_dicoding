import 'package:flutter/material.dart';
import 'package:submission_flutter_dasar/presentation/widget/chat_input.dart';

import '../../domain/model/chat_list.dart';
import '../../domain/model/chat_room.dart';
import '../../res/app_colors.dart';
import '../../res/app_text_style.dart';
import '../widget/bublbe_chat.dart';

class ChatRoomScreen extends StatefulWidget {
  final ChatList header;

  const ChatRoomScreen({super.key, required this.header});

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _msgInput = TextEditingController();
  final FocusNode _msgNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    List<ChatRoom> listData = getChatById(widget.header.chatId);

    void sendMsg() {
      var msg = _msgInput.text.trim();
      if (msg.isNotEmpty) {
        addRecordChat(widget.header.chatId, msg);
        _msgInput.clear();
        _msgNode.unfocus();
        setState(() {});
        // Delay answer by 2 seconds
        Future.delayed(const Duration(seconds: 2), () {
          randomAnswering(widget.header.chatId, () {
            setState(() {});
          });
        });
      }
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.header.imageUrl),
                  radius: 20,
                ),
                const SizedBox(width: 16),
                Text(
                  widget.header.name,
                  style: AppTextStyle.bold.copyWith(fontSize: 24),
                )
              ],
            ),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Container(
              padding: EdgeInsets.only(left: 30, bottom: 30),
            ),
          ),
          leading: Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/blob-scene-haikei.png"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ListView.builder(
                    reverse: true,
                    itemCount: listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BubbleChat(chat: listData[index]);
                    },
                  ),
                ),
              ),
              InputChatComponent(
                msgInput: _msgInput,
                msgNode: _msgNode,
                onPressed: (){
                  sendMsg();
                },
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _msgInput.dispose();
    _msgNode.dispose();
    super.dispose();
  }
}
