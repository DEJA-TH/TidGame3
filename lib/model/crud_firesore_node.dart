class Note {
  final String game;
  final String content;
  final String id;


  Note({this.game, this.content, this.id});

  Note.fromMap(Map<String, dynamic>data, String id)
      :game=data["game"],
        content=data["content"],
        id=id;


  Map<String,dynamic> toMap(){
    return {
      "game":game,
      "content":content,
    };
  }
}