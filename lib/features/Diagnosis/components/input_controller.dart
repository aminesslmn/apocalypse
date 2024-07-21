import 'package:flutter/material.dart';

class InputContainer extends StatefulWidget {
  final TextEditingController
      textController; // Callback to notify parent when submit is clicked

  const InputContainer({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  _InputContainerState createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: widget.textController,
              maxLines: null, // Allows the TextField to expand vertically
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type here...',
                contentPadding: EdgeInsets.all(16.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
