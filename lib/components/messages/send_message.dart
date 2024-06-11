import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage(
    this.controller, {
    this.onPressed,
    super.key,
  });

  final TextEditingController controller;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Текст жазыңыз ...',
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
