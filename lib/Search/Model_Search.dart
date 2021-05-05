class Posts {
//  final String ID;
//  final int id;
  final String title;
  final String description;

  Posts({this.title, this.description});

  factory Posts.formJson(Map <String, dynamic> json){
    return new Posts(
//      ID: json['ID'],
//      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}