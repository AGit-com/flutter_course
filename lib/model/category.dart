class Category {
  final String name;
  final int numOfCourses;
  final String image;

  Category(this.name, this.numOfCourses, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['courses'], item['image']))
    .toList();

var categoriesData = [
  {
    "name": "Marketing",
    'courses': 17,
    'image': "assets/images/computer_org.jpg"
  },
  {"name": "UX Design", 'courses': 25, 'image': "assets/images/sql.png"},
  {"name": "Photography", 'courses': 13, 'image': "assets/images/python.png"},
  {"name": "Business", 'courses': 17, 'image': "assets/images/python.png"},
];
