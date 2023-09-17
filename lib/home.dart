import 'package:dropdowbutton_bloc/bloc/drop_down_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  // List of items in our dropdown menu
  String? dropdownvalue;

  DropDownBloc mybloc=DropDownBloc();
  @override
  void initState() {
  mybloc.add(DataLoadedevent());

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drop Down"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: BlocConsumer<DropDownBloc, DropDownState>(
                bloc: mybloc,
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
               
                  if (state is DropDownlodingState) {
                 return   Center(child: CircularProgressIndicator(),);
                    
                  }
                  else if (state is DropDownLoaded){
                  
                      // String   dropdownvalue=state.categorey.first;
                     return SizedBox(
                      height: 400,
                       child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                        DropdownButton(
                          // Initial Value
                          hint:  state.select == null ? const Text('Select Category'):Text(state.select!),
                          value: state.select,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                              
                          // Array list of items
                          items: state.categorey.map((String items) {
                          
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (newValue) {
                            print(newValue);
                                   
                              // state.select = newValue!;
                              mybloc.add(SelectedAndSubcategoryEvent(selectvalue: newValue!));
                         
                          },
                        ),
                                       ],
                                     ),
                     );
               
               
      
                  }
      
                  else if(state is DropDownSubLoaded){
                    print("State is here sub cat");
                    print(state.subcategory);
                     return SizedBox(
                      height: 400,
                       child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                        DropdownButton(
                          // Initial Value
                          hint:  state.select == null ? const Text('Select sub ctat'):Text(state.select!),
                          value: state.select,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                              
                          // Array list of items
                          items: state.subcategory.map((String items) {
                          
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (newValue) {
                            print(newValue);
                           ;
                                   print(newValue!.substring(1,newValue.length-1));
                            print("******************$newValue");
                              mybloc.add(SelectedAndproductEvent(selectvalue: newValue.substring(1,newValue.length-1)));
                         
                          },
                        ),
                                       ],
                                     ),
                     );
      
      
                  }
                  else if(state is DropDownproLoaded){
                     return SizedBox(
                      height: 400,
                       child: Column(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                       children: [
                        DropdownButton(
                          // Initial Value
                          //hint:  state.select == null ? const Text('Select Category'):Text(state.select!),
                          value: state.product.first,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                              
                          // Array list of items
                          items: state.product.map((String items) {
                          
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (newValue) {
                            print(newValue);
                                   
                              // state.select = newValue!;
                            
                         
                          },
                        ),
                                       ],
                                     ),
                     );

                  }
                  else{
                    return Text("server errror");
                  }
                 
               
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
