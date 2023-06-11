import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan11/pertemuan11_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan11Screen extends StatefulWidget {
  const Pertemuan11Screen({Key? key}) : super(key: key);

  @override
  _Pertemuan11ScreenState createState() => _Pertemuan11ScreenState();
}

class _Pertemuan11ScreenState extends State<Pertemuan11Screen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Pertemuan11Provider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 11"),
        actions: [
          menuList(context),
        ],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);
    if (prov.data == null) {
      return const Center(
        child: Text('Data tidak ditemukan.'),
      );
    } else {
      return ListView(
        children: List.generate(prov.data['data'].length, (index) {
          var item = prov.data['data'][index];
          return Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                title: Text(item['model']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Developer: ${item['developer']}'),
                    Text('Price: ${item['price']}'),
                    Text('Rating: ${item['rating']}'),
                  ],
                ),
              ),
              const Divider()
            ],
          );
        }),
      );
    }
  }

  Widget menuList(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);

    return PopupMenuButton(
      icon: const Icon(Icons.more_vert),
      itemBuilder: ((context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('hp'),
              leading: const Icon(Icons.phone),
              title: const Text('Hp'),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('Laptop'),
              leading: const Icon(Icons.laptop),
              title: const Text('Laptop'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.setData = null,
              leading: const Icon(Icons.clear),
              title: const Text('Clear'),
            ),
          ),
        ];
      }),
    );
  }
}
