import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constants.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  String? _categoryName;
  String? _categoryDescription;
  IconData? _selectedIcon;

  // List of icons the user can choose from
  final List<IconData> _icons = [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.sports,
    Icons.travel_explore,
    Icons.favorite,
  ];

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "addCategoryHero",
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 15,
          shape: const RoundedRectangleBorder(
            side: BorderSide(width: 1),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(300),
              bottomRight: Radius.circular(0),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(260),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100, left: 16),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/diagram.gif',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Add New Category",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight, // Fill the available height
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Category Name',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a category name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _categoryName = value;
                                },
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField<IconData>(
                                decoration: const InputDecoration(
                                  labelText: 'Select Icon',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                items: _icons.map((icon) {
                                  return DropdownMenuItem(
                                    value: icon,
                                    child: Icon(icon),
                                  );
                                }).toList(),
                                onChanged: (icon) {
                                  setState(() {
                                    _selectedIcon = icon;
                                  });
                                },
                                value: _selectedIcon,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Category Description',
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                                maxLines: 3,
                                onChanged: (value) {
                                  _categoryDescription = value;
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  AppColorsConstant.customPrimaryColor,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 110.0,
                                  vertical: 18.0), // Increased padding
                              textStyle: TextStyle(fontSize: 20.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Submit logic
                              }
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
