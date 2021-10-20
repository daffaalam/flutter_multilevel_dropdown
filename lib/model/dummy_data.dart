import 'processor.dart';

class DummyData {
  static const String _rawData = '''
[
  {
    "id": 11,
    "brandName": "Intel",
    "series": [
      {
        "id": 1101,
        "seriesName": "Core i9",
        "products": [
          {
            "id": 1101001,
            "productName": "11900K"
          },
          {
            "id": 1101002,
            "productName": "11900F"
          },
          {
            "id": 1101003,
            "productName": "11900KF"
          }
        ]
      },
      {
        "id": 1102,
        "seriesName": "Core i7",
        "products": [
          {
            "id": 1102001,
            "productName": "11800H"
          },
          {
            "id": 1102002,
            "productName": "1165G7"
          }
        ]
      },
      {
        "id": 1103,
        "seriesName": "Core i5",
        "products": [
          {
            "id": 1103001,
            "productName": "10400"
          },
          {
            "id": 1103002,
            "productName": "10500"
          },
          {
            "id": 1103003,
            "productName": "10600"
          }
        ]
      }
    ]
  },
  {
    "id": 12,
    "brandName": "AMD",
    "series": [
      {
        "id": 1201,
        "seriesName": "Ryzen 9",
        "products": [
          {
            "id": 1201001,
            "productName": "5950X"
          }
        ]
      }
    ]
  }
]
  ''';
  static List<Brand> getData() {
    return processorFromJson(_rawData);
  }
}
