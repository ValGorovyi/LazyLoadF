import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveModel {
  Future<Box<User>>? usersBox;

  void setup() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
    }
    usersBox = Hive.openBox('usersBox');

    usersBox?.then((box) {
      box.listenable().addListener(() {
        print('${box.length} <<<<<<<<<<<<<<<');
        print(box.values);
      });
    });
  }

  void interactionWithDB() async {
    final myUserBox = await usersBox;
    final randomUser = User(44, 'ffffdsa');
    await myUserBox?.add(randomUser);
  }
}

// class HiveModel {
//   void interactionWithDB() async {
//     const securityStore = FlutterSecureStorage();
//     final containsEncrKey = await securityStore.containsKey(key: 'valDone228');
//     if (!containsEncrKey) {
//       final myKey = Hive.generateSecureKey();
//       await securityStore.write(key: 'valDone228', value: base64Encode(myKey));
//     }
//     final key = await securityStore.read(key: 'valDone228');
//     final encriptKey = base64Url.decode(key!);
//     print(encriptKey);
//     var encriptBox = await Hive.openBox<String>(
//       'myEncriptBox',
//       encryptionCipher: HiveAesCipher(encriptKey),
//     );
//     await encriptBox.put('ky', 'myBox');
//     print(encriptBox.get('ky'));
//   }
// }

// class HiveModel {
//   void interactionWithDB() async {
//     if (!Hive.isAdapterRegistered(0)) {
//       Hive.registerAdapter(UserAdapter());
//     }
//     var usersBox = await Hive.openBox<dynamic>('usersBox');
//     final userGuest = User(0, 'Guest');
//     // usersBox.add(userGuest);
//     print(usersBox.values);
//   }
// }

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
