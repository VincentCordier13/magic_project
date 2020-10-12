import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/viewmodels/home_viewmodel.dart';
import 'package:magic_project/views/layouts/centered_layout.dart';
import 'package:magic_project/views/widgets/home/home-entry_widget.dart';
import 'package:magic_project/views/widgets/home/home-speech_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<HomeViewModel>.nonReactive(
        viewModelBuilder: () => locator<HomeViewModel>(),
        builder: (context, viewmodel, child) => ScreenTypeLayout(
          desktop: _HomeViewDestop(viewmodel: viewmodel),
          tablet: _HomeViewTablet(),
          mobile: _HomeViewMobile(),
        ), 
      ),
    );
  }
}

class _HomeViewDestop extends StatelessWidget {
  final HomeViewModel viewmodel;
  const _HomeViewDestop({Key key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CenteredLayout(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/angel.png',
              height: 400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(children: [
              HomeSpeechWidget(),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: HomeEntryWidget(viewmodel: viewmodel),
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
    //   children: [
    //     NavBarWidget(),

    //     SizedBox(
    //       height: 20,
    //     ),

    //     Container(
    //       alignment: Alignment.center,
    //       child: Column(children: [
    //         HomeSpeechWidget(),
    //         SizedBox(height: 30,),
    //         HomeEntryWidget(),
    //       ]),
    //     ),

    //     SizedBox(
    //       height: 20,
    //     ),

    //     Expanded(
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Expanded(
    //             child: Container(
    //               child: Image.asset(
    //                 'assets/angel.png',
    //               ),
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               child: Image.asset(
    //                 'assets/demon.png',
    //               )
    //             ),
    //           ),
    //         ]
    //       ),
    //     ),

    //   ],
    );
  }
}

class _HomeViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // children: [
      //   NavBarWidget(),

      //   SizedBox(
      //     height: 20,
      //   ),

      //   Container(
      //     alignment: Alignment.center,
      //     child: Column(children: [
      //       HomeSpeechWidget(),
      //       SizedBox(height: 30,),
      //       HomeEntryWidget(),
      //     ]),
      //   ),

      //   SizedBox(
      //     height: 20,
      //   ),

      //   Expanded(
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.end,
      //       children: [
      //         Expanded(
      //           child: Container(
      //             child: Image.asset(
      //               'assets/angel.png',
      //               // height: 400,
      //               // width: 500,
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //           child: Container(
      //             child: Image.asset(
      //               'assets/demon.png',
      //               // height: 400,
      //               // width: 500,
      //             )
      //           ),
      //         ),
      //       ]
      //     ),
      //   ),

      // ],
    );
  }
}
