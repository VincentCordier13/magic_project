import 'package:flutter/material.dart';
import 'package:magic_project/views/layouts/centered_layout.dart';
import 'package:magic_project/views/widgets/home/entry_widget.dart';
import 'package:magic_project/views/widgets/home/speech_widget.dart';
import 'package:magic_project/views/widgets/navbar_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        desktop: _HomeViewDestop(),
        tablet: _HomeViewTablet(),
        mobile: _HomeViewMobile(),
      ),
    );
  }
}

class _HomeViewDestop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredLayout(
      child: Column(
        children: [
          Expanded(
            child: Stack(children: [
              Container(
                alignment: Alignment.topCenter,
                child: NavBarWidget(),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/angel.png',
                  height: 400,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(children: [
              SpeechWidget(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: EntryWidget(),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/demon.png',
                  height: 400,
                )),
          ),
        ],
      ),
    );
  }
}

class _HomeViewTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarWidget(),

        SizedBox(
          height: 20,
        ),

        Container(
          alignment: Alignment.center,
          child: Column(children: [
            SpeechWidget(),
            SizedBox(height: 30,),
            EntryWidget(),
          ]),
        ),

        SizedBox(
          height: 20,
        ),

        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/angel.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/demon.png',
                  )
                ),
              ),
            ]
          ),
        ),

      ],
    );
  }
}

class _HomeViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBarWidget(),

        SizedBox(
          height: 20,
        ),

        Container(
          alignment: Alignment.center,
          child: Column(children: [
            SpeechWidget(),
            SizedBox(height: 30,),
            EntryWidget(),
          ]),
        ),

        SizedBox(
          height: 20,
        ),

        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/angel.png',
                    // height: 400,
                    // width: 500,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'assets/demon.png',
                    // height: 400,
                    // width: 500,
                  )
                ),
              ),
            ]
          ),
        ),

      ],
    );
  }
}
