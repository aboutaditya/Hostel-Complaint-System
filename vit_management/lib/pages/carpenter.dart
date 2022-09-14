import 'package:flutter/material.dart';

class carpenter extends StatelessWidget {
  const carpenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Carpenter Complaint"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
            child: Center(
              child: Column(
          children: [
              SizedBox(height: 10,),
              Image.asset("images/carpenter.jpg",height: 250,),
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
              SizedBox(height: 10,),
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
              SizedBox(height: 10,),

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
              SizedBox(height: 10,),

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
                  child: Text("Submit"))
          ],
        ),
            )),
      ),
    );
  }
}
