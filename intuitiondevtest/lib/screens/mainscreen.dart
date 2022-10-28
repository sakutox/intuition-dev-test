import 'package:flutter/material.dart';
import 'package:intuitiondevtest/utils/utils.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final textUnderIcon = Text(
      'EQUIPESADOS',
      style: UiUtils.textStyleUtilBold(40, Colors.black, 'Barlow'),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          UiUtils.navigation(context,'welcome');
        },
        child: SafeArea(
          child: Stack(children: [
            Positioned(bottom: 0, child: UiUtils.backGroundImage(context)),
            Positioned(
              right: 100,
              top: 300,
              child: Column(
                children: [
                  UiUtils.equipesadosIcon(context, 0.08),
                  textUnderIcon,
                ],                                                                                                                                                                                                                                                                                                        
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
