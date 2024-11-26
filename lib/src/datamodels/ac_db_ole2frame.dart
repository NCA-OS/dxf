part of dxf;

/// OLE2FRAME (DXF)
///
/// Subclass marker (AcDbOle2Frame)
class AcDbOle2Frame implements AcDbEntity {
  AcDbOle2Frame._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'OLE2FRAME';

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

  double _minX = 0;
  double get minX => _minX;
  set minX(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 10);
    _minX = value;
    result.value = value;
  }

  double _minY = 0;
  double get minY => _minY;
  set minY(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 20);
    _minY = value;
    result.value = value;
  }

  double _maxX = 0;
  double get maxX => _maxX;
  set maxX(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 11);
    _maxX = value;
    result.value = value;
  }

  double _maxY = 0;
  double get maxY => _maxY;
  set maxY(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 21);
    _maxY = value;
    result.value = value;
  }

  /// Create AcDbOle2Frame entity
  AcDbOle2Frame({
    double minX = 0,
    double minY = 0,
    double maxX = 0,
    double maxY = 0,
    String layerName = '0',
  })  : _minX = minX,
        _minY = minY,
        _maxX = maxX,
        _maxY = maxY,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(10, minX));
    _groupCodes.add(GroupCode(20, minY));
    _groupCodes.add(GroupCode(11, maxX));
    _groupCodes.add(GroupCode(21, maxY));
  }

  /// Factory method to parse from Group Codes
  factory AcDbOle2Frame._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbOle2Frame._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;
      result = codes.firstWhere((element) => element.code == 10);
      _acDbEntity._minX = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 20);
      _acDbEntity._minY = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 11);
      _acDbEntity._maxX = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 21);
      _acDbEntity._maxY = double.parse(result.value);
      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
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
