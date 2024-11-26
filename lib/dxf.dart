// Copyright (c) 2020 Hanoi University of Mining and Geology, Vietnam. Please
// see the AUTHOR file for details. All rights reserved. Use of this source
// code is governed by a MIT license that can be found in the LICENSE file.

/// A comprehensive, cross-platform DXF manipulation library.
library dxf;

import 'dart:convert';
import 'dart:math';

part 'src/datamodels/ac_db_arc.dart';
part 'src/datamodels/ac_db_circle.dart';
part 'src/datamodels/ac_db_ellipse.dart';
part 'src/datamodels/ac_db_entity.dart';
part 'src/datamodels/ac_db_line.dart';
part 'src/datamodels/ac_db_mtext.dart';
part 'src/datamodels/ac_db_point.dart';
part 'src/datamodels/ac_db_polyline.dart';
part 'src/datamodels/ac_db_solid.dart';
part 'src/datamodels/ac_db_spline.dart';
part 'src/datamodels/ac_db_text.dart';
part 'src/datamodels/ac_db_insert_old.dart';
part 'src/datamodels/ac_db_leader.dart';
part 'src/datamodels/ac_db_m_leader.dart';
part 'src/datamodels/ac_db_ole2frame.dart';
part 'src/datamodels/ac_db_table.dart';
part 'src/datamodels/ac_db_hatch.dart';
part 'src/datamodels/ac_db_attdef.dart';
part 'src/datamodels/group_code.dart';
part 'src/dxf_base.dart';
part 'src/sections/blocks_section.dart';
part 'src/sections/classes_section.dart';
part 'src/sections/entities_section.dart';
part 'src/sections/header_section.dart';
part 'src/sections/objects_section.dart';
part 'src/sections/tables_section.dart';
part 'src/datamodels/ac_db_insert.dart';
