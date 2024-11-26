part of dxf;

/// ATTDEF (DXF)
///
/// Subclass marker (AcDbAttributeDefinition)
class AcDbAttdef implements AcDbEntity {
  AcDbAttdef._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'ATTDEF';

  @override
  String get type => _type;

  @override
  String _handle = '190';

  @override
  String get handle => _handle;

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 8);
    _layerName = value;
    result.value = value;
  }

  double _x = 0;
  double get x => _x;
  set x(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 10);
    _x = value;
    result.value = value;
  }

  double _y = 0;
  double get y => _y;
  set y(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 20);
    _y = value;
    result.value = value;
  }

  double _z = 0;
  double get z => _z;
  set z(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 30);
    _z = value;
    result.value = value;
  }

  String _tag = '';
  String get tag => _tag;
  set tag(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 2);
    _tag = value;
    result.value = value;
  }

  String _prompt = '';
  String get prompt => _prompt;
  set prompt(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 3);
    _prompt = value;
    result.value = value;
  }

  String _defaultValue = '';
  String get defaultValue => _defaultValue;
  set defaultValue(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 1);
    _defaultValue = value;
    result.value = value;
  }

  double _textHeight = 2.5;
  double get textHeight => _textHeight;
  set textHeight(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 40);
    _textHeight = value;
    result.value = value;
  }

  int _flags = 0;
  int get flags => _flags;
  set flags(int value) {
    final result = _groupCodes.firstWhere((element) => element.code == 70);
    _flags = value;
    result.value = value;
  }

  factory AcDbAttdef._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbAttdef._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 10);
      _acDbEntity._x = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 20);
      _acDbEntity._y = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 30);
      _acDbEntity._z = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 2);
      _acDbEntity._tag = result.value;
      result = codes.firstWhere((element) => element.code == 3);
      _acDbEntity._prompt = result.value;
      result = codes.firstWhere((element) => element.code == 1);
      _acDbEntity._defaultValue = result.value;
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._textHeight = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 70);
      _acDbEntity._flags = int.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Create AcDbAttdef entity.
  AcDbAttdef({
    double x = 0,
    double y = 0,
    double z = 0,
    String tag = '',
    String prompt = '',
    String defaultValue = '',
    double textHeight = 2.5,
    int flags = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _tag = tag,
        _prompt = prompt,
        _defaultValue = defaultValue,
        _textHeight = textHeight,
        _flags = flags,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbAttributeDefinition'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(2, tag));
    _groupCodes.add(GroupCode(3, prompt));
    _groupCodes.add(GroupCode(1, defaultValue));
    _groupCodes.add(GroupCode(40, textHeight));
    _groupCodes.add(GroupCode(70, flags));
  }

  @override
  void rotate(double radians, double originX, double originY, double originZ) {
    // TODO: implement rotate
  }

  @override
  void scale(double scaleX, double scaleY, double scaleZ) {
    // TODO: implement scale
  }

  @override
  void translate(double dx, double dy, double dz) {
    // TODO: implement translate
  }
}
