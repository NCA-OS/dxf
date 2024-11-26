part of dxf;

/// HATCH (DXF)
///
/// Subclass marker (AcDbHatch)
/*class AcDbHatch implements AcDbEntity {
  AcDbHatch._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'HATCH';

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

  String _patternName = 'SOLID';
  String get patternName => _patternName;
  set patternName(String value) {
    final result = _groupCodes.firstWhere((element) => element.code == 2);
    _patternName = value;
    result.value = value;
  }

  double _patternScale = 1.0;
  double get patternScale => _patternScale;
  set patternScale(double value) {
    final result = _groupCodes.firstWhere((element) => element.code == 41);
    _patternScale = value;
    result.value = value;
  }

  List<List<List<double>>> _boundaryPaths = [];
  List<List<List<double>>> get boundaryPaths => _boundaryPaths;
  set boundaryPaths(List<List<List<double>>> paths) {
    _boundaryPaths = paths;
    _updateBoundaryGroupCodes();
  }

  void _updateBoundaryGroupCodes() {
    // Clear old boundary group codes
    _groupCodes.removeWhere((element) => element.code == 10 || element.code == 20);

    // Add new boundary group codes
    for (var path in _boundaryPaths) {
      for (var point in path) {
        if (point.length == 2) {
          _groupCodes.add(GroupCode(10, point[0])); // X coordinate
          _groupCodes.add(GroupCode(20, point[1])); // Y coordinate
        }
      }
    }
  }

  /// Create AcDbHatch entity.
  AcDbHatch({
    String patternName = 'SOLID',
    double patternScale = 1.0,
    List<List<List<double>>> boundaryPaths = const [],
    String layerName = '0',
  })  : _patternName = patternName,
        _patternScale = patternScale,
        _boundaryPaths = boundaryPaths,
        _layerName = layerName {
    _groupCodes.add(GroupCode(0, type));
    _groupCodes.add(GroupCode(5, handle));
    _groupCodes.add(GroupCode(100, 'AcDbEntity'));
    _groupCodes.add(GroupCode(8, layerName));
    _groupCodes.add(GroupCode(100, 'AcDbHatch'));
    _groupCodes.add(GroupCode(2, patternName)); // Pattern name
    _groupCodes.add(GroupCode(41, patternScale)); // Pattern scale
    _updateBoundaryGroupCodes(); // Add boundary points
  }

  factory AcDbHatch._fromGroupCodes(List<GroupCode> codes) {
    var _acDbEntity = AcDbHatch._init();
    _acDbEntity._groupCodes.addAll(codes);

    try {
      var result = codes.firstWhere((element) => element.code == 5);
      _acDbEntity._handle = result.value;

      result = codes.firstWhere((element) => element.code == 8);
      _acDbEntity._layerName = result.value;

      result = codes.firstWhere((element) => element.code == 2);
      _acDbEntity._patternName = result.value;

      result = codes.firstWhere((element) => element.code == 41);
      _acDbEntity._patternScale = double.parse(result.value);

      // Parse boundary paths
      var boundaryPaths = <List<List<double>>>[];
      List<double> point = [];
      List<List<double>> path = [];
      for (var code in codes) {
        if (code.code == 10 || code.code == 20) {
          point.add(double.parse(code.value));
          if (point.length == 2) {
            path.add([...point]);
            point.clear();
          }
        }
        // Add completed paths (optional logic if paths are separated)
        if (path.isNotEmpty && code.code != 10 && code.code != 20) {
          boundaryPaths.add([...path]);
          path.clear();
        }
      }
      if (path.isNotEmpty) boundaryPaths.add(path); // Final path
      _acDbEntity._boundaryPaths = boundaryPaths;
    } catch (e) {
      throw AssertionError(['Missing group code for AcDbHatch!']);
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

}*/


class AcDbHatch implements AcDbEntity {
  AcDbHatch._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'HATCH';

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
    final result = _groupCodes.firstWhere((element) => element.code == 8, orElse: () => GroupCode(8, ''));
    _layerName = value;
    result.value = value;
  }

  String _patternName = 'SOLID';

  String get patternName => _patternName;

  void setPatternName(String value) {
    _patternName = value;
    var patternCode = _groupCodes.firstWhere((e) => e.code == 2, orElse: () => GroupCode(2, ''));
    patternCode.value = value;
  }

  double _patternScale = 1.0;

  double get patternScale => _patternScale;

  void setPatternScale(double value) {
    _patternScale = value;
    var scaleCode = _groupCodes.firstWhere((e) => e.code == 41, orElse: () => GroupCode(41, 1.0));
    scaleCode.value = value;
  }

  List<List<Point<double>>> _boundaryPaths = [];

  List<List<Point<double>>> get boundaryPaths => _boundaryPaths;

  void setBoundaryPaths(List<List<Point<double>>> paths) {
    _boundaryPaths = paths;
    _updateBoundaryGroupCodes();
  }

  void _updateBoundaryGroupCodes() {
    _groupCodes.removeWhere((e) => e.code == 10 || e.code == 20); // Clear existing boundaries
    for (var path in _boundaryPaths) {
      for (var point in path) {
        _groupCodes.add(GroupCode(10, point.x)); // Add X coordinate
        _groupCodes.add(GroupCode(20, point.y)); // Add Y coordinate
      }
    }
  }

  factory AcDbHatch._fromGroupCodes(List<GroupCode> codes) {
    print("Processing HATCH group codes:");
    for (var code in codes) {
      print("Code: ${code.code}, Value: ${code.value}");
    }

    var hatch = AcDbHatch._init();
    hatch._groupCodes.addAll(codes);

    hatch._handle = codes.firstWhere((e) => e.code == 5, orElse: () => GroupCode(5, '')).value;
    hatch._layerName = codes.firstWhere((e) => e.code == 8, orElse: () => GroupCode(8, '0')).value;
    hatch._patternName = codes.firstWhere((e) => e.code == 2, orElse: () => GroupCode(2, 'SOLID')).value;
    hatch._patternScale = double.tryParse(codes.firstWhere((e) => e.code == 41, orElse: () => GroupCode(41, 1.0)).value.toString()) ?? 1.0;

    // Parse boundary paths
    List<Point<double>> currentPath = [];
    for (var code in codes) {
      if (code.code == 10 || code.code == 20) {
        var value = double.tryParse(code.value.toString()) ?? 0.0;
        if (code.code == 10) {
          currentPath.add(Point(value, 0.0));
        } else if (code.code == 20 && currentPath.isNotEmpty) {
          var lastPoint = currentPath.removeLast();
          currentPath.add(Point(lastPoint.x, value));
        }
      } else if (currentPath.isNotEmpty) {
        hatch._boundaryPaths.add([...currentPath]);
        currentPath.clear();
      }
    }
    if (currentPath.isNotEmpty) {
      hatch._boundaryPaths.add([...currentPath]);
    }

    print("Created HATCH: Pattern: ${hatch._patternName}, Scale: ${hatch._patternScale}, Boundary Paths: ${hatch._boundaryPaths.length}");
    return hatch;
  }

  @override
  void rotate(double radians, double originX, double originY, double originZ) {
    /*for (var path in _boundaryPaths) {
      for (var i = 0; i < path.length; i++) {
        var point = path[i];
        var dx = point.x - originX;
        var dy = point.y - originY;
        var rotatedX = originX + dx * cos(radians) - dy * sin(radians);
        var rotatedY = originY + dx * sin(radians) + dy * cos(radians);
        path[i] = Point(rotatedX, rotatedY);
      }
    }
    _updateBoundaryGroupCodes();*/
  }

  @override
  void scale(double scaleX, double scaleY, double scaleZ) {
   /* for (var path in _boundaryPaths) {
      for (var i = 0; i < path.length; i++) {
        var point = path[i];
        path[i] = Point(point.x * scaleX, point.y * scaleY);
      }
    }
    _updateBoundaryGroupCodes();*/
  }

  @override
  void translate(double dx, double dy, double dz) {
   /* for (var path in _boundaryPaths) {
      for (var i = 0; i < path.length; i++) {
        var point = path[i];
        path[i] = Point(point.x + dx, point.y + dy);
      }
    }
    _updateBoundaryGroupCodes();*/
  }
}






