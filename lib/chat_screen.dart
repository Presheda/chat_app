
import 'package:chatapp/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatScreenState();
  }

}
class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  void _handleSubmitted(String text){


    setState(() {

      _messages.insert(0, ChatMessage(text: text));
    });
    _textController.clear();
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            new Flexible(
                child: new TextField(
                  decoration: new InputDecoration.collapsed(
                    hintText: "Send a message",
                  ),
                  controller: _textController,
                  onSubmitted: _handleSubmitted,
                )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: ()=> _handleSubmitted(_textController.text)
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: new EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index)=> _messages[index],
            itemCount: _messages.length,
          ),
        ),
        Divider(height: 1.0),
        Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}


