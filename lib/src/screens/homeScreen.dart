import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:test_dio/src/controllers/userController.dart';
import 'package:test_dio/src/models/user.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _controller;
  final _userController = Get.put(UserController());

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      print("aaaa");
      if (_userController.isloading.value == false &&
          _userController.page.value <=
              _userController.submitCase.value.meta.lastPage) {
        _userController.getListingOfSubmitCases();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    loadData();
  }

  loadData() {
    // _userController.getUserFunc();
    // _userController.getListingOfSubmitCases();

    // _userController.getListingOfSubmit();
    _userController.postLoginFunc();
  }

  Widget _loadingMore() {
    return Container(
      padding: EdgeInsets.all(5.0),
      color: Colors.transparent,
      child: Center(
        child: Column(
          children: [
            CupertinoActivityIndicator(),
            Text("loading..."),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: Obx(
        () => Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: _userController.submitCaseData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 100.0,
                      margin: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Text(
                          "$index",
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (_userController.isloading.value == true &&
                  _userController.page.value != 1)
                _loadingMore()
            ],
          ),
        ),
      ),
    );
  }
}
