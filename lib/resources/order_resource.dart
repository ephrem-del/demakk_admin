// import 'package:demakk_admin/objects/order.dart';
import 'package:demakk_admin/objects/order_type.dart';
// import 'package:demakk_admin/resources/priorites.dart';

// import '../objects/custom_order_type.dart';
// import '../objects/date_and_time.dart';
// import 'customer_list.dart';

// List<Order> orders = <Order>[
//   Order(
//     id: '001',
//     type: mug,
//     amount: 2,
//     comment: 'with name',
//     priority: priorities['low']!,
//     customer: customers[1],
//     completed: true,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 4, 1, 8, 12),
//     ),
//   ),
//   Order(
//     id: '002',
//     type: plot,
//     amount: 1,
//     comment: 'black and white',
//     priority: priorities['medium']!,
//     customer: customers[2],
//     completed: true,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 5, 3, 6, 50),
//     ),
//   ),
//   Order(
//       id: '003',
//       type: mug,
//       amount: 7,
//       comment: 'whatever is whenever',
//       priority: priorities['high']!,
//       customer: customers[3],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 1, 2, 9, 5),
//       )),
//   Order(
//       id: '004',
//       type: tshirt,
//       amount: 5,
//       comment: 'a lot of tshirts',
//       priority: priorities['very high']!,
//       customer: customers[4],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 2, 2, 6, 4),
//       )),
//   Order(
//       id: 'id',
//       type: plot,
//       amount: 2,
//       comment: 'golden glitter',
//       priority: priorities['urgent']!,
//       customer: customers[5],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 7, 7, 1, 25),
//       )),
//   Order(
//       id: '002',
//       type: plot,
//       amount: 1,
//       comment: 'black and white',
//       priority: priorities['high']!,
//       customer: customers[3],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 8, 1, 1, 40),
//       )),
//   Order(
//       id: '003',
//       type: mug,
//       amount: 7,
//       comment: 'whatever is whenever',
//       priority: priorities['low']!,
//       customer: customers[3],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 8, 3, 7, 15),
//       )),
//   Order(
//       id: '004',
//       type: tshirt,
//       amount: 5,
//       comment: 'a lot of tshirts',
//       priority: priorities['urgent']!,
//       customer: customers[5],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 3, 3, 6, 9),
//       )),
//   Order(
//       id: 'id',
//       type: plot,
//       amount: 2,
//       comment: 'golden glitter',
//       priority: priorities['low']!,
//       customer: customers[1],
//       completed: false,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 1, 2, 3, 4),
//       )),
//   Order(
//       id: '003',
//       type: mug,
//       amount: 7,
//       comment: 'whatever is whenever',
//       priority: priorities['low']!,
//       customer: customers[3],
//       completed: true,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 8, 3, 7, 15),
//       )),
//   Order(
//       id: '004',
//       type: tshirt,
//       amount: 5,
//       comment: 'a lot of tshirts',
//       priority: priorities['urgent']!,
//       customer: customers[5],
//       completed: true,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 3, 3, 6, 9),
//       )),
//   Order(
//       id: 'id',
//       type: plot,
//       amount: 2,
//       comment: 'golden glitter',
//       priority: priorities['low']!,
//       customer: customers[1],
//       completed: true,
//       dateAndTime: DateAndTime(
//         dateTime: DateTime(2022, 1, 2, 3, 4),
//       )),
//   Order(
//     id: 'id',
//     type: CustomOrderType(
//         instructions: 'instructions goes here',
//         type: 'tshirt with sublimation',
//         name: 'tshirt',
//         price: 200,
//         amharicName: 'ቲሸርት'),
//     amount: 4,
//     comment: 'comment',
//     priority: priorities2[2],
//     customer: customers[1],
//     completed: true,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 2, 4, 2, 1, 9),
//     ),
//   ),
//   Order(
//     id: 'id',
//     type: CustomOrderType(
//         instructions: 'instructions goes here',
//         type: 'tshirt with plot',
//         name: 'tshirt',
//         price: 400,
//         amharicName: 'ቲሸርት'),
//     amount: 2,
//     comment: 'comment',
//     priority: priorities2[3],
//     customer: customers[2],
//     completed: false,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 3, 4, 2, 7, 4),
//     ),
//   ),
//   Order(
//     id: 'id',
//     type: CustomOrderType(
//         instructions: 'instructions goes here',
//         type: 'banner',
//         name: 'tshirt',
//         price: 530,
//         amharicName: 'ቲሸርት'),
//     amount: 9,
//     comment: 'comment',
//     priority: priorities2[1],
//     customer: customers[3],
//     completed: false,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 5, 4, 3, 1, 5),
//     ),
//   ),
//   Order(
//     id: 'id',
//     type: CustomOrderType(
//         instructions: 'instructions goes here',
//         type: 'mesh',
//         name: 'tshirt',
//         price: 20,
//         amharicName: 'ሜሽ'),
//     amount: 1,
//     comment: 'comment',
//     priority: priorities2[0],
//     customer: customers[4],
//     completed: true,
//     dateAndTime: DateAndTime(
//       dateTime: DateTime(2022, 1, 8, 2, 1, 4),
//     ),
//   ),
// ];
//
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
  OrderType(name: 'Others', price: 70, amharicName: 'ሌሎች'),
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
      OrderType(name: 'Polyester Shirt', price: 150, amharicName: 'ኤምጂ'),
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
