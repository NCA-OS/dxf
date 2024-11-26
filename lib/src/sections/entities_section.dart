part of dxf;

class EntitiesSection {
  EntitiesSection._init();

  /// DXF Entities
  final entities = <AcDbEntity>[];

  factory EntitiesSection._fromGroupCodes(List<GroupCode> groupCodes) {
    var _section = EntitiesSection._init();
    var codes = <GroupCode>[];

    groupCodes.skip(2).forEach((element) {
      //  print("Processing group code: ${element.code} -> ${element.value}");

      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          var item;

          if (_element.isAcDbArc) {
            item = AcDbArc._fromGroupCodes(_codes);
          } else if (_element.isAcDbCircle) {
            item = AcDbCircle._fromGroupCodes(_codes);
          } else if (_element.isAcDbEllipse) {
            item = AcDbEllipse._fromGroupCodes(_codes);
          } else if (_element.isAcDbLine) {
            item = AcDbLine._fromGroupCodes(_codes);
          } else if (_element.isAcDbMText) {
            item = AcDbMText._fromGroupCodes(_codes);
          } else if (_element.isAcDbPoint) {
            item = AcDbPoint._fromGroupCodes(_codes);
          } else if (_element.isAcDbPolyline) {
            item = AcDbPolyline._fromGroupCodes(_codes);
          } else if (_element.isAcDbSolid) {
            item = AcDbSolid._fromGroupCodes(_codes);
          } else if (_element.isAcDbInsert) {
            item = AcDbInsert._fromGroupCodes(_codes);
            _handleInsertEntity(_section, item as AcDbInsert);
          } else if (_element.isAcDbText) {
            item = AcDbText._fromGroupCodes(_codes);
          } else if (_element.isAcDbTable) {
            item = AcDbTable._fromGroupCodes(_codes);
          } else if (_element.isAcDbSpline) {
            item = AcDbSpline._fromGroupCodes(_codes);
          } else if (_element.isAcDbHatch) {
            print("Creating HATCH entity...");
            item = AcDbHatch._fromGroupCodes(_codes);
            print("HATCH entity created: $item");
          }else if (_element.isAcDbHatch) {
            print("Creating HATCH entity...");
            item = AcDbHatch._fromGroupCodes(_codes);
          }else if (_element.isAcDbLeader) {
            print("Creating Leader entity...");
            item = AcDbLeader._fromGroupCodes(_codes);
          }else if (_element.isAcDbAttdef) {
            print("Creating Leader entity...");
            item = AcDbAttdef._fromGroupCodes(_codes);
          }else if (_element.isAcDbOle2Frame) {
            print("Creating Leader entity...");
            item = AcDbOle2Frame._fromGroupCodes(_codes);
          }else if (_element.isAcMDbLeader) {
            print("Creating isAcMDbLeader entity...");
            item = AcDbMLeader._fromGroupCodes(_codes);
            print("isAcMDbLeader entity created: $item");
          } else {
            item = AcDbEntity._fromGroupCodes(_codes);
          }

          if (item != null) {
            print("Adding entity to section: ${item.type}");
            _section.entities.add(item);
          } else {
            print("Item is null. Skipping.");
          }
        }
      } else {
        codes.add(element);
      }
    });

    return _section;
  }


  /// Resolves and adds entities from an INSERT entity by applying transformations.
  static void _handleInsertEntity(EntitiesSection section, AcDbInsert insert) {
    print("${insert.blockName} insert._blockName");
    // Look up the referenced block (example function for block resolution).
    // final block = findBlockByName(insert.blockName); // Replace with actual lookup logic.
    //
    // if (block != null) {
    //   for (var entity in block.entities) {
    //     // Apply transformations such as scaling, rotation, and translation.
    //     var transformedEntity = _applyInsertTransform(entity, insert);
    //     section.entities.add(transformedEntity);
    //   }
    // }
  }


  /// Applies transformations from an INSERT to a referenced entity.
  static AcDbEntity _applyInsertTransform(AcDbEntity entity, AcDbInsert insert) {
    // Example implementation of transformations:
    // Apply scaling
    entity.scale(insert.xScale, insert.yScale, insert.zScale);

    // Apply rotation (convert to radians for rotation matrix)
    final rotationRadians = insert.rotation * (3.141592653589793 / 180);
    entity.rotate(rotationRadians, insert.x, insert.y, insert.z);

    // Apply translation
    entity.translate(insert.x, insert.y, insert.z);

    return entity;
  }


  void _addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  bool _removeEntity(AcDbEntity entity) {
    return entities.remove(entity);
  }

  AcDbEntity? _getEntityByHandle(String handle) {
    try {
      return entities.firstWhere((element) => element.handle == handle);
    } catch (e) {
      return null;
    }
  }

  String get _dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    for (var entity in entities) {
      str += entity._dxfString;
    }
    return str + '  0\r\nENDSEC\r\n';
  }
}
part of dxf;

class EntitiesSection {
  EntitiesSection._init();

  /// DXF Entities
  final entities = <AcDbEntity>[];

  factory EntitiesSection._fromGroupCodes(List<GroupCode> groupCodes) {
    var _section = EntitiesSection._init();
    var codes = <GroupCode>[];

    groupCodes.skip(2).forEach((element) {
      //  print("Processing group code: ${element.code} -> ${element.value}");

      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          var item;

          if (_element.isAcDbArc) {
            item = AcDbArc._fromGroupCodes(_codes);
          } else if (_element.isAcDbCircle) {
            item = AcDbCircle._fromGroupCodes(_codes);
          } else if (_element.isAcDbEllipse) {
            item = AcDbEllipse._fromGroupCodes(_codes);
          } else if (_element.isAcDbLine) {
            item = AcDbLine._fromGroupCodes(_codes);
          } else if (_element.isAcDbMText) {
            item = AcDbMText._fromGroupCodes(_codes);
          } else if (_element.isAcDbPoint) {
            item = AcDbPoint._fromGroupCodes(_codes);
          } else if (_element.isAcDbPolyline) {
            item = AcDbPolyline._fromGroupCodes(_codes);
          } else if (_element.isAcDbSolid) {
            item = AcDbSolid._fromGroupCodes(_codes);
          } else if (_element.isAcDbInsert) {
            item = AcDbInsert._fromGroupCodes(_codes);
            _handleInsertEntity(_section, item as AcDbInsert);
          } else if (_element.isAcDbText) {
            item = AcDbText._fromGroupCodes(_codes);
          } else if (_element.isAcDbTable) {
            item = AcDbTable._fromGroupCodes(_codes);
          } else if (_element.isAcDbSpline) {
            item = AcDbSpline._fromGroupCodes(_codes);
          } else if (_element.isAcDbHatch) {
            print("Creating HATCH entity...");
            item = AcDbHatch._fromGroupCodes(_codes);
            print("HATCH entity created: $item");
          }else if (_element.isAcDbHatch) {
            print("Creating HATCH entity...");
            item = AcDbHatch._fromGroupCodes(_codes);
          }else if (_element.isAcDbLeader) {
            print("Creating Leader entity...");
            item = AcDbLeader._fromGroupCodes(_codes);
          }else if (_element.isAcDbAttdef) {
            print("Creating Leader entity...");
            item = AcDbAttdef._fromGroupCodes(_codes);
          }else if (_element.isAcDbOle2Frame) {
            print("Creating Leader entity...");
            item = AcDbOle2Frame._fromGroupCodes(_codes);
          }else if (_element.isAcMDbLeader) {
            print("Creating isAcMDbLeader entity...");
            item = AcDbMLeader._fromGroupCodes(_codes);
            print("isAcMDbLeader entity created: $item");
          } else {
            item = AcDbEntity._fromGroupCodes(_codes);
          }

          if (item != null) {
            print("Adding entity to section: ${item.type}");
            _section.entities.add(item);
          } else {
            print("Item is null. Skipping.");
          }
        }
      } else {
        codes.add(element);
      }
    });

    return _section;
  }


  /// Resolves and adds entities from an INSERT entity by applying transformations.
  static void _handleInsertEntity(EntitiesSection section, AcDbInsert insert) {
    print("${insert.blockName} insert._blockName");
    // Look up the referenced block (example function for block resolution).
    // final block = findBlockByName(insert.blockName); // Replace with actual lookup logic.
    //
    // if (block != null) {
    //   for (var entity in block.entities) {
    //     // Apply transformations such as scaling, rotation, and translation.
    //     var transformedEntity = _applyInsertTransform(entity, insert);
    //     section.entities.add(transformedEntity);
    //   }
    // }
  }


  /// Applies transformations from an INSERT to a referenced entity.
  static AcDbEntity _applyInsertTransform(AcDbEntity entity, AcDbInsert insert) {
    // Example implementation of transformations:
    // Apply scaling
    entity.scale(insert.xScale, insert.yScale, insert.zScale);

    // Apply rotation (convert to radians for rotation matrix)
    final rotationRadians = insert.rotation * (3.141592653589793 / 180);
    entity.rotate(rotationRadians, insert.x, insert.y, insert.z);

    // Apply translation
    entity.translate(insert.x, insert.y, insert.z);

    return entity;
  }


  void _addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  bool _removeEntity(AcDbEntity entity) {
    return entities.remove(entity);
  }

  AcDbEntity? _getEntityByHandle(String handle) {
    try {
      return entities.firstWhere((element) => element.handle == handle);
    } catch (e) {
      return null;
    }
  }

  String get _dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    for (var entity in entities) {
      str += entity._dxfString;
    }
    return str + '  0\r\nENDSEC\r\n';
  }
}
