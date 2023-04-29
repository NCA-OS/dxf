part of dxf;

/// ARC (DXF)
///
/// Subclass marker (AcDbArc)
class AcDbArc implements AcDbEntity {
  AcDbArc._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'ARC';

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

  double _radius = 0;
  double get radius => _radius;
  set radius(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 40);
    _radius = value;
    result.value = value;
  }

  double _startAngle = 0;
  double get startAngle => _startAngle;
  set startAngle(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 50);
    _startAngle = value;
    result.value = value;
  }

  double _endAngle = 0;
  double get endAngle => _endAngle;
  set endAngle(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 51);
    _endAngle = value;
    result.value = value;
  }

  /// Create AcDbArc entity.
  AcDbArc({
    double x = 0,
    double y = 0,
    double z = 0,
    double radius = 0,
    double startAngle = 0,
    double endAngle = 0,
    String layerName = '0',
  })  : _x = x,
        _y = y,
        _z = z,
        _radius = radius,
        _startAngle = startAngle,
        _endAngle = endAngle,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbCircle'));
    _groupCodes.add(GroupCode(10, x));
    _groupCodes.add(GroupCode(20, y));
    _groupCodes.add(GroupCode(30, z));
    _groupCodes.add(GroupCode(40, radius));
    _groupCodes.add(GroupCode(100, 'AcDbArc'));
    _groupCodes.add(GroupCode(50, startAngle));
    _groupCodes.add(GroupCode(51, endAngle));
  }

  factory AcDbArc._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbArc._init();
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
      result = codes.firstWhere((element) => element.code == 40);
      _acDbEntity._radius = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 50);
      _acDbEntity._startAngle = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 51);
      _acDbEntity._endAngle = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }
}
