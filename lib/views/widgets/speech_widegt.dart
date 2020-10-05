import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SpeechWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screen) {

        var columnAligment = 
          screen.deviceScreenType == DeviceScreenType.desktop ? CrossAxisAlignment.start :
          screen.deviceScreenType == DeviceScreenType.tablet ? CrossAxisAlignment.center :
          screen.deviceScreenType == DeviceScreenType.mobile ? CrossAxisAlignment.center :
          null;
        var titleFontSize = 
          screen.deviceScreenType == DeviceScreenType.desktop ? 60.0 :
          screen.deviceScreenType == DeviceScreenType.tablet ? 50.0 :
          screen.deviceScreenType == DeviceScreenType.mobile ? 40.0 :
          null;
        var descriptionFontSize = 
          screen.deviceScreenType == DeviceScreenType.desktop ? 20.0 :
          screen.deviceScreenType == DeviceScreenType.tablet ? 18.0 :
          screen.deviceScreenType == DeviceScreenType.mobile ? 15.0 :
          null;
        var textAligment = 
          screen.deviceScreenType == DeviceScreenType.desktop ? TextAlign.start :
          screen.deviceScreenType == DeviceScreenType.tablet ? TextAlign.center :
          screen.deviceScreenType == DeviceScreenType.mobile ? TextAlign.center :
          null;

        
        return Container(
          child: Column(
            crossAxisAlignment: columnAligment,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "MAKE DEALS\nMAGIC AMAZING",
                textAlign: textAligment,
                style: TextStyle(
                  fontWeight: FontWeight.w800, 
                  fontSize: titleFontSize, 
                  height: 0.9
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RichText(
                textAlign: textAligment,
                text: TextSpan(
                    style: TextStyle(
                      fontSize: descriptionFontSize, 
                      height: 1.7, 
                      color: Colors.grey[800]
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Notre mission est de vous aider à acquérir vos ", 
                    ),
                    TextSpan(
                      text: "Dream Magic Cards\n", 
                      style: TextStyle(fontStyle: FontStyle.italic)
                    ),
                    TextSpan(
                      text: "Vous pourrez enfin construire vos ", 
                    ),
                    TextSpan(
                      text: "Decks", 
                      style: TextStyle(fontStyle: FontStyle.italic)
                    ),
                    TextSpan(
                      text: " grâce à vos nouvelles cartes ! ", 
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}