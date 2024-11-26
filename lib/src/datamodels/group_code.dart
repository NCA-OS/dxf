part of dxf;

/// DXF Group Codes
class GroupCode {
  final int? code;
  dynamic value;
  GroupCode(this.code, this.value);

  bool get isSECTION {
    return code == 0 && value == 'SECTION';
  }

  bool get isENDSEC {
    return code == 0 && value == 'ENDSEC';
  }

  bool get isHEADER {
    return code == 2 && value == 'HEADER';
  }

  bool get isCLASSES {
    return code == 2 && value == 'CLASSES';
  }

  bool get isTABLES {
    return code == 2 && value == 'TABLES';
  }

  bool get isBLOCKS {
    return code == 2 && value == 'BLOCKS';
  }

  bool get isENTITIES {
    return code == 2 && value == 'ENTITIES';
  }

  bool get isOBJECTS {
    return code == 2 && value == 'OBJECTS';
  }

  bool get isTHUMBNAILIMAGE {
    return code == 2 && value == 'THUMBNAILIMAGE';
  }

  bool get isHeaderElement {
    return code == 9;
  }

  bool get isAcDbEntity {
    return code == 0 && value.toString().toUpperCase() == value;
  }

  bool get isAcDbCircle {
    return code == 0 && value.toString() == 'CIRCLE';
  }

  bool get isAcDbPoint {
    return code == 0 && value.toString() == 'POINT';
  }

  bool get isAcDbLine {
    return code == 0 && value.toString() == 'LINE';
  }

  bool get isAcDbOle2Frame {
    return code == 0 && value.toString() == 'OLE2FRAME';
  }

  bool get isAcDbPolyline {
    return code == 0 && value.toString() == 'LWPOLYLINE';
  }

  bool get isAcDbSpline {
    return code == 0 && value.toString() == 'SPLINE';
  }

  bool get isAcDbSolid {
    return code == 0 && value.toString() == 'SOLID';
  }

  bool get isAcDbText {
    return code == 0 && value.toString() == 'TEXT';
  }

  bool get isAcDbTable {
    return code == 0 && value.toString() == 'TABLE';
  }

  bool get isAcDbLeader {
    return code == 0 && value.toString() == 'LEADER';
  }

  bool get isAcMDbLeader {
    return code == 0 && value.toString() == 'MULTILEADER';
  }

  bool get isAcDbMText {
    return code == 0 && value.toString() == 'MTEXT';
  }
  bool get isAcDbAttrib {
    return code == 0 && value.toString() == 'ATTRIB';
  }


  bool get isAcDbHatch {
    return code == 0 && value.toString() == 'HATCH';
  }
  bool get isAcDbAttdef {
    return code == 0 && value.toString() == 'ATTDEF';
  }


  bool get isAcDbInsert {
    return code == 0 && value.toString() == 'INSERT';
  }


  bool get isAcDbArc {
    return code == 0 && value.toString() == 'ARC';
  }

  bool get isAcDbEllipse {
    return code == 0 && value.toString() == 'ELLIPSE';
  }

  String get _dxfString {
    return '${code.toString().padLeft(3, ' ')}\r\n$value\r\n';
  }
}
