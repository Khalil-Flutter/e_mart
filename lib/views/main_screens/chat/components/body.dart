import 'package:e_mart/views/main_screens/chat/components/chat_card.dart';
import 'package:e_mart/views/main_screens/chat/messages/message_screen.dart';
import 'package:flutter/material.dart';

import '../../../../model/chats_data_with_model.dart';
import '../../../../widgets/constants.dart';
import '../../../../widgets/filled_outline_button.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 0, kDefaultPadding, kDefaultPadding),
          color: kPrimaryColor,
          child: Row(
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
              ),
              const SizedBox(width: kDefaultPadding),
              FillOutlineButton(
                press: () {},
                text: "Active",
                isFilled: false,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  MessagesScreen(chat:chatsData[index]),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
