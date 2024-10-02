import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatBotButton extends StatelessWidget{
  const ChatBotButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse("http://localhost:8501/");
        if (!await launchUrl(uri)) {
        throw 'Could not launch $uri';
        }
      },
      child: SizedBox(
        height: 150,
        width: 150,
        child: Lottie.asset('assets/animations/Animation - 1727810878604.json'),
      ),
    );
  }

}