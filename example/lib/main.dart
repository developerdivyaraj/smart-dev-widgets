import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_dev_widgets/smart_dev_widgets.dart';

void main() {
  SmartDevWidgetsConfig().initialize(
    columnSpacing: 16.0,
    buttonHeight: 50.0,
    buttonActiveBackgroundColor: Colors.deepPurple,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'SmartDev Widgets Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ShowcaseScreen(),
        );
      },
    );
  }
}

class ShowcaseScreen extends StatefulWidget {
  const ShowcaseScreen({super.key});

  @override
  State<ShowcaseScreen> createState() => _ShowcaseScreenState();
}

class _ShowcaseScreenState extends State<ShowcaseScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _checkboxValue = false;
  int _radioValue = 0;
  String? _dropdownValue;
  bool _isLoading = false;

  final List<SmartDropDownItem<String>> _dropdownItems = [
    const SmartDropDownItem(title: 'Option 1', value: 'opt1'),
    const SmartDropDownItem(title: 'Option 2', value: 'opt2'),
    const SmartDropDownItem(title: 'Option 3', value: 'opt3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SmartCommonAppBar(
        title: 'SmartDev Widgets Showcase',
        showBackButton: true,
      ),
      body: SmartSingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: SmartColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SmartText(
              'Input Widgets',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SmartDashedDivider(),
            
            SmartTextField(
              controller: _textController,
              hintText: 'Enter text here',
              labelText: 'Smart Text Field',
            ),
            
            SmartRow(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmartCheckbox(
                  value: _checkboxValue,
                  onChanged: (val) => setState(() => _checkboxValue = val ?? false),
                  label: 'Checkbox',
                ),
                SmartRadioButton<int>(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (val) => setState(() => _radioValue = val!),
                  label: 'Radio 1',
                ),
                SmartRadioButton<int>(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (val) => setState(() => _radioValue = val!),
                  label: 'Radio 2',
                ),
              ],
            ),
            
            SmartDropDown<String>(
              items: _dropdownItems,
              selectedItem: _dropdownValue,
              onChanged: (val) => setState(() => _dropdownValue = val),
              hintText: 'Select an option',
            ),

            SizedBox(height: 16.h),
            SmartText(
              'Interactive Widgets',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SmartDashedDivider(),
            
            SmartButton(
              title: 'Primary Button',
              isLoading: _isLoading,
              onTap: () async {
                setState(() => _isLoading = true);
                await Future.delayed(const Duration(seconds: 2));
                setState(() => _isLoading = false);
              },
            ),
            
            SmartButton.white(
              title: 'Secondary Outline Button',
              onTap: () {},
            ),
            
            SizedBox(height: 16.h),
            SmartText(
              'Complex Components',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SmartDashedDivider(),
            
            SmartExpansionTile(
              title: SmartText('Expandable FAQ Section'),
              children: [
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: SmartText(
                    'This is hidden content inside the SmartExpansionTile. '
                    'It supports smooth animations and custom icons.',
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 20.h),
            SmartGradientContainer(color: Colors.deepPurple),
            SizedBox(height: 20.h),
            
            SmartNoDataFound(
              text: 'No Data Found Widget',
              isImageShow: false,
            ),
          ],
        ),
      ),
    );
  }
}
