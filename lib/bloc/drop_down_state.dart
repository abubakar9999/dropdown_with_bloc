// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'drop_down_bloc.dart';

@immutable
abstract class DropDownState {}

 class DropDownInitial extends DropDownState {}
 class DropDownlodingState extends DropDownState {}
class DropDownLoaded extends DropDownState {
  List<String>  categorey;
  String? select;

  DropDownLoaded({
    required this.categorey,
    this.select
    
  });
 }

class DropDownSubLoaded extends DropDownState {
  List<String>  subcategory;
   String? select;
  DropDownSubLoaded({
    required this.subcategory,
     this.select
  });
 }
class DropDownproLoaded extends DropDownState {
  List<String>  product;

  DropDownproLoaded({
    required this.product,
 
  });
 }
