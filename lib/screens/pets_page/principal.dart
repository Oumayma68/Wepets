import 'package:wepets/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:wepets/screens/pets_page/navigation_drawer_wigdet.dart';
import 'package:wepets/screens/pets_page/data.dart';
import 'package:wepets/screens/pets_page/pet_widget.dart';
import 'package:wepets/screens/pets_page/category_list.dart';


class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {

  List<Pet> pets = getPetList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor:Colors.white ,
      ),
      body:SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Find Your",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Lovely pet in anywhere",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 24,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "Pet Category",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      buildPetCategory(Category.CAT, "210",Colors.blue.shade200,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      buildPetCategory(Category.DOG, "340", Colors.red.shade200),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),

            Container(
              height: 280,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: buildNewestPet(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPetCategory(Category category, String total, Color color){
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryList(category: category)),
          );
        },
        child: Container(
          height: 80,
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [

              Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.5),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      "assets/images/" +  (category == Category.CAT ? "cat"  : "dog") + ".png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 12,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    category == Category.CAT ? "Cats" : "Dogs",
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),


                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildNewestPet(){
    List<Widget> list = [];
    for (var i = 0; i < pets.length; i++) {
      if(pets[i].newest){
        list.add(
            PetWidget(
                pet: pets[i],
                index: i
            )
        );
      }
    }
    return list;
  }

  Widget buildVet(String imageUrl, String name, String phone){
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [

          Container(
            height: 98,
            width: 98,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain,
              ),
            ),
          ),

          SizedBox(
            width: 16,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                name,
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 8,
              ),

              Row(
                children: [

                  Icon(
                    Icons.phone,
                    color: Colors.grey[800],
                    size: 18,
                  ),

                  SizedBox(
                    width: 8,
                  ),

                  Text(
                    phone,
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),

              SizedBox(
                height: 8,
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  "OPEN - 24/7",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

}
