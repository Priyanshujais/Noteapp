import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../Utills/baseurl.dart';
import '../Models/fetchnotesmodel.dart';
import 'fetchnotesstates.dart';
class FetchNotesCubit extends Cubit<FetchNotesStates>{
  FetchNotesCubit():super(FetchNotesInitialStates());
  fetchNotes()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? token=prefs.getString("token");
    String? userid=prefs.getString("userid");
    emit(FetchNotesLoadingStates());
      final response=await http.post(Uri.parse(BaseUrl.fetchnote),
    headers: {
      "Content-Type":'application/json',
      'Authorization':token!
    },
      body: jsonEncode({
        "user":userid
      })
    );
    if(response.statusCode==200){
      Map<String,dynamic>responsedata=jsonDecode(response.body);
      GetNotesModel getNotesModel=GetNotesModel.fromJson(responsedata);
      emit(FetchNotesLoadedStates(getNotesModel: getNotesModel));
    }
    else{
      Map<String,dynamic>responseerror=jsonDecode(response.body);
      String error=responseerror['message'];
      emit(FetchNotesErrorStates(error: error));
    }
  }
}