import 'package:flutter/material.dart';

import '../widgets/comp_split_view.dart';
class ComparisonScreen extends StatelessWidget {

  // Route for comparisonScreen page
  static const routeName = '/Comparison-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare prices"),
      ),

      body: CompSplitView(),

      
    );
  }
}