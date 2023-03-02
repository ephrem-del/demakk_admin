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
  // 'Mug': OrderType(name: 'Mug', price: 250.0, amharicName: 'ኩባያ'),
  // 'Plot': OrderType(name: 'Plot', price: 60.0, amharicName: 'ፕሎት'),
  // 'T-shirt': OrderType(name: 'T-shirt', price: 180.0, amharicName: 'ቲሸርት'),
  // 'Flash Stamp':
  //     OrderType(name: 'Flash Stamp', price: 180, amharicName: 'ፍላሽ ማህተም'),
  // 'Other': OrderType(name: 'Other', price: 0, amharicName: 'ሌሎች'),

  //Vinyl List
  'Golden Vinyl':
      OrderType(name: 'Golden Vinyl', price: 100, amharicName: 'ጎልደን ፕሎት'),
  'Golden Shine Vinyl': OrderType(
      name: 'Golden Shine Vinyl', price: 110, amharicName: 'ጎልደን ሻይን ፕሎት'),
  'White Vinyl':
      OrderType(name: 'White Vinyl', price: 60, amharicName: 'ነጭ ፕሎት'),
  'Black Vinyl':
      OrderType(name: 'Black Vinyl', price: 65, amharicName: 'ጥቁር ፕሎት'),
  'Others Vinyl':
      OrderType(name: 'Others Vinyl', price: 70, amharicName: 'ሌሎች ፕሎት'),
  'Glass Sticker':
      OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት ስቲከር'),

  //Mug List
  'White Mug': OrderType(name: 'White Mug', price: 270, amharicName: 'ነጭ ኩባያ'),
  'Magic Mug': OrderType(name: 'Magic Mug', price: 300, amharicName: 'ማጂክ ኩባያ'),

  //Stamp list
  'Oval Stamp':
      OrderType(name: 'Oval Stamp', price: 300, amharicName: 'ሞላላ ማህተም'),
  'Head Stamp':
      OrderType(name: 'Head Stamp', price: 270, amharicName: 'የራስጌ ማህተም'),
  '40x20 Stamp':
      OrderType(name: '40x20 Stamp', price: 280, amharicName: '40x20 ማህተም'),

  //Shirts
  //Poly-Cotton Shirts
  // white poly cotton list
  'Poly-Cotton White XXL': OrderType(
      name: 'Poly-Cotton White XXL',
      price: 180,
      amharicName: 'ነጭ XXL ኮተን ሰብሊሜሽን'),
  'Poly-Cotton White XL': OrderType(
      name: 'Poly-Cotton White XL',
      price: 180,
      amharicName: 'ነጭ XL ኮተን ሰብሊሜሽን'),
  'Poly-Cotton White L': OrderType(
      name: 'Poly-Cotton White L', price: 180, amharicName: 'ነጭ L ኮተን ሰብሊሜሽን'),
  'Poly-Cotton White M': OrderType(
      name: 'Poly-Cotton White M', price: 180, amharicName: 'ነጭ M ኮተን ሰብሊሜሽን'),

  // black poly cotton list
  'Poly-Cotton Black XXL': OrderType(
      name: 'Poly-Cotton Black XXL',
      price: 180,
      amharicName: 'ጥቁር XXL ኮተን ሰብሊሜሽን'),
  'Poly-Cotton Black XL': OrderType(
      name: 'Poly-Cotton Black XL',
      price: 180,
      amharicName: 'ጥቁር XL ኮተን ሰብሊሜሽን'),
  'Poly-Cotton Black L': OrderType(
      name: 'Poly-Cotton Black L', price: 180, amharicName: 'ጥቁር L ኮተን ሰብሊሜሽን'),
  'Poly-Cotton Black M': OrderType(
      name: 'Poly-Cotton Black M', price: 180, amharicName: 'ጥቁር M ኮተን ሰብሊሜሽን'),

  //Flat-Bag Shirt List
  //white flat-bag list
  'Flat-Bag White XXL': OrderType(
      name: 'Flat-Bag White XXL', price: 70, amharicName: 'ነጭ XXL ፍላት ባግ'),
  'Flat-Bag White XL': OrderType(
      name: 'Flat-Bag White XL', price: 70, amharicName: 'ነጭ XL ፍላት ባግ'),
  'Flat-Bag White L': OrderType(
      name: 'Flat-Bag White L', price: 70, amharicName: 'ነጭ L ፍላት ባግ'),
  'Flat-Bag White M': OrderType(
      name: 'Flat-Bag White M', price: 70, amharicName: 'ነጭ M ፍላት ባግ'),

  //black flat-bag list
  'Flat-Bag Black XXL': OrderType(
      name: 'Flat-Bag Black XXL', price: 70, amharicName: 'ጥቁር XXL ፍላት ባግ'),
  'Flat-Bag Black XL': OrderType(
      name: 'Flat-Bag Black XL', price: 70, amharicName: 'ጥቁር XL ፍላት ባግ'),
  'Flat-Bag Black L': OrderType(
      name: 'Flat-Bag Black L', price: 70, amharicName: 'ጥቁር L ፍላት ባግ'),
  'Flat-Bag Black M': OrderType(
      name: 'Flat-Bag Black M', price: 70, amharicName: 'ጥቁር M ፍላት ባግ'),

  //Polyester Shirt List
  //white polyester shirt
  'Polyester White XXL': OrderType(
      name: 'Polyester White XXL', price: 150, amharicName: 'ነጭ XXL ፖሊስተር'),
  'Polyester White XL': OrderType(
      name: 'Polyester White XL', price: 150, amharicName: 'ነጭ XL ፖሊስተር'),
  'Polyester White L': OrderType(
      name: 'Polyester White L', price: 150, amharicName: 'ነጭ L ፖሊስተር'),
  'Polyester White M': OrderType(
      name: 'Polyester White M', price: 150, amharicName: 'ነጭ M ፖሊስተር'),

  //black polyester shirt
  'Polyester Black XXL': OrderType(
      name: 'Polyester Black XXL', price: 150, amharicName: 'ጥቁር XXL ፖሊስተር'),
  'Polyester Black XL': OrderType(
      name: 'Polyester Black XL', price: 150, amharicName: 'ጥቁር XL ፖሊስተር'),
  'Polyester Black L': OrderType(
      name: 'Polyester Black L', price: 150, amharicName: 'ጥቁር L ፖሊስተር'),
  'Polyester Black M': OrderType(
      name: 'Polyester Black M', price: 150, amharicName: 'ጥቁር M ፖሊስተር'),
};

Map<String, OrderType> plotTypesMap = {
  'Golden Vinyl':
      OrderType(name: 'Golden Vinyl', price: 100, amharicName: 'ጎልደን ፕሎት'),
  'Golden Shine Vinyl': OrderType(
      name: 'Golden Shine Vinyl', price: 110, amharicName: 'ጎልደን ሻይን ፕሎት'),
  'White Vinyl':
      OrderType(name: 'White Vinyl', price: 60, amharicName: 'ነጭ ፕሎት'),
  'Black Vinyl':
      OrderType(name: 'Black Vinyl', price: 65, amharicName: 'ጥቁር ፕሎት'),
  // 'Others': OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
  'Glass Sticker':
      OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት'),
};

List<OrderType> plotTypes = <OrderType>[
  OrderType(name: 'Golden Vinyl', price: 100, amharicName: 'ጎልደን ፕሎት'),
  OrderType(
      name: 'Golden Shine Vinyl', price: 110, amharicName: 'ጎልደን ሻይን ፕሎት'),
  OrderType(name: 'White Vinyl', price: 60, amharicName: 'ነጭ ፕሎት'),
  OrderType(name: 'Black Vinyl', price: 65, amharicName: 'ጥቁር ፕሎት'),
  // OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
  OrderType(name: 'Glass Sticker', price: 30, amharicName: 'የመስታወት እስቲከር'),
];

Map<String, OrderType> mugTypesMap = <String, OrderType>{
  'White Mug': OrderType(name: 'White Mug', price: 270, amharicName: 'ነጭ ኩባያ'),
  'Magic Mug': OrderType(name: 'Magic Mug', price: 300, amharicName: 'ማጂክ ኩባያ'),
};

List<OrderType> mugTypes = <OrderType>[
  OrderType(name: 'White Mug', price: 270, amharicName: 'ነጭ ኩባያ'),
  OrderType(name: 'Magic Mug', price: 300, amharicName: 'ማጂክ ኩባያ'),
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
