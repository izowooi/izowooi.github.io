class Note {
  int id;
  String title;
  bool completed;

  //Note(this.id, this.title, this.completed);

  Note(int idd, String tt, bool cc)
  : id = idd,
  title = tt,
  completed = cc {}

  Note.fromJsonData(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'title': title,
        'completed': completed
      };

  // Map<String, dynamic> toJson()
  // {
  //   var dict = {'id':id, 'title': title, 'completed': completed};
  //   return dict;
  // }
}