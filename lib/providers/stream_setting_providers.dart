import 'package:flutter/foundation.dart';
import 'package:live_stream_app/models/stream_setting_model.dart';

class StreamSettingProviders with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  StreamSettingModel? _content;
  StreamSettingModel? get content => _content;

  void setStream(StreamSettingModel value) {
    _isLoading = true;
    _content = value;
    _isLoading = false;
    notifyListeners();
  }
}
