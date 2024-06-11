import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:messenger/components/messages/send_message.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/modules/home/service/home_service.dart';
import 'package:messenger/modules/welcome/welcome_page.dart';
import 'package:messenger/service/token_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.password});
  final String? password;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  String splitText(String text) {
    final sms = text.trim();
    if (sms != '') {
      return sms;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () async {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const WelcomePage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  await TokenService().removeData();
                },
                child: const Text('Logout Account'),
              ),
              PopupMenuItem(
                onTap: () async {
                  Navigator.pushAndRemoveUntil<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const WelcomePage(),
                    ),
                    ModalRoute.withName('/'),
                  );
                  await HomeService().delete(widget.password ?? '');
                },
                child: const Text('Delete Account'),
              ),
            ],
          ),
        ],
        title: const Text('Flash Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: HomeService.streamMessage(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final message =
                  
                      (snapshot.data!.docs.reversed as Iterable)
                      .map(
                        
                    (e) => UserModel.fromJson(

                      e.data(),

                    )..isMe = e.data()['user'] ==
                        FirebaseAuth.instance.currentUser!.email,
                  );
                  return ListView(
                    children: message
                        .map((e) => MessageWidget(
                              userModel: e,
                            ))
                        .toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          SendMessage(
            controller,
            onPressed: () async {
              final sms = controller.text;
              controller.clear();
              await HomeService.sendMessage(splitText(sms));
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.userModel,
  });

  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !userModel!.isMe! ? 7 : size.width / 3,
        7,
        userModel!.isMe! ? 7 : size.width / 3,
        7,
      ),
      child: Material(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(25),
            bottomRight: const Radius.circular(25),
            topLeft: userModel!.isMe!
                ? const Radius.circular(25)
                : const Radius.circular(0),
            topRight: !userModel!.isMe!
                ? const Radius.circular(25)
                : const Radius.circular(0),
          ),
        ),
        color: userModel!.isMe! ? theme.primary : theme.onPrimary,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            children: [
              !userModel!.isMe!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          userModel!.user,
                          style: TextStyle(
                            color: theme.primary,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              Text(
                userModel!.sms,
                style: TextStyle(
                  color: userModel!.isMe! ? Colors.white : null,
                  fontSize: 20,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yy (hh:mm)').format(userModel!.dateTime),
                    style: TextStyle(
                      color: userModel!.isMe! ? Colors.white : null,
                      fontSize: 16,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
