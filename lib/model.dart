class RecipeModel{

  late String appLabel;
  late String appimgurl;
  late double appCalories;
  late String appUrl;

  RecipeModel({this.appLabel = "LABEL", this.appimgurl = "IMAGE", this.appCalories = 0.000, this.appUrl = "URL" });
  factory RecipeModel.fromMap(Map recipe){
    return RecipeModel (
      appLabel: recipe["label"],
      appCalories: recipe["calories"],
      appimgurl: recipe["image"],
      appUrl: recipe["url"]


    );
  }



}