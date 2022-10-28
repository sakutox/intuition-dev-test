import 'package:flutter/material.dart';
import '../utils/utils.dart';

class GeneralLists extends StatelessWidget {
  const GeneralLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/general_menu');
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      centerTitle: true,
      title: const Text('Maquinas'),
      bottom:
          TabBar(isScrollable: true, indicatorColor: Colors.yellow[700], tabs: [
        Tab(
          child: Text(
            'Máquinas',
            style: UiUtils.textStyleUtilBold(20, Colors.white, 'BarlowT'),
          ),
        ),
        Tab(
          child: Text(
            'Transporte',
            style: UiUtils.textStyleUtilBold(20, Colors.white, 'BarlowT'),
          ),
        ),
        Tab(
          child: Text(
            'Repuestos',
            style: UiUtils.textStyleUtilBold(20, Colors.white, 'BarlowT'),
          ),
        ),
        Tab(
          child: Text(
            'Operadores',
            style: UiUtils.textStyleUtilBold(20, Colors.white, 'BarlowT'),
          ),
        ),
      ]),
    );

    final searchBar =
        UiUtils.textFieldGenerator(searchController, 'Buscar', 'BarlowT');

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: appBar,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                      margin: const EdgeInsets.all(30), child: searchBar),
                ),
                UiUtils.itemCard(context),
                UiUtils.itemCard(context),
                UiUtils.itemCard(context),
                UiUtils.itemCard(context),
                UiUtils.personalizedSizedBox(80)
              ],
            ),
          ),
        ),
        floatingActionButton: UiUtils.yellowButton(context, 30, 0.3, 'Crear Nuevo','create_new'),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: UiUtils.floatingNavBar(context),
      ),
    );
  }
}
