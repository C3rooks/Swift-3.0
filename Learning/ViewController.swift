//
//  ViewController.swift
//  Quiz
//
//  Created by Corey Crooks on 2/16/17.
//  Copyright © 2017 C3rooks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let questions = ["Favorite pet?", "Favorite color?", "Where was I born?"]
    let answer = [["dog","cat","bird"],["blue","green","red"],["Japan","USA","Canada"]]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    var points = 0
    
    //Label
    @IBOutlet weak var lbl: UILabel!
    
    //Button
    
    @IBAction func action(_ sender: AnyObject)
    {
        if(sender.tag == Int(rightAnswerPlacement))
        {
         print("Right")
            points += 1
        }
        else{
            print("WRONG!!!")
        }
        if(currentQuestion != questions.count)
        {
            newQuestion()
        }
        else{
           // performSegue(withIdentifier: "showScore", sender:self)
        }
    }
    
    
    override func viewDidAppear(_ animated:Bool)
    {
        newQuestion()
    }
    
    
    
    
    // function that displays new question
    
    func newQuestion()
    {
    lbl.text = questions[currentQuestion]
    rightAnswerPlacement = arc4random_uniform(3)+1
    var button:UIButton = UIButton()
    var x = 1
    
       for i in 1...3  {
            // create a button
            button = view.viewWithTag(i) as! UIButton
            if (i == Int(rightAnswerPlacement)){
                button.setTitle(answer[currentQuestion][0],for: .normal)
            }else{
                button.setTitle(answer[currentQuestion][x],for: .normal)
                    x = 2}

        }
          currentQuestion += 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

