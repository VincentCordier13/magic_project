import 'package:flutter/material.dart';
import 'package:magic_project/views/templates/centered_template.dart';
import 'package:magic_project/views/widgets/home-action_widget.dart';
import 'package:magic_project/views/widgets/home-speech_widegt.dart';
import 'package:magic_project/views/widgets/navigation-bar_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredTemplate(
          child: Column(children: <Widget>[
            NavigationBarWidget(),
            Expanded(
              child: Row(children: [
                HomeSpeechWidget(),
                Expanded(
                    child: Center(
                      child: HomeActionWidget()
                  ),
                ),
              ])
            ),
          ],
        ),
      ),
    );
  }
}