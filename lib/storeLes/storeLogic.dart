import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class _keyToSimpleStore {
  static String demoKey = 'key228';
}

abstract class _keyToSecurityStore {
  static String demoSKey = 'security-key228';
}

class StoreDemoModel {
  final _simpleStore = SharedPreferences.getInstance();
  final _secutityStore = FlutterSecureStorage();
  void setSimpleStorage() async {
    final simpleSt = await _simpleStore;
    final resOfSetSimp = await simpleSt.setString(
      _keyToSimpleStore.demoKey,
      'ave val done',
    );
    print(resOfSetSimp);
  }

  void getSimpleStorage() async {
    final simpleSt = await _simpleStore;
    final resOfGetSimp = await simpleSt.getString(_keyToSimpleStore.demoKey);
    print(resOfGetSimp);
  }

  void setSecurityStorage() async {
    // final resOfSetSecur =
    await _secutityStore.write(
      key: _keyToSecurityStore.demoSKey,
      value: 'choopackabra',
    );
    // print(resOfSetSecur); // void
  }

  // security ostanetsa dazhe posle udaleniya prilozheniya
  void getSecurityStorage() async {
    final resOfGetSecur = await _secutityStore.read(
      key: _keyToSecurityStore.demoSKey,
    );
    // _secutityStore.delete(key: _keyToSecurityStore.demoSKey);
    print(resOfGetSecur);
  }
}
