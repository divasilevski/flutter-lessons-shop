import 'package:first_app/models/Cart.dart';
import 'package:first_app/models/Product.dart';
import 'package:first_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ItemPage extends StatelessWidget {
  final String productId;

  const ItemPage({Key key, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ProductDataProvider>(context).getElementById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.marmelad(),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.imgUrl,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imgUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5.0,
              margin:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(fontSize: 26.0),
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text(
                          'Цена: ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                        Text(
                          '${data.price}',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ],
                    ),
                    Divider(),
                    Text(data.description),
                    SizedBox(height: 20.0),
                    Provider.of<CartDataProvider>(context)
                            .cartItems
                            .containsKey(productId)
                        ? Column(
                            children: <Widget>[
                              MaterialButton(
                                color: Color(0xFFCCFF90),
                                child: Text('Перейти в корзину'),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CartPage()));
                                },
                              ),
                              Text(
                                'Товар уже добавлен в корзину',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.blueGrey),
                              )
                            ],
                          )
                        : MaterialButton(
                            color: Color(0xFFCCFF90),
                            child: Text('Добавить в корзину'),
                            onPressed: () {
                              context.read<CartDataProvider>().addItem(
                                    productId: data.id,
                                    imgUrl: data.imgUrl,
                                    title: data.title,
                                    price: data.price,
                                  );
                            },
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
