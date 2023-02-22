import 'package:demakk_admin/objects/stalk.dart';
import 'package:demakk_admin/objects/stalk_category.dart';

import '../objects/stalk_type.dart';

const List<StalkCategory> stalkCategories = <StalkCategory>[
  StalkCategory(categoryTitle: 'Mug', amharicCategoryTitle: 'ኩባያ'),
  StalkCategory(categoryTitle: 'Flash Stamp', amharicCategoryTitle: 'ፍላሽ ማህተም'),
  StalkCategory(
      categoryTitle: 'Poly-Cotton Shirt',
      amharicCategoryTitle: 'ሰብሊሜሽን ኮተን ቲሸርት'),
  StalkCategory(
      categoryTitle: 'Flat-bag Shirt', amharicCategoryTitle: 'ፍላት ባግ ቲሸርት'),
  StalkCategory(
      categoryTitle: 'Polyester Shirt', amharicCategoryTitle: 'ፖሊኢስተር ቲሸርት'),
];

const Map<String, StalkCategory> _categories = <String, StalkCategory>{
  'Mug': StalkCategory(categoryTitle: 'Mug', amharicCategoryTitle: 'ኩባያ'),
  'Flash Stamp': StalkCategory(
      categoryTitle: 'Flash Stamp', amharicCategoryTitle: 'ፍላሽ ማህተም'),
  'Poly-Cotton Shirt': StalkCategory(
      categoryTitle: 'Poly-Cotton Shirt',
      amharicCategoryTitle: 'ሰብሊሜሽን ኮተን ቲሸርት'),
  'Flat-bag Shirt': StalkCategory(
      categoryTitle: 'Flat-bag Shirt', amharicCategoryTitle: 'ፍላት ባግ ቲሸርት'),
  'Polyester Shirt': StalkCategory(
      categoryTitle: 'Polyester Shirt', amharicCategoryTitle: 'ፖሊኢስተር ቲሸርት'),
};

List<Stock> stalks = [
  Stock(
      stockType: StockType(
        price: 270,
        typeName: 'White Mug',
        stalkCategory: _categories['Mug']!,
        amharicTypeName: 'ነጭ ኩባያ',
      ),
      amountLeft: 1),
  Stock(
    stockType: StockType(
      price: 180,
      typeName: 'Magic Mug',
      stalkCategory: _categories['Mug']!,
      amharicTypeName: 'ማጂክ ኩባያ',
    ),
    amountLeft: 5,
  ),
  Stock(
      stockType: StockType(
        price: 300,
        typeName: 'Oval Stamp',
        stalkCategory: _categories['Flash Stamp']!,
        amharicTypeName: 'ሞላላ ማህተም',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 270,
        typeName: 'Head Stamp',
        stalkCategory: _categories['Flash Stamp']!,
        amharicTypeName: 'የራስጌ ማህተም',
      ),
      amountLeft: 1),
  Stock(
    stockType: StockType(
      price: 180,
      typeName: '40x20 Stamp',
      stalkCategory: _categories['Flash Stamp']!,
      amharicTypeName: '40 በ20 ማህተም',
    ),
    amountLeft: 5,
  ),
  Stock(
      stockType: StockType(
        price: 180,
        typeName: 'XXL',
        stalkCategory: _categories['Poly-Cotton Shirt']!,
        amharicTypeName: 'XXL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 180,
        typeName: 'XL',
        stalkCategory: _categories['Poly-Cotton Shirt']!,
        amharicTypeName: 'XL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 180,
        typeName: 'L',
        stalkCategory: _categories['Poly-Cotton Shirt']!,
        amharicTypeName: 'L',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 180,
        typeName: 'M',
        stalkCategory: _categories['Poly-Cotton Shirt']!,
        amharicTypeName: 'M',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'XXL',
        stalkCategory: _categories['Flat-bag Shirt']!,
        amharicTypeName: 'XXL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'XL',
        stalkCategory: _categories['Flat-bag Shirt']!,
        amharicTypeName: 'XL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'L',
        stalkCategory: _categories['Flat-bag Shirt']!,
        amharicTypeName: 'L',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'M',
        stalkCategory: _categories['Flat-bag Shirt']!,
        amharicTypeName: 'M',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'XXL',
        stalkCategory: _categories['Polyester Shirt']!,
        amharicTypeName: 'XXL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'XL',
        stalkCategory: _categories['Polyester Shirt']!,
        amharicTypeName: 'XL',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'L',
        stalkCategory: _categories['Polyester Shirt']!,
        amharicTypeName: 'L',
      ),
      amountLeft: 10),
  Stock(
      stockType: StockType(
        price: 70,
        typeName: 'M',
        stalkCategory: _categories['Polyester Shirt']!,
        amharicTypeName: 'M',
      ),
      amountLeft: 10),
];
