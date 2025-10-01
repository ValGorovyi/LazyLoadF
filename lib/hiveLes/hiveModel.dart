import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveModel {
  void interactionWithDB() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    var usersBox = await Hive.openBox<dynamic>('usersBox');
    final userGuest = User(0, 'Guest');
    // usersBox.add(userGuest);
    print(usersBox.values);
  }
}

class User {
  String name;
  int age;
  User(this.age, this.name);

  @override
  String toString() {
    return 'name : $name, age : $age';
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 0;
  //vazhen poradok!
  @override
  User read(BinaryReader reader) {
    final String name = reader.readString();
    final age = reader.readInt();
    return User(age, name);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.age);
  }
}

// class HiveModel {
//   HiveModel() {
//     Hive.initFlutter();
//   }
//   void interactionWithDB() async {
//     var carMazdaCharacter = await Hive.openBox<dynamic>('carMazdaCharacter');
//     print(await Hive.boxExists('fhfh'));
//     // await carMazdaCharacter.put('name', 'mazda-rx8');
//     // await carMazdaCharacter.put('color', 'green day');
//     // await carMazdaCharacter.put('volume', 3.9);
//     // await carMazdaCharacter.put('materials', ['wood', 'plastick', 'glass']);
//     // final colorTest = await carMazdaCharacter.get('color');
//     // print(colorTest);
//     // final defaultTest = await carMazdaCharacter.get(
//     //   'volume',
//     //   defaultValue: 2.5,
//     // );
//     // print(defaultTest);
//     // final materials = await carMazdaCharacter.get('materials');
//     // print(materials);
//     // final indexRes = await carMazdaCharacter.getAt(0);
//     // print(indexRes);
//     // carMazdaCharacter.deleteAt(0);
//     // carMazdaCharacter.delete('color');
//     print(carMazdaCharacter.values);

//     // carMazdaCharacter.close();
//     // carMazdaCharacter.deleteFromDisk();
//   }
// }
