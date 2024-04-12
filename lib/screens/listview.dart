import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentlist_state/model/box.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/add_detatil.dart';
import 'package:studentlist_state/screens/profile_detail.dart';
import 'package:studentlist_state/services/services.dart';

class ListView_Screen extends StatefulWidget {
  const ListView_Screen({Key? key}) : super(key: key);

  @override
  State<ListView_Screen> createState() => _ListView_ScreenState();
}

class _ListView_ScreenState extends State<ListView_Screen> {
  String searchQuery = '';
  Service service = Service();
  bool isGridView = false; // Flag to track current view mode

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
            letterSpacing: 1,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search by name...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LIST VIEW IN ${isGridView ? 'GRID' : 'LIST'}...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isGridView = !isGridView; // Toggle view mode
                    });
                  },
                  icon: Icon(isGridView ? Icons.list : Icons.grid_view),
                ),
              ],
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<Box<Notes>>(
              valueListenable: Boxes.getData().listenable(),
              builder: (context, box, _) {
                var data = box.values.toList().cast<Notes>();
                var filteredData = data.where((student) =>
                    student.userName.toLowerCase().contains(searchQuery));
                if (data.isEmpty) {
                  return Center(
                    child: Text('No Data'),
                  );
                } else if (filteredData.isEmpty) {
                  return Center(
                    child: Text('No matching results found'),
                  );
                } else {
                  return isGridView
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: filteredData.length,
                          itemBuilder: (context, index) {
                            return buildGridItem(filteredData.elementAt(index));
                          },
                        )
                      : ListView.builder(
                          itemCount: filteredData.length,
                          itemBuilder: (context, index) {
                            return buildListItem(filteredData.elementAt(index));
                          },
                        );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListItem(Notes student) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProfielDetail_Screen(student: student),
          ),
        );
      },
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: FileImage(File(student.image)),
          ),
          title: Text(student.userName),
          subtitle: Text(student.userContact),
          trailing: PopupMenuButton(
            onSelected: (value) {
              if (value == 'edit') {
                service.editDialog(context, student);
              } else if (value == 'delete') {
                service.deleteNotes(student);
              }
            },
            itemBuilder: (context) {
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
            },
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(Notes student) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ProfielDetail_Screen(student: student),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: FileImage(
                      File(student.image),
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                student.userName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
