// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'drop_down_bloc.dart';

@immutable
abstract class DropDownEvent {}
 class DataLoadedevent extends DropDownEvent{

}
class SelectedAndSubcategoryEvent extends DropDownEvent {
  String selectvalue;
  SelectedAndSubcategoryEvent({
    required this.selectvalue,
  });

}
class SelectedAndproductEvent extends DropDownEvent {
  String selectvalue;
  SelectedAndproductEvent({
    required this.selectvalue,
  });

}

