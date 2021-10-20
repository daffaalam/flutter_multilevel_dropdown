import 'package:flutter/material.dart';

import '../../model/dummy_data.dart';
import '../../model/processor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Brand> _listBrand = <Brand>[];
  Brand? _brand;
  List<Series> _listSeries = <Series>[];
  Series? _series;
  List<Product> _listProduct = <Product>[];
  Product? _product;

  @override
  void initState() {
    super.initState();
    _listBrand = DummyData.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Multi-Level Dropdown'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _listSeries = <Series>[];
              _listProduct = <Product>[];
              _brand = null;
              _series = null;
              _product = null;
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Brand>(
              items: _itemsBrand(),
              value: _brand,
              hint: const Text('List of Brand'),
              onChanged: (Brand? value) {
                _brand = value;
                _series = null;
                _product = null;
                _listSeries = value?.series ?? <Series>[];
                _listProduct = <Product>[];
                setState(() {});
              },
              isExpanded: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Series>(
              items: _itemsSeries(),
              value: _series,
              hint: const Text('List of Series'),
              onChanged: (Series? value) {
                _series = value;
                _product = null;
                _listProduct = value?.products ?? <Product>[];
                setState(() {});
              },
              isExpanded: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Product>(
              items: _itemsProduct(),
              value: _product,
              hint: const Text('List of Product'),
              onChanged: (Product? value) {
                _product = value;
                setState(() {});
              },
              isExpanded: true,
            ),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<Brand>> _itemsBrand() {
    return List<DropdownMenuItem<Brand>>.from(
      _listBrand.map<DropdownMenuItem<Brand>>(
        (Brand value) => DropdownMenuItem<Brand>(
          child: Text(value.brandName),
          value: value,
        ),
      ),
    );
  }

  List<DropdownMenuItem<Series>> _itemsSeries() {
    return List<DropdownMenuItem<Series>>.from(
      _listSeries.map<DropdownMenuItem<Series>>(
        (Series value) => DropdownMenuItem<Series>(
          child: Text(value.seriesName),
          value: value,
        ),
      ),
    );
  }

  List<DropdownMenuItem<Product>> _itemsProduct() {
    return List<DropdownMenuItem<Product>>.from(
      _listProduct.map<DropdownMenuItem<Product>>(
        (Product value) => DropdownMenuItem<Product>(
          child: Text(value.productName),
          value: value,
        ),
      ),
    );
  }
}
