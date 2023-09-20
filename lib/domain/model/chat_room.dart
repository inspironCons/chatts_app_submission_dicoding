import 'package:submission_flutter_dasar/domain/model/chat_type.dart';

class ChatRoom {
  int id;
  String message;
  ChatType type;
  int index;

  ChatRoom({required this.id,required this.message,required this.type,required this.index});

  @override
  String toString() {
    return 'ChatRoom(id: $id, message: $message, type: $type, index: $index)';
  }
}

List<ChatRoom> allChatHistory = [];

List<ChatRoom> getChatById(int id){
  return allChatHistory
      .where((chat) => chat.id == id)
      .toList()..sort((a, b) => b.index.compareTo(a.index));
}

/// untuk mengembalikan nilai index terakhir
int getLastNumberIndexedChatRoomById(int id){
  try{
    return allChatHistory
        .where((chat) => chat.id == id).last.index;
  }catch(e){
    return 1;
  }

}

void addRecordChat(int id, String msg){
  // add record from input
  allChatHistory.add(
    ChatRoom(id: id, message: msg, type: ChatType.sendFrom, index: getLastNumberIndexedChatRoomById(id)+1)
  );


}

List<String> jokesSide = [
  "Apa Kabar?Sombong ya sekarang udah sukses lu, temen lama dilupain",
  "Pinjem 100 dulu boleh",
];

/// generate random word or random answer
void randomAnswering(int id,void Function() callback){
  int index = getLastNumberIndexedChatRoomById(id);

  switch(index){
    case 2:
      allChatHistory.add(
          ChatRoom(id: id, message: jokesSide[0], type: ChatType.sendFor, index: index+1)
      );
      callback();
      // Delay answer by 2,4 seconds
      Future.delayed(const Duration(milliseconds: 2200), () {
        allChatHistory.add(
            ChatRoom(id: id, message: jokesSide[1], type: ChatType.sendFor, index: index+2)
        );
        callback();
      });

      break;
    default:
      allChatHistory.add(
          ChatRoom(id: id, message: "Ini Di jawab", type: ChatType.sendFor, index: index+1)
      );
      callback();
      break;
  }
}