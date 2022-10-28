import 'package:flutter/material.dart';
import 'package:intuitiondevtest/utils/utils.dart';

class GeneralMenu extends StatelessWidget {
  const GeneralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final appBar = AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
        centerTitle: true,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
        title: UiUtils.equipesadosIcon(context, 0.02));

    final announceSectionPart = Container(
      height: UiUtils.height(context) * 0.28,
      width: UiUtils.width(context),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Stack(
        children: [
          Positioned(
              child: Container(
            margin: const EdgeInsets.only(top: 40, right: 15, left: 15),
            height: UiUtils.height(context) * 0.15,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
          )),
          Positioned(
              child: Container(
            margin: const EdgeInsets.only(top: 20, right: 30, left: 30),
            height: UiUtils.height(context) * 0.2,
            width: UiUtils.width(context) * 0.9,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    spreadRadius: 0.05,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                    width: UiUtils.width(context) * 0.6,
                    right: 7,
                    child: Image.asset(
                      'assets/images/escavadora-fondo-blanco-low.png',
                    )),
                Positioned(
                  top: 10,
                  left: 10,
                  child: SizedBox(
                    width: UiUtils.width(context) * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gran descuento',
                          style: UiUtils.textStyleUtilBold(
                              15, Colors.black, 'BarlowT'),
                        ),
                        Text('-20% en la marca Jhon Deere',
                            style: UiUtils.textStyleUtilBold(
                                25, Colors.black, 'Barlow'),
                            maxLines: 2,
                            overflow: TextOverflow.clip),
                        UiUtils.personalizedSizedBox(10),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                          child: MaterialButton(
                            height: UiUtils.height(context) * 0.03,
                            minWidth: UiUtils.width(context) * 0.3,
                            onPressed: () async {},
                            child: Text(
                              "Ver ofertas",
                              textAlign: TextAlign.center,
                              style: UiUtils.textStyleUtilBold(
                                  20, Colors.white, 'BarlowT'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: UiUtils.floatingNavBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            announceSectionPart,
            UiUtils.bigTextSmallText(
                context, 'Categorías', 'Selecciona una categoría'),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 30, bottom: 20),
                  child: Row(
                    children: [
                      UiUtils.button(context, 'Máquinas', 'excavator.png', 'general_lists'),
                      UiUtils.personalizedSizedBoxWidth(20),
                      UiUtils.button(context, 'Transportadores', 'delivery-truck.png', 'general_lists')
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      UiUtils.button(context, 'Repuestos', 'settings.png', 'general_lists'),
                      UiUtils.personalizedSizedBoxWidth(20),
                      UiUtils.button(context, 'Operadores', 'engineer.png', 'general_lists')
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
