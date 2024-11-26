part of dxf;

/// INSERT Entity (AcDbInsert)
///
/// Represents a block reference (INSERT) entity in a DXF file.
class AcDbInsert implements AcDbEntity {
  AcDbInsert._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String _type = 'INSERT';

  @override
  String get type => _type;

  @override
  String _handle = '';

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

  String _blockName = '';
  String get blockName => _blockName;
  set blockName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 2);
    _blockName = value;
    result.value = value;
  }

  double _x = 0.0, _y = 0.0, _z = 0.0;
  double get x => _x;
  set x(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 10);
    _x = value;
    result.value = value;
  }

  double get y => _y;
  set y(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 20);
    _y = value;
    result.value = value;
  }

  double get z => _z;
  set z(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 30);
    _z = value;
    result.value = value;
  }

  double _xScale = 1.0, _yScale = 1.0, _zScale = 1.0;
  double get xScale => _xScale;
  set xScale(double value) {
    _updateGroupCode(41, value);
    _xScale = value;
  }

  double get yScale => _yScale;
  set yScale(double value) {
    _updateGroupCode(42, value);
    _yScale = value;
  }

  double get zScale => _zScale;
  set zScale(double value) {
    _updateGroupCode(43, value);
    _zScale = value;
  }

  double _rotation = 0.0;
  double get rotation => _rotation;
  set rotation(double value) {
    _updateGroupCode(50, value);
    _rotation = value;
  }

  int _columnCount = 1, _rowCount = 1;
  int get columnCount => _columnCount;
  set columnCount(int value) {
    _updateGroupCode(70, value);
    _columnCount = value;
  }

  int get rowCount => _rowCount;
  set rowCount(int value) {
    _updateGroupCode(71, value);
    _rowCount = value;
  }

  double _columnSpacing = 0.0, _rowSpacing = 0.0;
  double get columnSpacing => _columnSpacing;
  set columnSpacing(double value) {
    _updateGroupCode(44, value);
    _columnSpacing = value;
  }

  double get rowSpacing => _rowSpacing;
  set rowSpacing(double value) {
    _updateGroupCode(45, value);
    _rowSpacing = value;
  }

  List<double> _extrusionDirection = [0.0, 0.0, 1.0];
  List<double> get extrusionDirection => _extrusionDirection;
  set extrusionDirection(List<double> value) {
    if (value.length == 3) {
      _updateGroupCode(210, value[0]);
      _updateGroupCode(220, value[1]);
      _updateGroupCode(230, value[2]);
      _extrusionDirection = value;
    }
  }

  factory AcDbInsert._fromGroupCodes(List<GroupCode> codes) {
    var entity = AcDbInsert._init();
    entity._groupCodes.addAll(codes);
    try {
      entity._blockName = codes.firstWhere((element) => element.code == 2).value;
      entity._x = double.parse(codes.firstWhere((element) => element.code == 10).value);
      entity._y = double.parse(codes.firstWhere((element) => element.code == 20).value);
      entity._z = double.parse(codes.firstWhere((element) => element.code == 30).value);
      entity._xScale = double.tryParse(codes.firstWhere((element) => element.code == 41, orElse: () => GroupCode(41, '1')).value) ?? 1.0;
      entity._yScale = double.tryParse(codes.firstWhere((element) => element.code == 42, orElse: () => GroupCode(42, '1')).value) ?? 1.0;
      entity._zScale = double.tryParse(codes.firstWhere((element) => element.code == 43, orElse: () => GroupCode(43, '1')).value) ?? 1.0;
      entity._rotation = double.tryParse(codes.firstWhere((element) => element.code == 50, orElse: () => GroupCode(50, '0')).value) ?? 0.0;
      entity._columnCount = int.tryParse(codes.firstWhere((element) => element.code == 70, orElse: () => GroupCode(70, '1')).value) ?? 1;
      entity._rowCount = int.tryParse(codes.firstWhere((element) => element.code == 71, orElse: () => GroupCode(71, '1')).value) ?? 1;
      entity._columnSpacing = double.tryParse(codes.firstWhere((element) => element.code == 44, orElse: () => GroupCode(44, '0')).value) ?? 0.0;
      entity._rowSpacing = double.tryParse(codes.firstWhere((element) => element.code == 45, orElse: () => GroupCode(45, '0')).value) ?? 0.0;
      entity._extrusionDirection = [
        double.tryParse(codes.firstWhere((element) => element.code == 210, orElse: () => GroupCode(210, '0')).value) ?? 0.0,
        double.tryParse(codes.firstWhere((element) => element.code == 220, orElse: () => GroupCode(220, '0')).value) ?? 0.0,
        double.tryParse(codes.firstWhere((element) => element.code == 230, orElse: () => GroupCode(230, '1')).value) ?? 1.0,
      ];
    } catch (e) {
      throw AssertionError('Missing required group codes for AcDbInsert!');
    }
    return entity;
  }

  void _updateGroupCode(int code, dynamic value) {
    try {
      final result = _groupCodes.firstWhere((element) => element.code == code);
      result.value = value;
    } catch (e) {
      _groupCodes.add(GroupCode(code, value));
    }
  }

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

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
