import 'package:flutter/material.dart';
import 'package:weather_project/view/homepage.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
           const SizedBox(height: 100,),
            TextFormField(
              decoration: InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
             hintText: "User Name",
             prefixIcon:const Icon(Icons.person)
              ),
              
            ),
            const SizedBox(height: 30,),
              TextFormField(
              decoration: InputDecoration(
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
             hintText: "Password",
             prefixIcon:const Icon(Icons.password),
             suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              obscureText: true,
              
            ),
          const  SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Homepage()));
            }, child: Text("login"),),
            // TextButton(onPressed:(){}, child: Text("sign up"))
          ],
        ),
      ),
    );
  }
}