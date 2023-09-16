import 'package:bloc/bloc.dart';
import 'package:dropdowbutton_bloc/source.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(DropDownInitial()) {

    Map<String, List<Map<String, dynamic>>> data;
    on<DataLoadedevent>((event, emit)  async{
      emit(DropDownlodingState());
     List<String> category=[];
      List subcetgory=[];
      List products=[];

       await Future.delayed(Duration(seconds: 2), () { });
        try {
          data = source;
          data["categories"]!.forEach((e){
            category.add(e['name']);

          subcetgory=  e["subcategories"];

          });
          print(category);
        } catch (e) {
          print("Somethis error");
        }
     

     print(category);
      emit(DropDownLoaded(categorey: category , subcategory: subcetgory, product: products));
    });
  }
}
