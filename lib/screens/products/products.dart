import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_impl/utils/routes.dart';

class Products extends StatelessWidget {
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
          title: const Text('Products'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                context.goNamed(Routes.productDetails,
                    params: {'name': products[index]});
              },
              title: Text(products[index]),
            );
          },
        ));
  }
}
