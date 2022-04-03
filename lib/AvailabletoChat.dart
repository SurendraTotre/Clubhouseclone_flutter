import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableToChat extends StatefulWidget {
  const AvailableToChat({Key? key}) : super(key: key);

  @override
  _AvailableToChatState createState() => _AvailableToChatState();
}

class _AvailableToChatState extends State<AvailableToChat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(CupertinoIcons.back),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Available to chat'),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://picsum.photos/seed/409/600',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Text(
                      'Hello World',
                    )
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                )
              ],
            ),
            Row()
          ],
        ),
      ),
    );
  }
}
