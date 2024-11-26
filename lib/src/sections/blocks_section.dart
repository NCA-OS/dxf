part of dxf;

/// BLOCKS Section
///
/// The BLOCKS section of the DXF file contains an entry for each block
/// reference in the drawing.
/*class BlocksSection {
  BlocksSection._init();

  final Map<String, List<AcDbEntity>> blocks = {};
  /// DXF Entities
  final entities = <AcDbEntity>[];

  factory BlocksSection._fromGroupCodes(List<GroupCode> groupCodes) {
    var _section = BlocksSection._init();
    var codes = <GroupCode>[];
    groupCodes.skip(2).forEach((element) async {
      if (element.isAcDbEntity) {
        var _codes = codes;
        codes = [];
        codes.add(element);
        if (_codes.isNotEmpty) {
          var _element = _codes[0];
          var item = null;
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
          } else if (_element.isAcDbText) {
            item = AcDbText._fromGroupCodes(_codes);
          } else if (_element.isAcDbSpline) {
            item = AcDbSpline._fromGroupCodes(_codes);
          } else if (_element.isAcDbInsert) {
            item = AcDbInsert._fromGroupCodes(_codes);
          }else {
            item = AcDbEntity._fromGroupCodes(_codes);
          }
          _section.entities.add(item);
        }
      } else {
        codes.add(element);
      }
    });
    return _section;
  }



  void _addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  bool _removeEntity(AcDbEntity entity) {
    return entities.remove(entity);
  }

  AcDbEntity? _getEntityByHandle(String handle) {
    try {
      var entity = entities.where((element) => element.handle == handle).first;
      return entity;
    } catch (e) {
      return null;
    }
  }


  String get _dxfString {
    // var str = '  0\r\nSECTION\r\n  2\r\nENTITIES\r\n';
    // entities.forEach((element) {
    //   str += element._dxfString;
    // });
    // return str + '  0\r\nENDSEC\r\n';

    throw UnimplementedError("Block._getdxfString is not implemented");
    return "";
  }
}*/




/// BLOCKS Section
///
/// The BLOCKS section of the DXF file contains an entry for each block
/// reference in the drawing.
class BlocksSection {
  BlocksSection._init();

  /// Map of block definitions by block name
  final Map<String, List<AcDbEntity>> blocks = {};

  /// DXF Entities within the blocks section
  final entities = <AcDbEntity>[];

  factory BlocksSection._fromGroupCodes(List<GroupCode> groupCodes) {
    var section = BlocksSection._init();
    var blockGroupCodes = <GroupCode>[];
    String? currentBlockName;

    for (var element in groupCodes.skip(2)) {
      if (element.isAcDbEntity && element.value == 'BLOCK') {
        // Start a new block
        if (currentBlockName != null) {
          section._addBlock(currentBlockName, blockGroupCodes);
        }
        blockGroupCodes.clear();
        currentBlockName = _getBlockName(groupCodes);
      } else if (element.isAcDbEntity && element.value == 'ENDBLK') {
        // End the current block
        if (currentBlockName != null) {
          section._addBlock(currentBlockName, blockGroupCodes);
        }
        blockGroupCodes.clear();
        currentBlockName = null;
      } else if (currentBlockName != null) {
        // Collect group codes for the current block
        blockGroupCodes.add(element);
      }
    }

    return section;
  }

  /// Adds a block definition to the map
  void _addBlock(String blockName, List<GroupCode> blockGroupCodes) {
    print('Adding block: $blockName with ${blockGroupCodes.length} group codes');
    var blockEntities = _parseEntitiesFromGroupCodes(blockGroupCodes);
    blocks[blockName] = blockEntities;
    print('Block $blockName has ${blockEntities.length} entities');

  }

  /// Parses entities from a list of group codes
  List<AcDbEntity> _parseEntitiesFromGroupCodes(List<GroupCode> groupCodes) {

    var codes = <GroupCode>[];

    for (var code in groupCodes) {
      if (code.isAcDbEntity) {
        if (codes.isNotEmpty) {
          entities.add(_createEntityFromGroupCodes(codes));
          codes.clear();
        }
        codes.add(code);
      } else {
        codes.add(code);
      }
    }

    if (codes.isNotEmpty) {
      entities.add(_createEntityFromGroupCodes(codes));
    }

    return entities;
  }

  /// Creates an entity from a list of group codes
  AcDbEntity _createEntityFromGroupCodes(List<GroupCode> groupCodes) {
    var firstCode = groupCodes.first;
    if (firstCode.isAcDbArc) {
      return AcDbArc._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbCircle) {
      return AcDbCircle._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbEllipse) {
      return AcDbEllipse._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbLine) {
      return AcDbLine._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbMText) {
      return AcDbMText._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbPoint) {
      return AcDbPoint._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbPolyline) {
      return AcDbPolyline._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbSolid) {
      return AcDbSolid._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbText) {
      return AcDbText._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbTable) {
      return AcDbTable._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbSpline) {
      return AcDbSpline._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbInsert) {
      return AcDbInsert._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbAttdef) {
      return AcDbAttdef._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbOle2Frame) {
      return AcDbOle2Frame._fromGroupCodes(groupCodes);
    } else if (firstCode.isAcDbHatch) {
      print("is hatch....");
      return AcDbHatch._fromGroupCodes(groupCodes);
    }else if (firstCode.isAcDbLeader) {
      print("is leader....");
      return AcDbLeader._fromGroupCodes(groupCodes);
    }else if (firstCode.isAcMDbLeader) {
      print("is isAcMDbLeader....");
      return AcDbMLeader._fromGroupCodes(groupCodes);
    }else {
      return AcDbEntity._fromGroupCodes(groupCodes);
    }
  }

  /// Gets the block name from the group codes (group code 2)
  static String _getBlockName(List<GroupCode> groupCodes) {
    var nameCode = groupCodes.firstWhere(
            (g) => g.code == 2,
        orElse: () => GroupCode(2, 'UnnamedBlock'));
    return nameCode.value;
  }

  /// Finds entities by block name
  List<AcDbEntity>? findBlockEntitiesByName(String name) {
    return blocks[name];
  }

  /// Adds an entity to the blocks section
  void _addEntity(AcDbEntity entity) {
    entities.add(entity);
  }

  /// Removes an entity from the blocks section
  bool _removeEntity(AcDbEntity entity) {
    return entities.remove(entity);
  }

  /// Finds an entity by handle
  AcDbEntity? _getEntityByHandle(String handle) {
    try {
      return entities.firstWhere((element) => element.handle == handle);
    } catch (e) {
      return null;
    }
  }

  /// Generates the DXF string for the blocks section
  String get _dxfString {
    var str = '  0\r\nSECTION\r\n  2\r\nBLOCKS\r\n';
    for (var block in blocks.entries) {
      str += '  0\r\nBLOCK\r\n  2\r\n${block.key}\r\n';
      for (var entity in block.value) {
        str += entity._dxfString;
      }
      str += '  0\r\nENDBLK\r\n';
    }
    return str + '  0\r\nENDSEC\r\n';
  }
}

