import 'package:di_eg3/getit.dart';
import 'package:flutter/material.dart';

import 'Student.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _gradeController = TextEditingController();
  final _subjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  //  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: 'Enter Name'),
                ),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(hintText: 'Enter Age'),
                ),
                TextFormField(
                  controller: _gradeController,
                  decoration: InputDecoration(hintText: 'Enter Grade'),
                ),
                TextFormField(
                  controller: _subjectController,
                  decoration: InputDecoration(hintText: 'Enter Subject'),
                ),
                ElevatedButton(
                    onPressed: () {
                      var student = getIt.get<Student>();
                      student.name = _nameController.text;
                      student.age = _ageController.text;
                      student.grade = _gradeController.text;
                      student.subject = _subjectController.text;
                      showSnackbar();
                    },
                    child: Text('Submit')),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog1(context));
                    },
                    child: Text('Show Details'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget AlertDialog1(BuildContext ctx) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 48.0),
      title: Text(
        'Student Details',
        style: Theme.of(ctx).textTheme.headline4,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${getIt.get<Student>().name}',
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(
            height: 8,
          ),
          Text('Age: ${getIt.get<Student>().age}',
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(
            height: 8,
          ),
          Text('Grade: ${getIt.get<Student>().grade}',
              style: Theme.of(context).textTheme.headline6),
          const SizedBox(
            height: 8,
          ),
          Text('Subject: ${getIt.get<Student>().subject}',
              style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }

  void showSnackbar() {
    final snackBar = SnackBar(
      content: const Text('Submitted successfully'),
      action: SnackBarAction(
        label: 'close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
