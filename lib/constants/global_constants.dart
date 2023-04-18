class GlobalInstance {
  static final GlobalInstance _globalInstance = GlobalInstance._internal();

  factory GlobalInstance() {
    return _globalInstance;
  }
  GlobalInstance._internal();
}
