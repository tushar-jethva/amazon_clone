import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class MyAddressBox extends StatelessWidget {
  const MyAddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 42,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 144, 226, 221),
          Color.fromARGB(255, 162, 236, 233)
        ],
        stops: [0.5, 1.0],
      )),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                style: TextStyle(fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(left: 5, top: 2,right: 8),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.black,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
