import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../infra/network_info.dart';

class NetworkInfoImp implements NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImp(this.internetConnectionChecker);
  @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;
}
