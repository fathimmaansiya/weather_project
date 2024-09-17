
import 'package:flutter/material.dart';
import 'package:weather_project/view/homepage.dart';
import 'package:weather_project/view/loginpage.dart';
import 'package:weather_project/view/validation.dart';



class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _page1State();
  
}
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var confirmController = TextEditingController();
var formKey = GlobalKey<FormState>();
bool showpassword = true;
bool confirmpass=true;

 
 class _page1State extends State<Signuppage> {
  void showicon() {
    setState(() {
      showpassword = !showpassword;
    });
  }

    void show1icon() {
    setState(() {
      confirmpass=!confirmpass;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Create your accuount"),
                TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ("invalid");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        labelText: "user name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.purple[50],
                        filled: true)),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) => Validation().emailValidator(value!),
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.purple[50],
                      filled: true),
                ),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
               validator: (value) => Validation().passwordValidator(value!),
                  obscureText: showpassword,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {
                            showicon();
                          },
                          icon: showpassword
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.purple[50],
                      filled: true),
                ),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                TextFormField(
                  controller: confirmController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ("invalid");
                    }
                    if(value!=passwordController.text){
                      return "password not match";
                    }
                    return null;
                  },
                  obscureText: confirmpass,
                  decoration: InputDecoration(
                      labelText: " confirm password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {
                            show1icon();
                          },
                          icon: confirmpass
                              ? Icon(Icons.remove_red_eye)
                              : Icon(Icons.remove_red_eye_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      fillColor: Colors.purple[50],
                      filled: true),
                ),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(450),
                        backgroundColor: Colors.purple[500]),
                    onPressed: () { 
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
                    },
                    child: Text(
                      "sign up",
                      style: TextStyle(color: Colors.white),
                    )),
                
                SizedBox(
                  width: 10,
                  height: 20,
                ),
                Text("or"),
                const SizedBox(
                  width: 10,
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromWidth(450),
                        side: BorderSide(color: Colors.purple)),
                    onPressed: () {},
                    child: Text("sign in with google")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Loginpage()));
                        },
                        child: Text("Sign In"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 