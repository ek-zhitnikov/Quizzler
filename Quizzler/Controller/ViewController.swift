//
//  ViewController.swift
//  Quizzler
//
//  Created by Кужельная Екатерина on 31.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
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
        guard let userAnswer = sender.currentTitle else {
            return
        }
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            self.updateUI()
        }
    }
    
    @objc func updateUI(){
        DispatchQueue.main.async {
            self.questionLabel.text = self.quizBrain.getQuestionText()
            self.progressBar.progress = self.quizBrain.getProgress()
            self.scoreLabel.text = "Score: \(self.quizBrain.getScore())"
            self.trueButton.backgroundColor = .clear
            self.falseButton.backgroundColor = .clear
        }
    }
    
}

