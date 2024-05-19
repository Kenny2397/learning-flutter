import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/domain/entities/message.dart';

import 'package:yesnoapp/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/presentation/widgets/chat/my_message.dart';
import 'package:yesnoapp/presentation/widgets/chat/yours_message.dart';
import 'package:yesnoapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://iphonegr.reforma.com/libre/online07/imagetransformer2/ImageTransformer.aspx?img=https://img.gruporeforma.com/imagenes/960x640/6/618/5617635.jpg')),
        ),
        title: const Text('Mi causa tony'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.scrollController,
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    return chatProvider.messages[index].fromWho == FromWho.me
                        ? MyMessage(
                            message: Message(
                              text: chatProvider.messages[index].text,
                              fromWho: FromWho.me,
                            ),
                          )
                        : YoursMessage(
                            message: Message(
                              text: chatProvider.messages[index].text,
                              fromWho: FromWho.your,
                              imageUrl: chatProvider.messages[index].imageUrl,
                            ),
                          );
                  }),
            ),
            MessageFiledBox(
              onCallback: (value) {
                chatProvider.sendMessage(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
