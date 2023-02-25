// import 'package:demakk_admin/objects/order.dart';
import 'package:demakk_admin/objects/order_type.dart';
// import 'package:demakk_admin/resources/priorites.dart';

OrderType mug = OrderType(name: 'mug', price: 250.0, amharicName: 'ኩባያ');
OrderType plot = OrderType(name: 'plot', price: 60.0, amharicName: 'ፕሎት');
OrderType tshirt = OrderType(name: 'tshirt', price: 180.0, amharicName: 'ቲሸርት');

List<OrderType> orderTypes = <OrderType>[
  OrderType(name: 'Mug', price: 250.0, amharicName: 'ኩባያ'),
  OrderType(name: 'Plot', price: 60.0, amharicName: 'ፕሎት'),
  OrderType(name: 'T-shirt', price: 180.0, amharicName: 'ቲሸርት'),
  OrderType(name: 'Flash Stamp', price: 180, amharicName: 'ፍላሽ ማህተም'),
  OrderType(name: 'Other', price: 0, amharicName: 'ሌሎች'),
];

Map<String, OrderType> orderTypesMap = {
  'Mug': OrderType(name: 'Mug', price: 250.0, amharicName: 'ኩባያ'),
  'Plog': OrderType(name: 'Plot', price: 60.0, amharicName: 'ፕሎት'),
  'T-shirt': OrderType(name: 'T-shirt', price: 180.0, amharicName: 'ቲሸርት'),
  'Flash Stamp':
      OrderType(name: 'Flash Stamp', price: 180, amharicName: 'ፍላሽ ማህተም'),
  'Other': OrderType(name: 'Other', price: 0, amharicName: 'ሌሎች'),
};

Map<String, OrderType> allOrderTypesMap = {
  'Mug': OrderType(name: 'Mug', price: 250.0, amharicName: 'ኩባያ'),
  'Plog': OrderType(name: 'Plot', price: 60.0, amharicName: 'ፕሎት'),
  'T-shirt': OrderType(name: 'T-shirt', price: 180.0, amharicName: 'ቲሸርት'),
  'Flash Stamp':
      OrderType(name: 'Flash Stamp', price: 180, amharicName: 'ፍላሽ ማህተም'),
  'Other': OrderType(name: 'Other', price: 0, amharicName: 'ሌሎች'),
  'Golden': OrderType(name: 'Golden', price: 100, amharicName: 'ጎልደን'),
  'Golden Shine':
      OrderType(name: 'Golden Shine', price: 110, amharicName: 'ጎልደን ሻይን'),
  'White': OrderType(name: 'White', price: 60, amharicName: 'ነጭ'),
  'Black': OrderType(name: 'Black', price: 65, amharicName: 'ጥቁር'),
  'Others': OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
  'Glass Sticker':
      OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት'),
  'White': OrderType(name: 'White', price: 270, amharicName: 'ነጭ'),
  'Magic': OrderType(name: 'Magic', price: 300, amharicName: 'ማጂክ'),
  'Oval Stamp':
      OrderType(name: 'Oval Stamp', price: 300, amharicName: 'ሞላላ ማህተም'),
  'Head Stamp':
      OrderType(name: 'Head Stamp', price: 270, amharicName: 'የራስጌ ማህተም'),
  '40x20 Stamp':
      OrderType(name: '40x20 Stamp', price: 280, amharicName: '40x20 ማህተም'),
};

Map<String, OrderType> plotTypesMap = {
  'Golden': OrderType(name: 'Golden', price: 100, amharicName: 'ጎልደን'),
  'Golden Shine':
      OrderType(name: 'Golden Shine', price: 110, amharicName: 'ጎልደን ሻይን'),
  'White': OrderType(name: 'White', price: 60, amharicName: 'ነጭ'),
  'Black': OrderType(name: 'Black', price: 65, amharicName: 'ጥቁር'),
  'Others': OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
  'Glass Sticker':
      OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት'),
};

List<OrderType> plotTypes = <OrderType>[
  OrderType(name: 'Golden', price: 100, amharicName: 'ጎልደን'),
  OrderType(name: 'Golden Shine', price: 110, amharicName: 'ጎልደን ሻይን'),
  OrderType(name: 'White', price: 60, amharicName: 'ነጭ'),
  OrderType(name: 'Black', price: 65, amharicName: 'ጥቁር'),
  // OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
  OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት'),
];

Map<String, OrderType> mugTypesMap = <String, OrderType>{
  'White': OrderType(name: 'White', price: 270, amharicName: 'ነጭ'),
  'Magic': OrderType(name: 'Magic', price: 300, amharicName: 'ማጂክ'),
};

List<OrderType> mugTypes = <OrderType>[
  OrderType(name: 'White Mug', price: 270, amharicName: 'ነጭ'),
  OrderType(name: 'Magic Mug', price: 300, amharicName: 'ማጂክ'),
];

Map<String, OrderType> tshirtTypesMap = <String, OrderType>{
  'Poly-Cotton Shirt': OrderType(
      name: 'Poly-Cotton Shirt', price: 180, amharicName: 'ኮተን ሰብሊሜሽን'),
  'Flat-bag Shirt':
      OrderType(name: 'Flat-bag Shirt', price: 70, amharicName: 'ፍላት ባግ'),
  'Polyester Shirt':
      OrderType(name: 'Polyester Shirt', price: 150, amharicName: 'ፖሊስተር'),
};

List<OrderType> tshirtTypes = <OrderType>[
  OrderType(name: 'Poly-Cotton Shirt', price: 180, amharicName: 'ኮተን ሰብሊሜሽን'),
  OrderType(name: 'Flat-Bag Shirt', price: 70, amharicName: 'ፍላት ባግ'),
  OrderType(name: 'Polyester Shirt', price: 150, amharicName: 'ፖሊስተር'),
];

Map<String, OrderType> flashStampTypesMap = <String, OrderType>{
  'Oval Stamp':
      OrderType(name: 'Oval Stamp', price: 300, amharicName: 'ሞላላ ማህተም'),
  'Head Stamp':
      OrderType(name: 'Head Stamp', price: 270, amharicName: 'የራስጌ ማህተም'),
  '40x20 Stamp':
      OrderType(name: '40x20 Stamp', price: 280, amharicName: '40x20 ማህተም'),
};

List<OrderType> flashStampTypes = <OrderType>[
  OrderType(name: 'Oval Stamp', price: 300, amharicName: 'ሞላላ ማህተም'),
  OrderType(name: 'Head Stamp', price: 270, amharicName: 'የራስጌ ማህተም'),
  OrderType(name: '40x20 Stamp', price: 280, amharicName: '40x20 ማህተም'),
];
