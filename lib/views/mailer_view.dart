import 'package:flutter/material.dart';
import 'package:magic_project/app/locator.dart';
import 'package:magic_project/viewmodels/mailer_viewmodel.dart';
import 'package:magic_project/views/layouts/centered-scroll_layout.dart';
import 'package:magic_project/views/widgets/navbar_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final _userEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CenteredScrollLayout(
      appBar: NavBarWidget(),
      child: ViewModelBuilder<MailerViewModel>.nonReactive(
        viewModelBuilder: () => locator<MailerViewModel>(),
        builder: (context, viewmodel, child) {
          return Column(
            children: [
              SizedBox(height: 30),
              Text("Laissez nous un message !",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller: _subjectController,
                      decoration: const InputDecoration(
                        hintText: 'Sujet de votre message ...',
                        border: OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Ce champ est obligatoire';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        hintText: 'Message ...',
                        border: OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Ce champ est obligatoire';
                      //   }
                      //   return null;
                      // },
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _userEmailController,
                      decoration: const InputDecoration(
                        hintText: 'Renseigner votre email pour qu\'on puisse vous répondre !',
                        border: OutlineInputBorder(),
                      ),
                      // validator: (value) {
                      //   if (value.isEmpty) {
                      //     return 'Ce champ est obligatoire';
                      //   }
                      //   else if (!EmailValidator.validate(value)) {
                      //     return 'Votre email est invalide'; 
                      //   }
                      //   return null;
                      // },
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print("form is valid");
                            // viewmodel.sendMessage(
                            //   _subjectController.text, 
                            //   _messageController.text, 
                            //   _userEmailController.text
                            // );
                            //_formKey.currentState.reset();
                          }
                        },
                        child: Text('Envoyer'),
                      ),
                    ),
                  ],
                ),
              ),
            ]
          );
        }
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
