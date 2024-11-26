part of dxf;

/// TABLES Section
///
/// The group codes described in this chapter are found in DXF™ files and used
/// by applications. The TABLES section contains several tables, each of which
/// can contain a variable number of entries.
class TablesSection {
  TablesSection._init();

  /// DXF Group Codes
  final _groupCodes = <GroupCode>[];

  /// Parsed Table entities
  final List<AcDbTable> tables = [];

  /// Return the Tables section from group codes
  factory TablesSection._fromGroupCodes(List<GroupCode> codes) {
    var _section = TablesSection._init();
    _section._groupCodes.addAll(codes);

    // Parse tables from the group codes
    List<GroupCode> tableGroupCodes = [];
    for (var code in codes) {
      if (code.code == 0 && code.value == 'TABLE') {
        // Start of a new table
        if (tableGroupCodes.isNotEmpty) {
          var table = AcDbTable._fromGroupCodes(tableGroupCodes);
          _section.tables.add(table);
        }
        tableGroupCodes = [];
      }
      tableGroupCodes.add(code);
    }
    // Add the last table
    if (tableGroupCodes.isNotEmpty) {
      var table = AcDbTable._fromGroupCodes(tableGroupCodes);
      _section.tables.add(table);
    }

    return _section;
  }

}

