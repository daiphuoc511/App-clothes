class RemoteConfig {
  // static String baseUrl = 'http://192.168.1.1:8080';
  static String baseUrl = 'https://app-api-phuoc.herokuapp.com';
  static final Map<dynamic, String> config = {
    "PRODUCT_WOMAN": "$baseUrl/api/user/product_female",
    "PRODUCT_WOMAN_DRESS": "$baseUrl/api/user/product_woman_dress",
    "PRODUCT_WOMAN_JACKET": "$baseUrl/api/user/product_woman_jacket",
    "PRODUCT_WOMAN_KAKI": "$baseUrl/api/user/product_woman_kaki",
    "PRODUCT_WOMAN_SKIRT": "$baseUrl/api/user/product_woman_skirt",
    "PRODUCT_WOMAN_TSHIRT": "$baseUrl/api/user/product_woman_tshirt",
    "PRODUCT_MAN": "$baseUrl/api/user/product_male",
    "PRODUCT_MAN_JACKET": "$baseUrl/api/user/product_man_jacket",
    "PRODUCT_MAN_KAKI": "$baseUrl/api/user/product_man_kaki",
    "PRODUCT_MAN_POLO": "$baseUrl/api/user/product_man_polo",
    "PRODUCT_MAN_SHIRT": "$baseUrl/api/user/product_man_shirt",
    "PRODUCT_MAN_TROUSER": "$baseUrl/api/user/product_man_trouser",
    "PRODUCT_MAN_TSHIRT": "$baseUrl/api/user/product_man_tshirt",
    "PRODUCT_BY_COLOR": "$baseUrl/api/user/product_season",
    "SIGN_UP": "$baseUrl/api/auth/register",
    "LOGIN": "$baseUrl/api/auth/login",
    "PRODUCT_BY_USER": "$baseUrl/api/auth/product_user",
    "PRODUCT_BY_SIZE_USER": "$baseUrl/api/auth/product_size_user",
    "PROFILE": "$baseUrl/api/auth/profile_user",
    "UPDATE_PROFILE": "$baseUrl/api/auth/edit_user",
    "CART_USER": "$baseUrl/api/user/get_cart",
    "ADD_CART": "$baseUrl/api/user/add_to_cart",
    "DELETE_PRODUCT_CART": "$baseUrl/api/user/delete_product_cart",
  };
}
