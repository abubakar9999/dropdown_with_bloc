import 'package:dropdowbutton_bloc/bloc/drop_down_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownvalue = '';

  // List of items in our dropdown menu

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
      body: Column(
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
                     dropdownvalue=state.categorey.first;
                  print(state.categorey);
                   return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

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
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
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
    );
  }
}
