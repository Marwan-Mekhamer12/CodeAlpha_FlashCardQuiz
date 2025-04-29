//
//  TestView.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import UIKit

class TestView: UIViewController {
    
    @IBOutlet weak var numberOfQues: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var QuestionsLabel: UILabel!
    @IBOutlet weak var btnfirst: UIButton!
    @IBOutlet weak var btnsecond: UIButton!
    @IBOutlet weak var btnthird: UIButton!
    @IBOutlet weak var btnfourth: UIButton!
    
    @IBOutlet weak var returnbtn: UIButton!
    
    let manager = QuesManager()
    var ApiURL: String?
    var currentQuesIndex = 0
    var currentOptions = [String]()
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        btnfirst.layer.cornerRadius = 18
        btnsecond.layer.cornerRadius = 18
        btnthird.layer.cornerRadius = 18
        btnfourth.layer.cornerRadius = 18
        returnbtn.layer.cornerRadius = 18
        
        if let url = ApiURL {
            manager.fetchurl(url) { [weak self] in
                self?.quesShow()
            }
        }
        
    }
    
    @IBAction func PressedUserButtons(_ sender: UIButton) {
        guard currentQuesIndex < manager.questions.count else { return }
        
        let selectedAnswer = sender.currentTitle?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let correctAnswer = manager.questions[currentQuesIndex].correct_answer
        
        if selectedAnswer == correctAnswer {
            print("✅ Correct!")
            score += 1
        } else {
            print("❌ Wrong!")
        }
        
        // Move to next question
        currentQuesIndex += 1
        if currentQuesIndex < manager.questions.count {
            quesShow()
        } else {
            // End of quiz
            print("🏁 Quiz Completed!")
            btnfirst.isHidden = true
            btnsecond.isHidden = true
            btnthird.isHidden = true
            btnfourth.isHidden = true
            returnbtn.isHidden = false
            QuestionsLabel.text = "🎉 Your final score: \(score) out of \(manager.questions.count)"
            
        }
    }
    func quesShow() {
        if currentQuesIndex < manager.questions.count {
            let ques = manager.questions[currentQuesIndex]
            QuestionsLabel.text = ques.question.removingPercentEncoding
            
            // Mix correct and inCorrect
            var options = ques.incorrect_answers
            options.append(ques.correct_answer)
            options.shuffle() // Random options
            currentOptions = options
            
            btnfirst.setTitle(options[0].removingPercentEncoding, for: .normal)
            btnsecond.setTitle(options[1].removingPercentEncoding, for: .normal)
            btnthird.setTitle(options[2].removingPercentEncoding, for: .normal)
            btnfourth.setTitle(options[3].removingPercentEncoding, for: .normal)
            
            numberOfQues.text = "\(currentQuesIndex + 1) out of \(manager.questions.count)"
            progress.progress = Float(currentQuesIndex + 1) / Float(manager.questions.count)
        }
        
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    
}
