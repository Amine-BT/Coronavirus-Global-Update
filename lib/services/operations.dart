class Operations{
  static String addSpacing(int val) {
    String finalVal = val.toString();
    String output = "";
    bool done = false;
    int index = 1;
    for (int i = 1; i <= finalVal.length; i++) {
      var char = finalVal[i - 1];
      if (finalVal.length % 3 == 0)
        i % 3 == 0 ? output += "$char" " " : output += char;
      else if (finalVal.length % 3 == 1) {
        if (i == 1) {
          output += "$char" " ";
          index = 1;
        }
        if (i != 1) {
          index % 3 == 0 ? output += "$char" " " : output += char;
          index++;
        }
      }
      else if (finalVal.length % 3 == 2) {

        if (i > 2) {
          index % 3 == 0 ? output += "${finalVal[i - 1]}"" " : output += finalVal[i - 1];
          index++;
        }
        if(i == finalVal.length -1)  output = "${finalVal[0]}${finalVal[1]}"" "+output;

      }
    }
    return output;
  }
}