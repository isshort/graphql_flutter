import 'package:connectivity_plus/connectivity_plus.dart';

class NetWorkInfo {
  NetWorkInfo(this.connectivity);

  final Connectivity connectivity;

  Future<bool> isConncted() async {
    final response = await connectivity.checkConnectivity();
    if (response == ConnectivityResult.bluetooth ||
        response == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
