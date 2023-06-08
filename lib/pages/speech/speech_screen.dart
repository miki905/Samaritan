import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_samaritan/pages/medicine_Description.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechToText = SpeechToText();


  var text =
      "Hold the button and start speaking\nspeak the medication name clearly";
  var medication ;
  var isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AvatarGlow(
            endRadius: 75,
            animate: isListening,
            duration: Duration(milliseconds: 2000),
            glowColor: Theme.of(context).colorScheme.secondary,
            repeat: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            showTwoGlows: true,
            child: GestureDetector(
              onTapDown: (details) async {
                if(!isListening){
                  var available = await speechToText.initialize();
                  if(available){
                    setState(() {
                      isListening = true;
                      speechToText.listen(
                        onResult: (result){
                          setState(() {
                            text = result.recognizedWords;
                          });;
                        }
                      );
                    });
                  }
                }
              },
              onTapUp: (details){
                setState(() {
                  isListening = false;
                });
                speechToText.stop();
              },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 35,
                child: Icon(isListening ? Icons.mic : Icons.mic_none, color: Theme.of(context).colorScheme.tertiary,),
              ),
            ),
          ),
           GestureDetector(
             onTap: (){
               Navigator.of(context).push(PageTransition(
                   child: MedicineDescription(
                     medName: text,
                   ),
                   type: PageTransitionType.bottomToTop));
             },
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                radius: 35,
                child: Icon(Icons.done, color: Theme.of(context).colorScheme.tertiary,),
              ),
            ),
        ],
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary, //change your color here
        ),
        // iconTheme: ,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          "speak to search",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.7,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          margin: EdgeInsets.only(bottom: 150),
          child: Text(

            text,
            style: TextStyle(
              fontSize: 20,
              color: isListening ? Theme.of(context).colorScheme.secondary: Theme.of(context).colorScheme.tertiary,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
