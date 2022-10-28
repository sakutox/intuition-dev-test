import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CreateNew extends StatefulWidget {
  CreateNew({Key? key}) : super(key: key);

  @override
  State<CreateNew> createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/general_lists');
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          )),
      centerTitle: true,
      title: const Text('Maquinas'),
      bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.yellow[700],
          tabs: [
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

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            padding: EdgeInsets.all(10),
            margin:
                const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 40),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Aquí podrás registrar tus maquinas',
                    style: UiUtils.textStyleUtilBold(25, Colors.grey, 'BarlowT')),
                UiUtils.personalizedSizedBox(10),
                Image.asset('assets/images/open.png'),
                UiUtils.personalizedSizedBox(20),
                Text('Aun no tienes',
                    style: UiUtils.textStyleUtilBold(30, Colors.grey, 'Barlow')),
                Text('máquinas registradas',
                    style: UiUtils.textStyleUtilBold(30, Colors.grey, 'Barlow')),
                UiUtils.personalizedSizedBox(10),
                Text('Haz click en el boton para empezar',
                    style: UiUtils.textStyleUtilBold(25, Colors.grey, 'BarlowT')),
                Text('a registrar',
                    style: UiUtils.textStyleUtilBold(25, Colors.grey, 'BarlowT')),
                UiUtils.personalizedSizedBox(20),
                UiUtils.yellowButton(context, 10, 0.8, 'Registrar Maquina', ''),
                UiUtils.personalizedSizedBox(15),
                UiUtils.yellowButton(context, 10, 0.8, 'Omitir por ahora', ''),
                UiUtils.personalizedSizedBox(10),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
