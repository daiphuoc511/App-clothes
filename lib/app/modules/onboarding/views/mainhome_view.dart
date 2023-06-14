import 'package:clothes_app/app/modules/onboarding/controllers/login_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/mainhome_controller.dart';
import 'package:clothes_app/app/modules/onboarding/controllers/profile_controller.dart';
import 'package:clothes_app/app/modules/onboarding/views/product_detail_by_size_user_view.dart';
import 'package:clothes_app/app/modules/onboarding/views/product_detail_view.dart';
import 'package:clothes_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainHomeView extends GetView<MainHomeController> {
  final MainHomeController _mainHomeController = Get.put(MainHomeController());
  final LoginController _loginController = Get.put(LoginController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 50,
                height: 50,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                  backgroundColor: Colors.grey,
                  radius: 30,
                ),
              ))
        ],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: buildMainHomePage(context),
    );
  }

  buildMainHomePage(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Wrap(
            children: [
              _loginController.isAuthenticated.value
                  ? Text(
                      'Chào mừng ${_profileController.profile.name}',
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'Chào mừng',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Bộ sưu tập',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/icon/icon_man.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Nam',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.toNamed(Routes.PRODUCTMAN);
                },
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                    primary: Colors.transparent,
                    elevation: 0),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child:
                            Image.asset('assets/images/icon/icon_woman.png')),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Nữ',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.toNamed(Routes.PRODUCTWOMAN);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          _loginController.isAuthenticated.value
              ? const Text(
                  'Sản phẩm dành cho bạn',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const Text(
                  'Sản phẩm',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => _loginController.isAuthenticated.value
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: _loginController.productListByUser.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: InkWell(
                          highlightColor:
                              const Color.fromARGB(255, 124, 125, 126),
                          child: Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 245, 236)),
                                child: Image.asset(
                                  _loginController
                                          .productListByUser[index].image ??
                                      'assets/images/product/ao_a1.png',
                                  height: 110,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _loginController
                                    .productListByUser[index].productName
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _loginController.productListByUser[index].price
                                    .toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 244, 102, 4),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.to(ProductDetailView(
                                productId: _loginController
                                    .productListByUser[index].productId));
                          },
                        ),
                      );
                    },
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: _mainHomeController.productList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: InkWell(
                          highlightColor:
                              const Color.fromARGB(255, 124, 125, 126),
                          child: Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 245, 236)),
                                child: Image.asset(
                                  _mainHomeController
                                          .productList[index].image ??
                                      'assets/images/product/ao_a1.png',
                                  height: 110,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _mainHomeController
                                    .productList[index].productName
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _mainHomeController.productList[index].price
                                    .toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 244, 102, 4),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.to(ProductDetailView(
                                productId: _mainHomeController
                                    .productList[index].productId));
                          },
                        ),
                      );
                    }),
          ),
          const SizedBox(
            height: 20,
          ),
          _loginController.isAuthenticated.value &&
                  _loginController.productListBySizeUser.isEmpty == false
              ? const Text(
                  'Sản phẩm liên quan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => _loginController.isAuthenticated.value
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: _loginController.productListBySizeUser.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: InkWell(
                          highlightColor:
                              const Color.fromARGB(255, 124, 125, 126),
                          child: Column(
                            children: [
                              Container(
                                width: screenSize.width,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 255, 245, 236)),
                                child: Image.asset(
                                  _loginController
                                          .productListBySizeUser[index].image ??
                                      'assets/images/product/ao_a1.png',
                                  height: 110,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _loginController
                                    .productListBySizeUser[index].productName
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _loginController
                                    .productListBySizeUser[index].price
                                    .toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 244, 102, 4),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Get.to(ProductDetailBySizeUserView(
                                productId: _loginController
                                    .productListBySizeUser[index].productId));
                          },
                        ),
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
