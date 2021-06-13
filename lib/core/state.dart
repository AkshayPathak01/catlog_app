import 'package:velocity_x/velocity_x.dart';

import 'package:catlog_app/Model/cart.dart';
import 'package:catlog_app/Model/catlog.dart';

class MyStore extends VxState {
  CatalogModel catalog;
  CartModel cart;
  MyStore(
    this.catalog,
    this.cart,
  ) {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
