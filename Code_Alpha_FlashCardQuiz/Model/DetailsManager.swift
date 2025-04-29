//
//  DetailsManager.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import Foundation


class QuesManager {
    
    var questions: [Result] = []
    
    
    func fetchurl(_ urlString: String, completion: @escaping () -> Void) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    
                }
                
                if let safedata = data {
                    self.perform(safedata)
                    DispatchQueue.main.async {
                        completion()
                    }
                    
                }
            }
            
            task.resume()
        }
        
    }
    
    
    
    func perform(_ data: Data) {
        let decoer = JSONDecoder()
        do {
            let decoderData = try decoer.decode(BrainManager.self, from: data)
            self.questions = decoderData.results
            
            // Print the first question just to check
            if let firstQuestion = questions.first {
                print("Question: \(firstQuestion.question)❓")
                print("✅Correct Answer: \(firstQuestion.correct_answer)")
                print("❌Options: \(firstQuestion.incorrect_answers)")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

