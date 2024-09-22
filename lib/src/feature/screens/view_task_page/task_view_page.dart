import 'package:flutter/material.dart';
import 'package:up_next/src/constants/color_constants.dart';
import '../../../model/card_Item_model.dart';

class TaskViewPage extends StatefulWidget {
  final String userProfile;
  final int numberOfTasks;
  final double taskProgress;
  List<TaskListModel> taskList = [];

  TaskViewPage({
    Key? key,
    required this.userProfile,
    required this.numberOfTasks,
    required this.taskProgress,
    required this.taskList,
  }) : super(key: key);

  @override
  State<TaskViewPage> createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
  @override
  void initState() {
    super.initState();
    widget.taskList = [
      TaskListModel('Complete Flutter project',
          DateTime.now().subtract(Duration(days: 2)), 'In Progress'),
      TaskListModel('Prepare for meeting',
          DateTime.now().subtract(Duration(days: 1)), 'Completed'),
      TaskListModel('Submit assignment', DateTime.now(), 'Not Started'),
      TaskListModel('Write blog post', DateTime.now().add(Duration(days: 1)),
          'In Progress'),
      TaskListModel('Grocery shopping', DateTime.now().add(Duration(days: 2)),
          'Not Started'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    List<TaskListModel> completedTasks = widget.taskList
        .where((task) => task.taskStatus == 'Completed')
        .toList();

    List<TaskListModel> todayTasks = widget.taskList
        .where((task) =>
            task.taskStatus != 'Completed' &&
            task.taskCreationTime.isSameDay(DateTime.now()))
        .toList();

    List<TaskListModel> upcomingTasks = widget.taskList
        .where((task) =>
            task.taskStatus != 'Completed' &&
            task.taskCreationTime.isAfter(DateTime.now()))
        .toList();

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.of(context).pop(); // Go back to the previous screen
              },
            ),
            // User Profile
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Icon(
                Icons.account_circle,
                size: 65.0,
                color: AppColorsConstant.customPrimaryColor,
              ),
            ),
            const SizedBox(height: 10),

            // Number of tasks
            Text(
              "${widget.numberOfTasks} tasks",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            const Text(
              "Personal",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 25),

            // Progress Indicator
            LinearProgressIndicator(
              value: widget.taskProgress,
              backgroundColor: Colors.grey,
              color: AppColorsConstant.customPrimaryColor,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Hide Completed",
                          style: TextStyle(fontSize: 16, color: Colors.black38),
                        ),
                      ),
                      initiallyExpanded: true,
                      iconColor: Colors.black45,
                      childrenPadding: EdgeInsets.zero,
                      children: completedTasks
                          .map((task) => TaskItem(
                                task: task,
                                onDelete: () {
                                  // Add your delete logic here
                                },
                                onEdit: () {
                                  // Add your edit logic here
                                },
                              ))
                          .toList(),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // List of today's tasks
                  const Text(
                    "Today's Tasks:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...todayTasks.map((task) => TaskItem(
                        task: task,
                        onDelete: () {
                          // Add your delete logic here
                        },
                        onEdit: () {
                          // Add your edit logic here
                        },
                      )),

                  const SizedBox(height: 20),

                  // List of upcoming tasks
                  const Text(
                    "Upcoming Tasks:",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...upcomingTasks.map((task) => TaskItem(
                        task: task,
                        onDelete: () {
                          // Add your delete logic here
                        },
                        onEdit: () {
                          // Add your edit logic here
                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Task item widget
class TaskItem extends StatelessWidget {
  final TaskListModel task;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 5),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0),
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Transform.scale(
              scale: 0.9,
              child: Checkbox(
                value: task.taskStatus == 'Completed',
                onChanged: (bool? value) {
                  // Add logic to handle checkbox change (update task status)
                },
              ),
            ),
            title: Text(
              task.taskName,
              style: const TextStyle(fontSize: 16.0),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 20,
                    color: AppColorsConstant.customPrimaryColor,
                  ),
                  onPressed: onEdit,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20,
                    color: AppColorsConstant.customPrimaryColor,
                  ),
                  onPressed: onDelete,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 16),
          child: Divider(
            height: 2,
            color: Colors.grey[300],
            thickness: 1,
          ),
        ), // Adjust the color if needed
      ],
    );
  }
}

// Helper extension to check if two dates are the same day
extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
