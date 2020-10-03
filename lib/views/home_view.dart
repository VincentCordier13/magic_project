import 'package:flutter/material.dart';
import 'package:magic_project/views/templates/centered_template.dart';
import 'package:magic_project/views/widgets/home-action_widget.dart';
import 'package:magic_project/views/widgets/home-speech_widegt.dart';
import 'package:magic_project/views/widgets/information-bottom_widget.dart';
import 'package:magic_project/views/widgets/navigation-bar_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CenteredTemplate(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.topCenter,
                child: NavigationBarWidget(),
              ), 
              Container(
                alignment: Alignment.bottomCenter,
                child: InformationBottomWidget(),
              ), 
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/angel.png',
                  height: 300,
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset('assets/demon.png',
                  height: 300,
                )
              ), 
              Container(
                alignment: Alignment.center,
                child: Row(
                  children: <Widget> [
                    HomeSpeechWidget(),
                    Expanded(
                        child: HomeActionWidget(),
                    ),
                  ]
                ),
              ),
          ],
        ),
      ),
    );
  }
}