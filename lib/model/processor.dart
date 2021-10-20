import 'dart:convert';

/// [JSON to Dart Generator](https://app.quicktype.io/)

List<Brand> processorFromJson(String str) {
  return List<Brand>.from(json.decode(str).map((x) {
    return Brand.fromMap(x);
  }));
}

String processorToJson(List<Brand> data) {
  return json.encode(List<dynamic>.from(data.map((x) {
    return x.toMap();
  })));
}

class Brand {
  Brand({
    required this.id,
    required this.brandName,
    required this.series,
  });

  int id;
  String brandName;
  List<Series> series;

  factory Brand.fromJson(String str) {
    return Brand.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Brand.fromMap(Map<String, dynamic> json) {
    return Brand(
      id: json["id"],
      brandName: json["brandName"],
      series: List<Series>.from(json["series"].map((x) {
        return Series.fromMap(x);
      })),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "brandName": brandName,
      "series": List<dynamic>.from(series.map((x) {
        return x.toMap();
      })),
    };
  }
}

class Series {
  Series({
    required this.id,
    required this.seriesName,
    required this.products,
  });

  int id;
  String seriesName;
  List<Product> products;

  factory Series.fromJson(String str) {
    return Series.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Series.fromMap(Map<String, dynamic> json) {
    return Series(
      id: json["id"],
      seriesName: json["seriesName"],
      products: List<Product>.from(json["products"].map((x) {
        return Product.fromMap(x);
      })),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "seriesName": seriesName,
      "products": List<dynamic>.from(products.map((x) {
        return x.toMap();
      })),
    };
  }
}

class Product {
  Product({
    required this.id,
    required this.productName,
  });

  int id;
  String productName;

  factory Product.fromJson(String str) {
    return Product.fromMap(json.decode(str));
  }

  String toJson() {
    return json.encode(toMap());
  }

  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      productName: json["productName"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "productName": productName,
    };
  }
}
