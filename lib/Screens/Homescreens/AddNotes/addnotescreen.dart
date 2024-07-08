import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Screens/Homescreens/AddNotes/blocs/addnotebloc.dart';

import '../../../Widgets/ui.helper.dart';
import '../FetchNotes/Cubits/fetchnotescubit.dart';
import 'Controllers/addnotecontroller.dart';
import 'blocs/addnotestates.dart';

class AddNoteScreen extends StatelessWidget {
  TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Notes"),
          centerTitle: true,
        ),
        body: BlocConsumer<AddNoteBlocs, AddNoteStates>(
          listener: (context, state) {
            if (state is AddNoteLoadedStates) {
              Uihelper.CustomSnackbar(
                  state.addNoteModel.message.toString(), context);
            } else if (state is AddNoteErrorStates) {
              Uihelper.CustomSnackbar(state.error.toString(), context);
            }
          },
          builder: (context, state) {
            if (state is AddNoteLoadingStates) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Uihelper.CustomTextField(
                    noteController, "Enter a Note", Icons.note),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      AddNoteController.addnote(
                          noteController.text.toString(), context);
                      context.read<FetchNotesCubit>().fetchNotes();
                      Navigator.pop(context);
                    },
                    child: Text("Add Note"))
              ],
            );
          },
        ));
  }
}
