import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../Widgets/ui.helper.dart';
import '../blocs/addnotebloc.dart';

class AddNoteController {
  static addnote(String note, BuildContext context) {
    if (note == "") {
      return Uihelper.CustomSnackbar("Enter Required Field's", context);
    } else {
      context.read<AddNoteBlocs>().addnote(note);

    }
  }
}
