import 'package:flutter/material.dart';
import 'package:flutter_one/utils/routes.dart';

 class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   String name = "";
   bool changeButton = false;
   final _formKey = GlobalKey<FormState>();

   moveToHome(BuildContext context) async
   {
      if(_formKey.currentState!.validate()) {
        setState(() {
          changeButton = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          changeButton = false;
        });
      }
   }
   @override
   Widget build(BuildContext context) {
     return Material(
       color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 10.0,
                    //child: Text("hello"),
                  ),
                  Image.asset("assets/images/login_image.png",
                  fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10.0,
                    //child: Text("hello"),
                  ),
                  Text("Welcome $name",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurpleAccent,
                  ),
                  ),
                  SizedBox(height: 20.0,
                    //child: Text("hello"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter Username",
                            labelText: "Username",
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged:(value){
                            name = value;
                            setState(() {});    // not calling in my IDE also not detecting.
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                          ),
                          validator: (value){
                            if(value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            // else if (value!.length < 6) {
                            //   return "Password length must be atleast 6";
                            // }

                            return null;
                          },
                        ),
                        SizedBox(height: 40.0,
                          //child: Text("hello"),
                        ),
                        
                        
                        Material(
                          color: Colors.deepPurpleAccent,
                          borderRadius:
                                 BorderRadius.circular(changeButton ? 50 : 8),
                          child: InkWell(          // to use ripple effect, inkwell ancestor must be a material.

                            splashColor: Colors.deepPurple,
                            onTap: () => moveToHome(context),

                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton? 50 :150,
                              height: 50,
                              alignment: Alignment.center,
                              child: changeButton ? Icon(
                                    Icons.done,
                                    color: Colors.white,

                              ) :Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                              ),
                              ),
                              // decoration: BoxDecoration(
                              //     color: Colors.deepPurpleAccent,
                                  // shape: changeButton ?
                                  // BoxShape.circle : BoxShape.rectangle,

                                // borderRadius:
                                //       BorderRadius.circular(changeButton ? 50 : 8),
                              ),
                            ),
                          ),


                        // ElevatedButton(
                        //     onPressed: (){
                        //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                        //     },
                        //     child: Text("Login"),
                        //   style: TextButton.styleFrom(
                        //       minimumSize: Size(150, 50)
                        //   ),
                        // )

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
     );
   }
}
 