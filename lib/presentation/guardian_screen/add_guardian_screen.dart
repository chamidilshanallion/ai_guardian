import 'package:ai_guaridan_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_field.dart';

class AddGuardianPage extends StatefulWidget {
  @override
  _AddGuardianPageState createState() => _AddGuardianPageState();
}

class _AddGuardianPageState extends State<AddGuardianPage> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  final _ipAddressController = TextEditingController();

  int _currentStep = 0;
  String _selectedUser = '';
  String _selectedType = '';
  bool _isActivated = false;

  List<Map<String, String>> _allUsers = [
    {'name': 'John Doe', 'photo': 'assets/john_doe.png'},
    {'name': 'Jane Smith', 'photo': 'assets/jane_smith.png'},
    {'name': 'Officer Jones', 'photo': 'assets/officer_jones.png'},
  ];

  List<Map<String, String>> _searchResults = [];
  List<String> _guardianTypes = ['Family Member', 'Neighbor', 'Police Officer'];

  @override
  void dispose() {
    _searchController.dispose();
    _ipAddressController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _finish() {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Guardian added successfully!')),
    );
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchResults = _allUsers
          .where((user) =>
          user['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleStatus() {
    setState(() {
      _isActivated = !_isActivated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
        height: MediaQuery.of(context).size.height * 0.50,
        decoration: new BoxDecoration(
        color: ColorConstants.themeColor,
        borderRadius: new BorderRadius.only(
        topLeft: const Radius.circular(25.0),
        topRight: const Radius.circular(25.0),
        ),
        ),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_currentStep == 0) ...[
                Container (
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search User:',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: ColorConstants.whiteColor
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextFormField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          fillColor: ColorConstants.whiteColor,
                          filled: true,
                          hintText: '',
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.hintColor
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              // color: theme.colorScheme.secondaryContainer.withOpacity(0.5),
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: _onSearchChanged,
                      ),
                      SizedBox(height: 10),
                      ..._searchResults.map((result) {
                        return ListTile(
                          // leading: CircleAvatar(
                          //   backgroundImage: AssetImage(result['photo']!),
                          // ),
                          title: Text(
                              result['name']!,
                            style: TextStyle(
                              color: ColorConstants.whiteColor
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _selectedUser = result['name']!;
                              _searchController.text = _selectedUser.toString();
                              FocusManager.instance.primaryFocus?.unfocus();
                              _searchResults = [];
                              // _nextStep();
                            });
                          },
                        );
                      }).toList(),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CustomElevatedButton(
                          buttonTitle: 'Continue',
                          bgColor:  ColorConstants.logoColor,
                          isAuthButton: true,
                          onPressed: _nextStep
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Center(
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: ColorConstants.logoColor
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              if (_currentStep == 1) ...[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Guardian Type:',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: ColorConstants.whiteColor
                        ),
                      ),
                      DropdownButtonFormField(


                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        items: _guardianTypes.map((String type) {
                          return DropdownMenuItem(
                            value: type,
                            child: Text(
                              type,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedType = newValue.toString();
                          });
                        },
                        value: _selectedType.isNotEmpty ? _selectedType : null,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      CustomElevatedButton(
                        buttonTitle: 'Continue',
                        onPressed: _nextStep, bgColor: ColorConstants.logoColor,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: GestureDetector(
                          onTap: _previousStep,
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: ColorConstants.logoColor
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
              if (_currentStep == 2) ...[
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/success.png',
                    width: 80.0,
                    height: 80.0,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Success! User has been added as a guardian',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: ColorConstants.whiteColor,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                    buttonTitle: 'Done',
                    bgColor:  ColorConstants.logoColor,
                    isAuthButton: true,
                    onPressed: _finish
                ),
              ],
            ],
          ),
        ),
      )
    );
  }
}