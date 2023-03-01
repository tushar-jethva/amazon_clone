// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:amazon_clone/features/admin/model/sales.dart';

class MyCategoryProductCharts extends StatelessWidget {
  final List<charts.Series<Sales, String>> seriesList;
  const MyCategoryProductCharts({
    Key? key,
    required this.seriesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
    );
  }
}
