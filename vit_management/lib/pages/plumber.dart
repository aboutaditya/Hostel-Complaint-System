import 'package:flutter/material.dart';

class plumber extends StatelessWidget {
  const plumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Plumber Complaint"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),

        child: Form(
            child: Center(
              child: Column(
          children: [
              const SizedBox(height: 10,),
              Image.asset("images/plumber.jpg",height: 250,),
              SizedBox(height: 10,),
              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Registration Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter Registration Number", labelText: "Registration No. :"),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Room Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter Room no.", labelText: "Room No. :"),
              ),
              const SizedBox(height: 10,),

              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter Contact Number";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter Contact no.", labelText: "Contact No. :"),
              ),
              const SizedBox(height: 10,),

              TextFormField(
                validator: ((value) {
                  if (value!.isEmpty) {
                    return "Enter the issue!";
                  } else {
                    return null;
                  }
                }),
                decoration: const InputDecoration(
                    hintText: "Enter issue", labelText: "Issue :"),
              ),const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Submit"))
          ],
        ),
            )),
      ),
    );
  }
}