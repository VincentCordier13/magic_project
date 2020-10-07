import 'package:flutter/material.dart';
import 'package:magic_project/views/layouts/centered_layout.dart';
import 'package:magic_project/views/widgets/navbar_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MailerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout(
        desktop: _MailerViewDestop(),
        tablet: _MailerViewTablet(),
        mobile: _MailerViewMobile(),
      ),
    );
  }
}

class _MailerViewDestop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredLayout(
      appBar: NavBarWidget(),
      child: Column(
        children: [
          Text("MAILER"),
        ],
      ),
    );
  }
}

class _MailerViewTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _MailerViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
