import 'package:flutter/material.dart';

class LifeCycleTest extends StatefulWidget {
  const LifeCycleTest({super.key});

  @override
  State<LifeCycleTest> createState() => _LifeCycleTestState();
}

class _LifeCycleTestState extends State<LifeCycleTest> {

  @override
  void initState() { // New screen e dhukar sathe sathei run hoy
    // TODO: implement initState
    super.initState();
    print('initState from LifeCycleTest');
  }

  @override
  void didChangeDependencies() { // New screen e dhukar por, jodi kono dependency change hoy tahole eta run hoy
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies from LifeCycleTest');
  }

  @override
  void dispose() { // Current screen theke ber howar sathe sathe eta run hoy
    // TODO: implement dispose
    super.dispose();
    print('Dispose from LifeCycleTest');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
