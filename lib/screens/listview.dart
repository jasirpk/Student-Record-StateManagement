import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studentlist_state/model/modal.dart';
import 'package:studentlist_state/screens/add_detatil.dart';
import 'package:studentlist_state/screens/profile_detail.dart';
import 'package:studentlist_state/services/notifier_getx.dart';
import 'package:studentlist_state/services/services.dart';

class ListViewScreen extends StatelessWidget {
  final Service service = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => Add_Deatails_Screen());
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
      body: GetBuilder<ListViewController>(
        init: ListViewController(),
        builder: (controller) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: controller.setSearchQuery,
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
                      'LIST VIEW IN ${controller.isGridView.value ? 'GRID' : 'LIST'}...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Obx(() {
                      return IconButton(
                        onPressed: controller.toggleViewMode,
                        icon: Icon(
                          controller.isGridView.value
                              ? Icons.list
                              : Icons.grid_view,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() {
                  var filteredData = controller.filteredData;
                  if (filteredData.isEmpty) {
                    return Center(
                      child: Text('No Data'),
                    );
                  }
                  return controller.isGridView.value
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: filteredData.length,
                          itemBuilder: (context, index) {
                            return buildGridItem(filteredData[index]);
                          },
                        )
                      : ListView.builder(
                          itemCount: filteredData.length,
                          itemBuilder: (context, index) {
                            return buildListItem(filteredData[index]);
                          },
                        );
                }),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildListItem(Notes student) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ProfileDetail_Screen(student: student));
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
                service.editDialog(Get.context!, student);
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
        Get.to(() => ProfileDetail_Screen(student: student));
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          elevation: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: FileImage(
                    File(student.image),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Text(
                student.userName,
                textAlign: TextAlign.center,
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
