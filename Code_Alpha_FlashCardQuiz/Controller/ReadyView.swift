//
//  ReadyView.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import UIKit

class ReadyView: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    var selectCategory: Category?
    var ApiURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btn.layer.cornerRadius = 14
        
        if let category = selectCategory {
            print("✅Select Category: \(category)")
        }
        
    }
    
    @IBAction func LetsGo(_ sender: UIButton) {
        if let urlString = ApiURL {
            
            if let vc = storyboard?.instantiateViewController(withIdentifier: "test") as? TestView {
                vc.modalPresentationStyle = .fullScreen
                vc.ApiURL = urlString
                present(vc, animated: true)
                
            }
        }
        
    }
    
    

}
