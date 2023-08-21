import 'package:flutter/material.dart';
import 'package:flutter_cubit/data/model/response/post_response.dart';

class ListTileBuilder extends StatelessWidget {
  const ListTileBuilder(
    this.data, {
    Key? key,
  }) : super(key: key);

  final PostResponse data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        data.title,
        style: const TextStyle(
            color: Colors.blue, fontSize: 40.00, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        data.userId.toString(),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 27.00,
        ),
      ),
      trailing: Text(
        "ID: ${data.id}",
        style: const TextStyle(
            color: Colors.red, fontSize: 27.00, fontWeight: FontWeight.bold),
      ),
    );
  }
}
