import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/counter/cubit/counter_cubit.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, counter) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40.w,
              children: [
  
                IconButton(
                  onPressed: () {
                    context.read<CounterCubit>().incrementCounter();
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                ),

                
                Text(context.read<CounterCubit>(). counter.toString(),
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                
                IconButton(
                  onPressed: () {
                    context.read<CounterCubit>().decrementCounter();
                  },
                  icon: const Icon(
                    Icons.remove,
                    size: 40,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}