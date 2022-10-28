import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intuitiondevtest/utils/maps.dart';

import '../utils/utils.dart';

class ItemDescription extends StatefulWidget {
  ItemDescription({Key? key}) : super(key: key);

  @override
  State<ItemDescription> createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
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
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(
            Icons.person,
            color: Colors.white,
          )
        ],
        title: Text(
          'Detalles',
          style: UiUtils.textStyleUtilBold(20, Colors.white, 'BarlowT'),
        ));

    final List<String> imgList = [
      'assets/images/escavadora-bosque-fondo.jpg',
      'assets/images/tractor-de-rueda.jpg'
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item, fit: BoxFit.cover, width: 800.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                      child: Container(
                    width: UiUtils.width(context),
                    height: UiUtils.height(context) * 0.1,
                    color: Colors.black,
                  )),
                  Positioned(
                      child: CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                        autoPlay: true, height: UiUtils.height(context) * 0.3),
                  ))
                ],
              ),
              UiUtils.personalizedSizedBox(10),
              Container(
                height: UiUtils.height(context) * 0.04,
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Stack(
                  children: [
                    Positioned(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                            color: Colors.grey,
                          ),
                          Text(
                            'Cucuta',
                            style: UiUtils.textStyleUtilBold(
                                20, Colors.grey, 'BarlowT'),
                          )
                        ],
                      ),
                    ),
                    Positioned(right: 0, child: UiUtils.checkSell('Venta'))
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'tk-456 Excavator',
                    style:
                        UiUtils.textStyleUtilBold(25, Colors.black, 'Barlow'),
                  )),
              UiUtils.personalizedSizedBox(10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: TabBar(
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text('General', style: UiUtils.textStyleUtilBold(20, Colors.black, 'BarlowT'),),
                    ),
                    Tab(
                      child: Text('Detalles', style: UiUtils.textStyleUtilBold(20, Colors.black, 'BarlowT'),),
                    ),
                    Tab(
                      child: Text('Usos', style: UiUtils.textStyleUtilBold(20, Colors.black, 'BarlowT'),),
                    ),

                  ],
                ),
              ),
              UiUtils.personalizedSizedBox(10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                padding: const EdgeInsets.all(10),
                height: UiUtils.height(context)*0.4,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      itemCount: MapsForApp.generals.length,
                      itemBuilder: (BuildContext context, int index){
                      String key = MapsForApp.generals.keys.elementAt(index);
                      return ListTile(
                        leading: new Text("$key"),
                        trailing: new Text("${MapsForApp.generals[key]}"),
                      );
                    }),
                    ListView.builder(
                      itemCount: MapsForApp.details.length,
                      itemBuilder: (BuildContext context, int index){
                      String key = MapsForApp.details.keys.elementAt(index);
                      return ListTile(
                        leading: new Text("$key"),
                        trailing: new Text("${MapsForApp.details[key]}"),
                      );
                    }),
                    Text('Usos del equipo: Construcción, vías, manipulación de chatarra y levantamiento de cargas.'),
                  ],
                ),
              )
              ,UiUtils.personalizedSizedBox(80),
            ],
          ),
        ),
      ),
      floatingActionButton: UiUtils.yellowButton(context, 10, 0.8, 'Contactar Proveedor',''),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  
}