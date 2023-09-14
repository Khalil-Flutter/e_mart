import 'package:e_mart/views/main_screens/chat/messages/components/chat_input_fields.dart';
import 'package:e_mart/views/main_screens/chat/messages/components/message.dart';
import 'package:flutter/material.dart';

import '../../../../../model/chat_message_data.dart';
import '../../../../../widgets/constants.dart';
class MessageBody extends StatelessWidget {
  const MessageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: demeChatMessages.length,
              itemBuilder: (context, index) =>
                  Message(message: demeChatMessages[index]),
            ),
          ),
        ),
        const ChatInputField(),
      ],
    );
  }
}