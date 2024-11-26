part of dxf;

class AcDbTable implements AcDbEntity {
  AcDbTable._init();

  @override
  List<GroupCode> _groupCodes = <GroupCode>[];

  @override
  String get _dxfString => _groupCodes.expand((e) => [e._dxfString]).join();

  @override
  String _type = 'TABLE';

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
    final result = _groupCodes.firstWhere((e) => e.code == 8, orElse: () => GroupCode(8, ''));
    _layerName = value;
    result.value = value;
  }

  String tableName = '';
  List<Map<String, dynamic>> rows = [];

  factory AcDbTable._fromGroupCodes(List<GroupCode> codes) {
    var table = AcDbTable._init();
    table._groupCodes.addAll(codes);

    table._handle = codes.firstWhere((e) => e.code == 5, orElse: () => GroupCode(5, '')).value;
    table._layerName = codes.firstWhere((e) => e.code == 8, orElse: () => GroupCode(8, '0')).value;
    table.tableName = codes.firstWhere((e) => e.code == 2, orElse: () => GroupCode(2, 'Unnamed')).value;

    // Parse rows
    List<Map<String, dynamic>> rows = [];
    Map<String, dynamic> currentRow = {};
    for (var code in codes) {
      if (code.code == 10 || code.code == 20 || code.code == 30) {
        currentRow['point'] ??= {};
        currentRow['point'][code.code == 10 ? 'x' : code.code == 20 ? 'y' : 'z'] = double.parse(code.value.toString());
      } else if (code.code == 2 || code.code == 1) {
        currentRow['data'] ??= [];
        currentRow['data'].add(code.value);
      }
      // End of row marker
      if (code.code == 0 && currentRow.isNotEmpty) {
        rows.add(currentRow);
        currentRow = {};
      }
    }
    if (currentRow.isNotEmpty) rows.add(currentRow); // Add the last row
    table.rows = rows;

    print("Created TABLE: Name: ${table.tableName}, Rows: ${table.rows.length}");
    return table;
  }

  @override
  void rotate(double radians, double originX, double originY, double originZ) {
    for (var row in rows) {
      if (row.containsKey('point')) {
        var point = row['point'];
        var dx = point['x'] - originX;
        var dy = point['y'] - originY;
        var rotatedX = originX + dx * cos(radians) - dy * sin(radians);
        var rotatedY = originY + dx * sin(radians) + dy * cos(radians);
        point['x'] = rotatedX;
        point['y'] = rotatedY;
      }
    }
  }

  @override
  void scale(double scaleX, double scaleY, double scaleZ) {
    for (var row in rows) {
      if (row.containsKey('point')) {
        var point = row['point'];
        point['x'] *= scaleX;
        point['y'] *= scaleY;
        point['z'] *= scaleZ;
      }
    }
  }

  @override
  void translate(double dx, double dy, double dz) {
    for (var row in rows) {
      if (row.containsKey('point')) {
        var point = row['point'];
        point['x'] += dx;
        point['y'] += dy;
        point['z'] += dz;
      }
    }
  }
}
