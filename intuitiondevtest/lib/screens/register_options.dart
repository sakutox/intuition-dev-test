import 'package:flutter/material.dart';

import '../utils/utils.dart';

class RegisterOption extends StatelessWidget {
  const RegisterOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            UiUtils.welcomeAndQuestion(
                context, 'Registro', '¿Registrarme como?'),
            Positioned(
              bottom: 0,
              child: UiUtils.backGroundImage(context),
            ),
            Positioned(
                top: 250,
                right: 35,
                child: SizedBox(
                    height: UiUtils.height(context) * 0.15,
                    child: Row(
                      children: [
                        UiUtils.button(
                            context, 'Persona Natural', 'engineer.png', 'register'),
                        const SizedBox(
                          width: 10,
                        ),
                        UiUtils.button(context, 'Persona Juridica',
                            'business-and-trade.png', 'register'),
                      ],
                    ))),
            Positioned(bottom: 20, left: 40, child: UiUtils.yellowButton(context, 10, 0.8, 'Continuar','register'))
          ],
        ),
      ),
    );
  }
}
