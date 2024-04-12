import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/add_detatil.dart';
import 'package:studentlist_state/screens/edit_screen.dart';
import 'package:studentlist_state/services/services.dart';

class ListView_Screen extends StatefulWidget {
  const ListView_Screen({super.key});

  @override
  State<ListView_Screen> createState() => _ListView_ScreenState();
}

class _ListView_ScreenState extends State<ListView_Screen> {
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => Add_Deatails_Screen()));
          },
          label: Text('Add +'),
          shape: CircleBorder(),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 83, 64, 112),
          title: Text(
            'Student Detail',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: 1),
          ),
        ),
        body: ValueListenableBuilder<Box<Notes>>(
            valueListenable: Boxes.getData().listenable(),
            builder: (context, box, _) {
              var data = box.values.toList().cast<Notes>();
              if (data.isEmpty) {
                return Center(
                  child: Text('No Data'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(File(data[index].image)),
                              ),
                              title: Text(data[index].userName),
                              subtitle: Text(data[index].userContact),
                              trailing: PopupMenuButton(onSelected: (value) {
                                if (value == 'edit') {
                                  service.editDialog(context, data[index]);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (ctx) => Edit_Screen()));
                                } else if (value == 'delete') {
                                  service.deleteNotes(data[index]);
                                }
                              }, itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                    child: Text('Edit'),
                                    value: 'edit',
                                  ),
                                  PopupMenuItem(
                                    child: Text('Delete'),
                                    value: 'delete',
                                  ),
                                ];
                              })),
                        );
                      }),
                );
              }
            }));
  }
}
