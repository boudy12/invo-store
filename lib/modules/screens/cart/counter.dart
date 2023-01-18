import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invostore1/layout/cubit/cubit.dart';
import 'package:invostore1/layout/cubit/states.dart';
import 'package:invostore1/styles/colors.dart';

class CounterScreen extends StatefulWidget {
  int? index =1;

  CounterScreen({Key? key,this.index}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ECommerceAppCubit,ECommerceAppStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ECommerceAppCubit.get(context);
        return Row(
          children: [
            TextButton(
              onPressed:  () {

                setState((){
                  cubit.changeCounterMinus(widget.index!);
                });


              },
              child: Text(
                '-',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: defaultColor
                ),
              ),
            ),
            Text(

              '${cubit.counters[widget.index!]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed:  () {
                setState((){
                  cubit.changeCounterPlus(widget.index!);
                });

              },
              child: Text(
                '+',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: defaultColor
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
