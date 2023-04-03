//
//  ViewController.swift
//  Quizzler
//
//  Created by Кужельная Екатерина on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        quizBrain.checkAnswer(userAnswer)
        
        if userAnswer == actualAnswer{
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo:nil, repeats: false)
    }
    
    @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
    }
    
}

