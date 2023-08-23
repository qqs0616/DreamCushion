//主界面

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_sleep/code/module/biz_main/ui/alarm/ui/alarm_main_page.dart';
import 'package:smart_sleep/code/module/biz_main/ui/setting/ui/setting_main_page.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../base/ui/app_mvvm.dart';
import '../../smart/ui/smart_main_page.dart';

class MainPage extends AppBaseStatelessWidget<_MainVm> {
  final String title = S.current.app_name;

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (loginModel) => _MainVm(),
      builder: (context, child) {
        ThemeData themeData = Theme.of(context);
        registerEvent(context);
        var _mainVm = Provider.of<_MainVm>(context, listen: false);
        List<Widget> _pageList = [
          SmartMainPage(),
          AlarmMainPage(),
          SettingMainPage()
        ];
        var _pageController = PageController();
        List<BottomNavigationBarItem> bottomNavigationBarItem =
            <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Consumer<_MainVm>(
                builder: (context, value, child) {
                  return const Icon(Icons.text_snippet);
                },
              ),
              label: _mainVm.titleArray[0]),
          BottomNavigationBarItem(
              icon: Consumer<_MainVm>(
                builder: (context, value, child) {
                  return const Icon(Icons.access_time_filled);
                },
              ),
              label: _mainVm.titleArray[1]),
          BottomNavigationBarItem(
              icon: Consumer<_MainVm>(
                builder: (context, value, child) {
                  return const Icon(Icons.person);
                },
              ),
              label: _mainVm.titleArray[2])
        ];
        return Scaffold(
            body: PageView.builder(
                //要点1
                physics: const NeverScrollableScrollPhysics(),
                //禁止页面左右滑动切换
                controller: _pageController,
                //回调函数
                itemCount: _pageList.length,
                itemBuilder: (context, index) => _pageList[index]),
            bottomNavigationBar:
                Consumer<_MainVm>(builder: (context, value, child) {
              return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: _mainVm.currentPageIndex,
                  onTap: (value) {
                    _pageController.jumpToPage(value);
                    _mainVm.updateTabIndex(value);
                  },
                  selectedFontSize: 12,
                  items: bottomNavigationBarItem);
            }));
      },
    );
  }
}

class _MainVm extends AppBaseVm {
  int currentPageIndex = 0;
  final List<String> titleArray = [
    S.current.main_label_report,
    S.current.main_label_alarm,
    S.current.main_label_setting,
  ];

  void updateTabIndex(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
