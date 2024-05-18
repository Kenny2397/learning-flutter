import 'package:flutter/material.dart';

class MessageFiledBox extends StatelessWidget {
  final ValueChanged<String> onCallback;
  const MessageFiledBox({super.key, required this.onCallback});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.5),
      child: TextFormField(
        onTapOutside: (event) => focusNode.unfocus(),
        // keyboardType: TextInputType.text,
        controller: textController,
        decoration: InputDecoration(
          hintText: 'Mensaje',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              print('onPressed: ${textController.value.text}');
              focusNode.requestFocus();
              onCallback(textController.value.text);
              // textController.clear();
            },
          ),
        ),
        onFieldSubmitted: (value) => {
          focusNode.requestFocus(),
          print(value),
          onCallback(value),
          // textController.clear(),
        },
      ),
    );
  }
}
