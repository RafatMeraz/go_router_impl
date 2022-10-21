import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../utils/routes.dart';

class Carts extends StatelessWidget {
  List<String> products = [
    'yo',
    'nigga',
    'me',
    'meh',
    'hai yaa',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Carts'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                context.pushNamed(Routes.productDetails,
                    params: {'name': products[index]});
              },
              title: Text(products[index]),
            );
          },
        ));
  }
}
