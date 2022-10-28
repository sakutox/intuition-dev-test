import 'package:flutter/material.dart';
import 'package:intuitiondevtest/utils/utils.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            UiUtils.welcomeAndQuestion(
                context, 'Bienvenido a equipesados', '¿Qué deseas hacer?'),
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
                        UiUtils.button(context, 'Quiero buscar',
                            'carrito-de-compras.png', 'general_menu'),
                        const SizedBox(
                          width: 10,
                        ),
                        UiUtils.button(context, 'Quiero publicar',
                            'price-tag.png', 'registro_opciones'),
                      ],
                    ))),
            Positioned(bottom: 20, left: 40, child: UiUtils.yellowButton(context, 10, 0.8, 'Continuar',''))
          ],
        ),
      ),
    );
  }
}
