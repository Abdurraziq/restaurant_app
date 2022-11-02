import 'package:flutter/material.dart';

class ReviewForm extends StatefulWidget {
  final String id;
  final Function(Map<String, String>) submitCallback;

  const ReviewForm({
    super.key,
    required this.id,
    required this.submitCallback,
  });

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your name',
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please enter your name.'
                  : null;
            },
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: reviewController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your review',
            ),
            validator: (value) {
              return (value == null || value.isEmpty)
                  ? 'Please enter your review.'
                  : null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                super.widget.submitCallback(
                  {
                    'id': super.widget.id,
                    'name': nameController.text,
                    'review': reviewController.text,
                  },
                );
              }
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Review"),
          )
        ],
      ),
    );
  }
}
