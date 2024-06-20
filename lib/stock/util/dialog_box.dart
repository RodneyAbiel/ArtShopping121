import 'package:artisian/emailPages/email_components/my_button.dart';
import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController taskController;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.taskController,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: SingleChildScrollView(
        child: Container(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // get user input for task
              // TextField(
              //   controller: taskController,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(),
              //     hintText: "Add a new task",
              //   ),
              // ),
              // get user input for name
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Name",
                ),
              ),
              // get user input for email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              // get user input for phone number
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone",
                ),
              ),
              // buttons -> save + cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                  MyButton(text: "Save", onTap: onSave),
        
                  const SizedBox(width: 8),
        
                  // cancel button
                  MyButton(text: "Cancel", onTap: onCancel),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
