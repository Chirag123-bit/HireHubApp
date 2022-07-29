import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/response/ChatResponse/UserSearchResponse.dart';
import 'package:hirehub/screens/message/CustomUI/ButtonCard.dart';
import 'package:hirehub/screens/message/CustomUI/NewContactCard.dart';
import 'package:hirehub/screens/message/Pages/CreateGroup.dart';
import 'package:hirehub/screens/message/Pages/IndividualPage.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  bool isLoading = false;
  List<User>? users = [];
  //handle search
  getSearchedUsers() async {
    final searchTerm = _searchController.text;
    if (searchTerm.isEmpty) {
      //show shackbar
      Get.snackbar(
        'Search',
        'Please enter a search term',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
      );
    } else {
      setState(() {
        isLoading = true;
      });
      UserAPI api = UserAPI();
      UserSearchResponse? responseUsers = await api.searchUsers(searchTerm);
      setState(() {
        users = responseUsers?.users ?? [];
        isLoading = false;
      });
    }
  }

  Icon custIcon = const Icon(Icons.search);
  final TextEditingController _searchController = TextEditingController();
  Widget custSearchBar = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Select Contact',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '265 Contacts',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: custSearchBar,
        actions: [
          IconButton(
            icon: custIcon,
            onPressed: () {
              setState(() {
                if (custIcon.icon == Icons.search) {
                  custIcon = const Icon(Icons.close);
                  custSearchBar = TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      suffixIcon: InkWell(
                        onTap: () => getSearchedUsers(),
                        child: const Icon(Icons.search),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  );
                } else {
                  _searchController.clear();
                  custIcon = Icon(Icons.search, size: 16.sp);
                  custSearchBar = Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Contact',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }
              });
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users!.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return InkWell(
                    onTap: () => {Get.to(const CreateGroup())},
                    child: ButtonCard(name: "New Group", icon: Icons.group),
                  );
                } else if (index == 1) {
                  return ButtonCard(
                    name: "New Message",
                    icon: Icons.message,
                  );
                } else {
                  return InkWell(
                    onTap: () =>
                        {Get.to(() => IndividualPage(user: users![index - 2]))},
                    child: NewContactCard(
                      user: users![index - 2],
                    ),
                  );
                }
              },
            ),
    );
  }
}
