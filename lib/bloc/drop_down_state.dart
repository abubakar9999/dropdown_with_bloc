// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'drop_down_bloc.dart';

@immutable
abstract class DropDownState {}

 class DropDownInitial extends DropDownState {}
 class DropDownlodingState extends DropDownState {}
class DropDownLoaded extends DropDownState {
  List<String>  categorey;
  List subcategory;
  List product;
  DropDownLoaded({
    required this.categorey,
    required this.subcategory,
    required this.product,
  });
 }
