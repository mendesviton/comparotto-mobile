enum StockType { up, down }

List<StockItemModel> stockHomeList = [
  StockItemModel(
      type: StockType.down, title: 'Farinha de rosca', date: '03/06/2000'),
  StockItemModel(type: StockType.up, title: 'Pão', date: '03/06/2000'),
  StockItemModel(type: StockType.up, title: 'Carne moída', date: '03/06/2000'),
  StockItemModel(
      type: StockType.down, title: 'Farinha de rosca', date: '03/06/2000'),
];

class StockItemModel {
  StockType type;
  String title;
  String date;
  StockItemModel({
    required this.type,
    required this.title,
    required this.date,
  });
}
