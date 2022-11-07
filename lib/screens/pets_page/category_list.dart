import 'package:flutter/material.dart';
import 'package:wepets/screens/pets_page/data.dart';
import 'package:wepets/screens/pets_page/pet_widget.dart';

class CategoryList extends StatelessWidget {

  final Category category;

  CategoryList({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          (category == Category.CAT ? "Cat": "Dog") + " Category",
          style: TextStyle(
            color: Colors.grey[800],
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.grey[800],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.more_horiz,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 11),
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                childAspectRatio: 1 / 1.55,
                crossAxisCount: 1,
                crossAxisSpacing: 15,
                children: getPetList().where((i) => i.category == category).map((item) {
                  return PetWidget(
                    pet: item,
                    index: 0,
                  );
                }).toList(),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildFilter(String name, bool selected){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1,
          //color: selected ? Colors.transparent : Colors.grey[300],
        ),
        boxShadow: [
          BoxShadow(
           // color: selected ? Colors.blue[300].withOpacity(0.5) : Colors.white,
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
        color: selected ? Colors.blue[300] : Colors.white,
      ),
      child: Row(
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.grey[800],
            ),
          ),

          selected
              ? Row(
            children: [

              SizedBox(
                width: 8,
              ),

              Icon(
                Icons.clear,
                color: Colors.white,
                size: 18,
              ),

            ],
          )
              : Container(),
        ],
      ),
    );
  }
}