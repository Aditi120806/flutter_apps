import "package:flutter/material.dart";



void main() {
  runApp(const Myapp());
}
 class Myapp extends StatelessWidget{
  const Myapp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizapp(),
    ) ;
  }

 }
 class Quizapp extends StatefulWidget{
    const Quizapp ({super.key});

  @override
  State createState() =>_Quizappstate();
}
 class _Quizappstate extends State{
   
    List<Map> allquestions=[
    {
      "question" :"what is the national animal of india?",
     
      "options":[
        "Tiger","Lion","Leopard","Rabbit"
      ],
       "answer":0,
    },
    {
      "question" :"what is the national bird of india?",
      "options":[
        "Sparrow","Parrot","Peacock","Humming bird"
      ],
       "answer":2,

    },
    {
      "question" :"what is the national flower of india?",
     
      "options":[
        "Rose","Lotus","Jasmine","Marigold"
      ],
       "answer":1,
    },
    {
      "question" :"what is the national river of india?",
      
      "options":[
        "Yamuna","Saraswati","Narmada","Ganga"
      ],
      "answer":3,
   }  ];
  int  currentquestionindex=0;
  int selectedanswerindex=-1;
  int score=0;
  
    
    WidgetStateProperty <Color?> checkanswer (int answerindex)
    {
     if(selectedanswerindex!=-1)
     { if(answerindex==allquestions[currentquestionindex]["answer"])
     {
      return const  WidgetStatePropertyAll(Colors.green);
     } else if(selectedanswerindex==answerindex)
     {
      return const  WidgetStatePropertyAll( Colors.red);
     }
     else{
       return const  WidgetStatePropertyAll( null);
     }
     }
     else{
     return const WidgetStatePropertyAll (null);
     }
    }
    bool isquestionpage =true;

  
 
  @override
  Widget build (BuildContext context)
  {
    if (isquestionpage==true){
      return Scaffold(
      appBar: AppBar (
        title: const Text("Quiz App",
        style:  TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w900,
          
      ),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
     ),
     body:  Column(
      children: [
       const  SizedBox(
          height: 30,
        ),
        Row(
          
          children: [
           const  SizedBox(
              width: 150,
            ),
            Text("question : ${currentquestionindex +1}/${allquestions.length}",
            style: const TextStyle(
              fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black
            ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 380,
          height: 50,
          child: Text(
            allquestions[currentquestionindex]["question"],
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.purple
            ),

          ),

        ),
        const SizedBox(
          height:30 ,
        ),
        SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
          style: ButtonStyle ( 
          backgroundColor : checkanswer(0)
          ),
          onPressed: () {
             if (selectedanswerindex==-1){
                selectedanswerindex=0;
                setState(() {});
            }
            if(selectedanswerindex==allquestions[currentquestionindex]["answer"])
            {
            score++;
            setState(() { });
            }},
          child: 
          Text(allquestions[currentquestionindex]['options'][0],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            ),
            ),
          ),
        ),
         const SizedBox(
          height: 50,
        ),
         SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:  checkanswer(1)),
            onPressed: () {
              if (selectedanswerindex==-1){
                selectedanswerindex=1;
                setState(() {});
              }
              if(selectedanswerindex==allquestions[currentquestionindex]["answer"])
             {
            score++;
            setState(() { });
             }
            }
            ,
          child: 
          Text(allquestions[currentquestionindex]['options'][1],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
         SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
         style: ButtonStyle(
           backgroundColor:  checkanswer(2)),
            onPressed: () {
               if (selectedanswerindex==-1){
                selectedanswerindex=2;
                setState(() {});
            }
            if(selectedanswerindex==allquestions[currentquestionindex]["answer"])
          {
            score++;
            setState(() { });
          }},
           child: 
          Text(allquestions[currentquestionindex]['options'][2],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            ),
            ),
          
          ),
        ),
         const SizedBox(
          height: 50,
        ),
         SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton(
          style: ButtonStyle (
             backgroundColor: checkanswer(3),
          ),
            onPressed: () {
               if (selectedanswerindex==-1){
                selectedanswerindex=3;
                setState(() {});
            }
            if(selectedanswerindex==allquestions[currentquestionindex]["answer"])
          {
            score++;
            setState(() { });
          }},
           child: 
          Text(allquestions[currentquestionindex]['options'][3],
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            ),
            ),
          ),
        )
      ],
      ),
       floatingActionButton : FloatingActionButton(
        onPressed : () {
          if (currentquestionindex < allquestions.length-1)
          {
            currentquestionindex++;
            selectedanswerindex=-1;
            setState(() {});
          }
          else{
            isquestionpage=false;
          }
          if (currentquestionindex==allquestions.length-1)
          {
            isquestionpage==false;
            setState(() {});
          }
          
        },
        backgroundColor: Colors.blue,
        child: const Icon(
        Icons.forward,
        color: Colors.white,
        ),
       ),
       );
      
  }
  else {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Result page",
        style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
        centerTitle: true,
        backgroundColor: Colors.purple,
        

      ),
      body: Center (
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3ymhR2jpS8woPYTaZnQ3qRuHfhC_mAga1nQ&s",
        height: 200,),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
         
          child: Text("score : $score/${allquestions.length}",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            
          ),),
         ),
           const SizedBox(
          height: 10,
        ),
         const SizedBox(
          height:50,
          
          child: Text("congratulations!!! You have successfully completed the quiz...",
          style: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.pink,
          fontSize: 30,
          ),),
         ),
          SizedBox(
          height: 50,
          width: 350,
          child: ElevatedButton (
          style:const  ButtonStyle (
             backgroundColor:WidgetStatePropertyAll(Colors.grey)
          ),
            onPressed: () {
              isquestionpage=true;
              setState(() {});
            },
            child: const Text("Retest",
            style: TextStyle(fontWeight: FontWeight.w300
            ),
            ),
           
          ),
        )

      ],
      ),
      )
    );
  }
  }
  }
 
 

