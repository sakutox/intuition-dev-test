import 'package:flutter/material.dart';
import 'package:intuitiondevtest/utils/utils.dart';
import 'package:intuitiondevtest/utils/verification_utils.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
  

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController townController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    final yellowButton = Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.yellow[700],
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: UiUtils.width(context) * 0.8,
        onPressed: () async {
          if (VerificationUtils.emailVerification(emailController.text) &&
              VerificationUtils.nameVerification(nameController.text) &&
              nameController.text.isNotEmpty) {

            provider.userProvider.email = emailController.text;
            provider.userProvider.phone = phoneController.text;
            provider.userProvider.name = nameController.text;
            provider.userProvider.identification = idController.text;
            provider.userProvider.town = townController.text;
            provider.userProvider.city = cityController.text;
            provider.userProvider.address = addressController.text;
            

            provider.userProvider.createUser(provider.userProvider, context);
          } else {}
        },
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, color: Colors.black),
        ),
      ),
    );

    return Scaffold(
      floatingActionButton: yellowButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UiUtils.welcomeAndQuestion(
                  context, 'Registro', 'Datos personales'),
              UiUtils.personalizedSizedBox(50),
              Container(
                margin: const EdgeInsets.only(right: 30, left: 30),
                child: Column(
                  children: [
                    UiUtils.textFieldGenerator(
                        nameController, 'Nombre Completo', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        emailController, 'Email', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        phoneController, 'Telefono', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        idController, 'Identificación', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        townController, 'Departamento', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        cityController, 'Ciudad', 'BarlowT'),
                    UiUtils.personalizedSizedBox(10),
                    UiUtils.textFieldGenerator(
                        addressController, 'Direccion', 'BarlowT'),
                    UiUtils.personalizedSizedBox(100),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
