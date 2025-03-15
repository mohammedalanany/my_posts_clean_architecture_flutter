// الملف دا بيكون فيه رابط endpoint  والفيرجن v1/
class EndPoints {
  static const String newsAPIBaseURL = "https://newsapi.org/v2/top-headlines";
// add your api key here
  static const String newsAPIKey = 'f54648d28a154937afe9beb437c67806';
  static const String countryQuery = 'us';
  static const String categoryQuery = 'technology';
  static const String kDefaultImage =
      "https://cdn.vectorstock.com/i/preview-1x/65/30/default-image-icon-missing-picture-page-vector-40546530.jpg";

  ////

  static const queryParameters = <String, dynamic>{
    'apiKey': 'f54648d28a154937afe9beb437c67806',
    'country': 'us',
    'category': 'technology',
  };

  ///
  static const String baserUrl = "https://jsonplaceholder.typicode.com/";
  static const String template = "template/";
  static const String user = "users/";
  static const String post = "posts/";
}

class ApiKey {
  static String id = "id";
  static String name = "name";
  static String username = "username";
  static String email = "email";
  static String address = "address";
  static String street = "street";
  static String suite = "suite";
  static String city = "city";
  static String zipcode = "zipcode";
  static String geo = "geo";
  static String lat = "lat";
  static String lng = "lng";
  static String phone = "phone";
  static String website = "website";
  static String company = "company";
  static String catchPhrase = "catchPhrase";
  static String bs = "bs";
}
