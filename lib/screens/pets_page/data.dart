enum Category { CAT, DOG }
enum Condition { Adoption, Disappear }

class Pet {

  String name;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;

  Pet(this.name,this.condition, this.category, this.imageUrl, this.favorite, this.newest);

}

List<Pet> getPetList(){
  return <Pet>[
    Pet("Abyssinian Cats", "Adoption", Category.CAT, "assets/images/cats/cat_1.jpg", true, true),
    Pet("Scottish Fold",  "disappear", Category.CAT, "assets/images/cats/cat_2.jpg", false, false),
    Pet("Ragdoll", "Disappear", Category.CAT, "assets/images/cats/cat_3.jpg", false, false),
    Pet("Burmés", "Disappear", Category.CAT, "assets/images/cats/cat_4.jpg", true, true),





    Pet("Affenpinscher", "Adoption", Category.DOG, "assets/images/dogs/dog_1.jpg", true, true),
    Pet("Akita Shepherd","Adoption", Category.DOG, "assets/images/dogs/dog_2.jpg", false, false),
    Pet("American Foxhound", "Disappear", Category.DOG, "assets/images/dogs/dog_3.jpg", false, false),
    Pet("Shepherd Dog", "Disappear", Category.DOG, "assets/images/dogs/dog_4.jpg", true, true),
    Pet("Australian Terrier", "Adoption", Category.DOG, "assets/images/dogs/dog_5.jpg", true, false),

  ];
}