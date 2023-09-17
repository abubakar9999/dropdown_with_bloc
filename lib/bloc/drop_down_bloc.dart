import 'package:bloc/bloc.dart';
import 'package:dropdowbutton_bloc/source.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
     List<String> category=[];
     List<String> subcategory=[];
     List<String> products=[];

  DropDownBloc() : super(DropDownInitial()) {
    on<DataLoadedevent>((event, emit)  async{
      emit(DropDownlodingState());
       await Future.delayed(Duration(seconds: 2), () { });
        try {
          category= source.keys.toList();
        } catch (e) {
          print("Somethis error");
        }
   
      emit(DropDownLoaded(categorey:category,));
    });
    on<SelectedAndSubcategoryEvent>((event, emit) {
      emit(DropDownLoaded(categorey:category,select: event.selectvalue));

      source[event.selectvalue]!.forEach((element) {
     subcategory.add(element.keys.toString());

      });
      print(subcategory);
      if(event.selectvalue!=''){
         emit(DropDownSubLoaded(subcategory: subcategory,));
      }
     
  
    });
    on<SelectedAndproductEvent>((event, emit) {
      emit(DropDownLoaded(categorey:category,select: event.selectvalue));
      // for (var i = 0; i < source['Electronics']!.; i++) {
        
      // }
source['Electronics']![0][event.selectvalue]!.forEach((e){
  products.add(e['name']);
});
    
      print(products);
      if(event.selectvalue!=''){
        
       emit(DropDownproLoaded(product: products,));
      }
     
  
    });


  }
}
