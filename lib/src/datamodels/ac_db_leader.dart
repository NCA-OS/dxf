part of dxf;

/// LEADER (DXF)
///
/// Subclass marker (AcDbLeader)
/*class AcDbLeader implements AcDbEntity {
  List<List<double>> _vertices = [];

  /// Getter for vertices
  List<List<double>> get vertices => _vertices;

  /// Setter for vertices
  set vertices(List<List<double>> value) {
    _vertices = value;

    // Update group codes for vertices
    _groupCodes.removeWhere((code) => code.code == 10 || code.code == 20); // Remove old vertex codes
    for (var vertex in value) {
      if (vertex.length >= 2) {
        _groupCodes.add(GroupCode(10, vertex[0]));
        _groupCodes.add(GroupCode(20, vertex[1]));
      }
    }
  }

  AcDbLeader._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'LEADER';

  @override
  String get type => _type;

  @override
  String _handle = '191';

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

  /// Factory method to create an AcDbLeader from group codes
  factory AcDbLeader._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbLeader._init();
    _acDbEntity._groupCodes.addAll(codes);
    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;

      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;

      // Parse vertices
      var vertices = <List<double>>[];
      for (int i = 0; i < codes.length; i++) {
        if (codes[i].code == 10) {
          double x = double.parse(codes[i].value);
          double y = double.parse(codes[i + 1].value); // Assume 20 follows 10
          vertices.add([x, y]);
        }
      }
      _acDbEntity.vertices = vertices;
    } catch (e) {
      throw AssertionError(['Missing group code!']);
    }
    return _acDbEntity;
  }

  /// Constructor for creating a leader with vertices
  AcDbLeader({
    List<List<double>> vertices = const [],
    String layerName = '0',
  })  : _vertices = vertices,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(330, '1F'));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbLeader'));

    // Add vertices to group codes
    for (var vertex in vertices) {
      if (vertex.length >= 2) {
        _groupCodes.add(GroupCode(10, vertex[0]));
        _groupCodes.add(GroupCode(20, vertex[1]));
      }
    }
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

}*/

class AcDbLeader implements AcDbEntity {
  AcDbLeader._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'LEADER';

  @override
  String get type => _type;

  @override
  String _handle = '123';

  @override
  String get handle => _handle;

  @override
  String _layerName = '0';

  @override
  String get layerName => _layerName;

  @override
  set layerName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 8, orElse: () => GroupCode(8, ''));
    _layerName = value;
    result.value = value;
  }

  List<Point<double>> _path = [];
  List<Point<double>> get path => _path;

  void setPath(List<Point<double>> pathPoints) {
    _path = pathPoints;
    _updatePathGroupCodes();
  }

  void _updatePathGroupCodes() {
    _groupCodes.removeWhere((e) => e.code == 10 || e.code == 20); // Clear existing points
    for (var point in _path) {
      _groupCodes.add(GroupCode(10, point.x)); // X coordinate
      _groupCodes.add(GroupCode(20, point.y)); // Y coordinate
    }
  }

  factory AcDbLeader._fromGroupCodes(List<GroupCode> codes) {
    var leader = AcDbLeader._init();
    leader._groupCodes.addAll(codes);

    leader._handle = codes.firstWhere((e) => e.code == 5, orElse: () => GroupCode(5, '')).value;
    leader._layerName = codes.firstWhere((e) => e.code == 8, orElse: () => GroupCode(8, '0')).value;

    // Parse path points
    List<Point<double>> path = [];
    for (var code in codes) {
      if (code.code == 10 || code.code == 20) {
        var value = double.tryParse(code.value.toString()) ?? 0.0;
        if (code.code == 10) {
          path.add(Point(value, 0.0));
        } else if (code.code == 20 && path.isNotEmpty) {
          var lastPoint = path.removeLast();
          path.add(Point(lastPoint.x, value));
        }
      }
    }
    leader._path = path;

    print("Created LEADER: Path Points: ${leader._path}");
    return leader;
  }

  @override
  void rotate(double radians, double originX, double originY, double originZ) {
    /*for (var i = 0; i < _path.length; i++) {
      var point = _path[i];
      var dx = point.x - originX;
      var dy = point.y - originY;
      var rotatedX = originX + dx * cos(radians) - dy * sin(radians);
      var rotatedY = originY + dx * sin(radians) + dy * cos(radians);
      _path[i] = Point(rotatedX, rotatedY);
    }
    _updatePathGroupCodes();*/
  }

  @override
  void scale(double scaleX, double scaleY, double scaleZ) {
   /* for (var i = 0; i < _path.length; i++) {
      var point = _path[i];
      _path[i] = Point(point.x * scaleX, point.y * scaleY);
    }
    _updatePathGroupCodes();*/
  }

  @override
  void translate(double dx, double dy, double dz) {
    /*for (var i = 0; i < _path.length; i++) {
      var point = _path[i];
      _path[i] = Point(point.x + dx, point.y + dy);
    }
    _updatePathGroupCodes();*/
  }
}



