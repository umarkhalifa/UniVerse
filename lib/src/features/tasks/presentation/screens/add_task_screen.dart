import 'package:flutter/material.dart';
import 'package:uni_verse/src/core/constants/colors.dart';
import 'package:uni_verse/src/core/constants/sizes.dart';
import 'package:uni_verse/src/core/widgets/button.dart';
import 'package:uni_verse/src/core/widgets/text_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title"),
            gapH8,
            const UniverseTextField(
              hint: 'Title',
            ),
            gapH20,
            const Text("Description"),
            gapH8,
            const UniverseTextField(
              hint: 'Description',
              maxLines: 4,
            ),
            gapH20,
            const Text("Due Date"),
            gapH8,
            const UniverseTextField(
              hint: 'Due Date',
              enabled: false,
            ),
            gapH20,
            const Text("Priority"),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: Priority.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Chip(
                        label: Text(e.name.toCapital()),
                        side: const BorderSide(color: UniVerseColours.kGray2),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.w100),
                      ),
                    ),
                  )
                  .toList(),
            ),
            gapH20,
            const Text("Type"),
            gapH8,
            DropdownButtonFormField(
              items: TaskType.values.map(
                (e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e.name.toCapital(),
                      style: const TextStyle(fontWeight: FontWeight.w100),
                    ),
                  );
                },
              ).toList(),
              value: TaskType.test,
              onChanged: (value) {},
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: UniVerseColours.kGray2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: UniVerseColours.kGray2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide:
                        const BorderSide(color: UniVerseColours.kPurple)),
                contentPadding: const EdgeInsets.all(14),
              ),
            ),
            const Spacer(),
            const UniverseButton(label: "Add Task")
          ],
        ),
      ),
    );
  }
}

enum Priority { high, medium, low }

enum TaskType { assignment, test, exam, others }

extension Capitalitze on String {
  String toCapital() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
