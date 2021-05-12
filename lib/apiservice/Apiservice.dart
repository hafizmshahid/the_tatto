import 'package:the_tatto/ResponseModel/bannerResponse.dart';
import 'package:the_tatto/ResponseModel/categorydataResponse.dart';
import 'package:the_tatto/ResponseModel/offerResponse.dart';
import 'package:the_tatto/ResponseModel/offerbannerResppose.dart';
import 'package:the_tatto/ResponseModel/otpmatchResponse.dart';
import 'package:the_tatto/ResponseModel/salonResponse.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:the_tatto/ResponseModel/loginResponse.dart';
import 'package:the_tatto/ResponseModel/registerResponse.dart';
import 'package:the_tatto/ResponseModel/registererror.dart';

part 'Apiservice.g.dart';


@RestApi(baseUrl: "https://saasmonks.in/App-Demo/thebarber-54521/public/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // @POST("/posts")
  // Future<List<loginmodel>> getTasks();

  @POST("login")
  @FormUrlEncoded()
  Future<String> login(@Field() String email,
      @Field()String password,
      @Field()String device_token,);


  @POST("register")
  @FormUrlEncoded()
  Future<registerResponse> register(
      @Field() String name,
      @Field()String email,
      @Field()String phone,
      @Field()String password,
      @Field()int verify,
      @Field()String code,
      );

  @POST("checkotp")
  @FormUrlEncoded()
  Future<otpmatchResponse> checkotp(
      @Field() String otp,
      @Field()String user_id,
      );

  @POST("sendotp")
  @FormUrlEncoded()
  Future<otpmatchResponse> sendotp(
      @Field() String email,

      );

  @GET("banners")
  Future<bannerResponse> banners();

  @GET("coupon")
  Future<offerResponse> coupon();

  @GET("offers")
  Future<offerbannerResppose> offersbanner();


  @GET("categories")
  Future<categorydataResponse> categories();


  @GET("salons")
  Future<salonResponse> salons();



}
