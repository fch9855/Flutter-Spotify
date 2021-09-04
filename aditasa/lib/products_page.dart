import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  static String id = 'product_page';

  @override
  _ProductsPageState createState() => _ProductsPageState();

}

class _ProductsPageState extends State<ProductsPage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                child: Column(
                  children:[
                    Expanded(child: 
                        Image.asset('Imagenes/img.png')
                    ),
                    Text("Spotify"),
                    SizedBox(
                      height: 10.0,
                    )
                  ]
                ),
              decoration: BoxDecoration(
                color:Colors.black87,
              )
            ),
            ListTile(
              leading: Icon(Icons.person),
              title:Text('Capturar nombre se usuario'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.volume_up_rounded),
              title:Text('Mostrar Canciones'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.airline_seat_individual_suite),
              title:Text('Cerrar Sesion'),
              onTap: (){},
            ),
          ],
        )
      ),
    ),
    );

  }
}