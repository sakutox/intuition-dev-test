import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class UiUtils {
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // Icon for general uses
  static equipesadosIcon(BuildContext context, double size) {
    return Center(
        child: SizedBox(
            height: UiUtils.height(context) * size,
            child: Image.asset('assets/images/Equipesados.png')));
  }

  //Text style with bold font
  static textStyleUtilBold(double size, Color color, String font) {
    return TextStyle(
        fontFamily: font,
        fontSize: size,
        color: color,
        overflow: TextOverflow.clip);
  }

  //background image used on 3 screens
  static backGroundImage(BuildContext context) {
    return Center(
        child: SizedBox(
            height: UiUtils.height(context) * 0.5,
            child: Image.asset(
              'assets/images/background-image-equipesados.jpg',
              fit: BoxFit.fitWidth,
            )));
  }

  static navigation(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed('/$route');
  }

  static floatingNavBar(BuildContext context) {
    return FloatingNavbar(
      width: UiUtils.width(context) * 0.9,
      selectedItemColor: Colors.yellow[700],
      unselectedItemColor: Colors.white,
      selectedBackgroundColor: Colors.black,
      onTap: (int val) => {},
      items: [
        FloatingNavbarItem(icon: Icons.home),
        FloatingNavbarItem(icon: Icons.question_mark_rounded),
        FloatingNavbarItem(icon: Icons.chat_bubble_outline),
        FloatingNavbarItem(icon: Icons.person),
      ],
      currentIndex: 0,
    );
  }

  static yellowButton(
      BuildContext context, double radius, double size, String label, String route) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      color: Colors.yellow[700],
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: UiUtils.width(context) * size,
        onPressed: () async {
          UiUtils.navigation(context, route);
        },
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }

  static Material button(
      BuildContext context, String label, String image, String route) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      child: MaterialButton(
        minWidth: UiUtils.width(context) * 0.4,
        onPressed: () {
          UiUtils.navigation(context, route);
        },
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset('assets/images/$image')),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: UiUtils.textStyleUtilBold(20, Colors.black, 'BarlowT'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Container welcomeAndQuestion(
      BuildContext context, String bigLabel, String smallLabel) {
    return Container(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiUtils.equipesadosIcon(context, 0.05),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: Text(bigLabel,
                  style: UiUtils.textStyleUtilBold(35, Colors.black, 'Barlow')),
            ),
            Text(
              smallLabel,
              style: UiUtils.textStyleUtilBold(25, Colors.black, 'BarlowT'),
            ),
          ],
        ));
  }

  static Container bigTextSmallText(
      BuildContext context, String bigLabel, String smallLabel) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: Text(bigLabel,
                  style: UiUtils.textStyleUtilBold(30, Colors.black, 'Barlow')),
            ),
            Text(
              smallLabel,
              style: UiUtils.textStyleUtilBold(20, Colors.black, 'BarlowT'),
            ),
          ],
        ));
  }

  static TextField textFieldGenerator(
      TextEditingController controller, String textFieldLabel, String font) {
    return TextField(
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: TextInputType.name,
        decoration: UiUtils.inputDecorationUtil(textFieldLabel, font));
  }

  static inputDecorationUtil(String etiqueta, String font) {
    return InputDecoration(
        fillColor: Colors.grey,
        floatingLabelAlignment: FloatingLabelAlignment.center,
        hintText: etiqueta,
        hintStyle: textStyleUtilBold(17, Colors.grey, font),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }

  static personalizedSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  static personalizedSizedBoxWidth(double width) {
    return SizedBox(
      width: width,
    );
  }

  static boxDecoration() {
    return BoxDecoration(
        border: Border.all(), borderRadius: BorderRadius.circular(5));
  }

  static checkSell(String label) {
    return Container(
      padding: const EdgeInsets.only(right: 5),
      decoration: UiUtils.boxDecoration(),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: Colors.orangeAccent[600],
          ),
          Text(
            label,
            style: UiUtils.textStyleUtilBold(15, Colors.black, 'BarlowT'),
          )
        ],
      ),
    );
  }

  static itemCard(BuildContext context) {
    return InkWell(
      onTap: (){
        UiUtils.navigation(context, 'item_description');
      },
      child: Container(
        width: UiUtils.width(context) * 0.9,
        margin: const EdgeInsets.only(right: 30, left: 30),
        child: Stack(
          children: [
            // ignore: sized_box_for_whitespace
            Positioned(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    margin: EdgeInsets.only(
                        left: UiUtils.width(context) * 0.2, bottom: 10),
                    padding: const EdgeInsets.only(left: 50, bottom: 10),
                    width: UiUtils.width(context) * 0.8,
                    child: Stack(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on_rounded,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    'Cucuta',
                                    style: UiUtils.textStyleUtilBold(
                                        15, Colors.grey, 'BarlowT'),
                                  )
                                ],
                              ),
                              Text(
                                'Some long tk-456 name for an excavator example name',
                                style: UiUtils.textStyleUtilBold(
                                    23, Colors.black, 'Barlow'),
                              ),
                              UiUtils.personalizedSizedBox(10),
                              Row(
                                children: [
                                  UiUtils.checkSell('Venta'),
                                  UiUtils.personalizedSizedBoxWidth(10),
                                  UiUtils.checkSell('Alquiler'),
                                ],
                              )
                            ]),
                        Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5),
                                ),
                                color: Colors.orange[800],
                              ),
                              child: Text(
                                'Max. 2.65 tn',
                                style: UiUtils.textStyleUtilBold(
                                    15, Colors.white, 'BarlowT'),
                              ),
                            ))
                      ],
                    ))),
            Positioned(
                top: 15,
                child: Container(
                  width: UiUtils.width(context) * 0.3,
                  height: UiUtils.height(context) * 0.15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset('assets/images/escavadora-cielo-fondo.jpg',
                        fit: BoxFit.fill),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
