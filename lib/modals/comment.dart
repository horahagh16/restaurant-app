class Comment {
  bool accept = false;
  String text;
  String answer;

  Comment(String text) {
    this.text = text;
  }

  void answerIt(String s) {
    answer = s;
  }

  void acceptIt() {
    accept = !accept;
  }
}
