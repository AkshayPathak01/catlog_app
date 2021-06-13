import 'package:catlog_app/Model/catlog.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];
  // store id of item
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

// get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

//add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

//remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}