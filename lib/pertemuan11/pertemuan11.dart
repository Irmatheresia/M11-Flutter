import 'package:flutter/material.dart';
import 'package:flutter_application_1/pertemuan11/pertemuan11_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({super.key});

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
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

  body(BuildContext context) {
    final prov = Provider.of<Pertemuan11Provider>(context);
    if (prov.data == null) {
      return const CircularProgressIndicator();
    } else
      return ListView(
        children: List.generate(prov.data['data']!.length, (index) {
          var item = prov.data['data']![index];
          return Column(
            children: [
              ListTile(
                leading:
                    CircleAvatar(backgroundImage: NetworkImage(item['img'])),
                title: Text(item['model']),
              ),
              const Divider()
            ],
          );
        }),
      );
  }

  menuList(BuildContext context) {
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
          )),
          const PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () => prov.ubahList('Laptop'),
              leading: const Icon(Icons.laptop),
              title: const Text('Laptop'),
            ),
          )
        ];
      }),
    );
  }
}
