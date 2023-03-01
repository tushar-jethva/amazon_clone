import 'package:amazon_clone/costants/loader.dart';
import 'package:amazon_clone/features/admin/model/sales.dart';
import 'package:amazon_clone/features/admin/services/admin_services.dart';
import 'package:amazon_clone/features/admin/widgets/category_product_charts.dart';
import 'package:charts_flutter_new/flutter.dart'as charts;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyAnalyticalScreen extends StatefulWidget {
  const MyAnalyticalScreen({super.key});

  @override
  State<MyAnalyticalScreen> createState() => _MyAnalyticalScreenState();
}

class _MyAnalyticalScreenState extends State<MyAnalyticalScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? sales;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminServices.getEarnings(context: context);
    totalSales = earningData['totalEarnings'];
    sales = earningData['sales'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return sales == null || totalSales == null
        ? const MyLoader()
        : Column(
            children: [
              Text(
                '\$$totalSales',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 250,
                child: MyCategoryProductCharts(
                  seriesList: [
                    charts.Series(
                        id: 'Sales',
                        data: sales!,
                        domainFn: (Sales sales, _) => sales.label,
                        measureFn: (Sales sales, _) => sales.earnings),
                  ],
                ),
              ),
            ],
          );
  }
}
