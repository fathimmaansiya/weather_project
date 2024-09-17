class WeatherModel {
  final String description;
  final double temperature;
  final int humidity;
 
  WeatherModel({
    required this.description,
    required this.temperature,
    required this.humidity,
  
  });
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        description: json['weather'][0]['description'],
        temperature: json['main']['temperature'].toDouble(),
        humidity: json['main']['humidity'].toInt(),
        );
  }
  Map<String, dynamic> toJson(){
    return{
      "description":description,
      "temperature":temperature,
      "humidity":humidity,
   
    };

  }
}
