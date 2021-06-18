import 'package:get/get.dart';

abstract class IMiddleware {
  dynamic observer(Routing? routing);
}

class MiddleWare implements IMiddleware {
  static final MiddleWare _instance = MiddleWare._();
  MiddleWare._();
  factory MiddleWare() => _instance;

  @override
  dynamic observer(Routing? routing) {
    print('call middleware');

    // TODO: routing is always null.
    if (routing != null && routing.current == '/') {
      print('now im home');
    }
  }
}
