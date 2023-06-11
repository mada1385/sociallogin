// import 'package:flutter/material.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// class Widgetgenration extends StatelessWidget {
//   Widgetgenration({Key key}) : super(key: key);
//   // client-side you initialize the Chat client with your API key
//   final client = StreamChatClient(
//     "ank4du3gsvsa",
//     logLevel: Level.INFO,
//     connectTimeout: Duration(milliseconds: 6000),
//     receiveTimeout: Duration(milliseconds: 6000),
//   );

//   @override
//   Widget build(BuildContext context) {
//     StreamChannelListController streamUserListController =
//         StreamChannelListController(client: client);
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           StreamChatTheme(
//               data: StreamChatThemeData(colorTheme: StreamColorTheme.dark()),
//               child:
//                   StreamChannelListView(controller: streamUserListController))
//         ],
//       ),
//     );
//     ;
//   }
// }
