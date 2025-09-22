import 'package:big_study/jsonLesDataDemo/addressData.dart';
import 'package:big_study/jsonLesDataDemo/humanData.dart';

final humansDataNoJson = [
  Human(
    name: 'Jony',
    surName: 'Aida',
    age: 32,
    address: [
      Address(country: 'Indy', city: 'New York', street: 'Nebel', flat: 33),
      Address(country: 'Indy', city: 'New York', street: 'Nebel', flat: 30),
    ],
  ),
  Human(
    name: 'Cindy',
    surName: 'Syzlok',
    age: 32,
    address: [
      Address(country: 'Chily', city: 'Shitomir', street: 'Gagarin', flat: 373),
    ],
  ),
  Human(
    name: 'Boby',
    surName: 'Kindy',
    age: 32,
    address: [
      Address(country: 'Moldova', city: 'Brans', street: 'Dark', flat: 5),
      Address(country: 'USA', city: 'Shashkivsk', street: 'Ivasyk', flat: 23),
    ],
  ),
];

const jsonData = '''
[
  {
    "name": "Boby",
    "surName": "Kindy",
    "age": 32,
    "address": [
      {
        "country": "Moldova", "city": "Brans", "street": "Dark", "flat": 5
      }
    ]
  },
  {
      "name": "Jiny",
    "surName": "Lophs",
    "age": 43,
    "address": [
      {
        "country": "Brazil", "city": "Riga", "street": "Zarechna", "flat": 340
      },
      {
        "country": "Brazil", "city": "Riga", "street": "Zarechna", "flat": 340
      }
    ]
  }
]
''';
