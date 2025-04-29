//
//  ViewController.swift
//  Code_Alpha_FlashCardQuiz
//
//  Created by Marwan Mekhamer on 28/04/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrData = [Subject]()
    var category: [Category] = [.math, .science, .sport, .history]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        arrData.append(Subject(photo: UIImage(named: "math")!))
        arrData.append(Subject(photo: UIImage(named: "science")!))
        arrData.append(Subject(photo: UIImage(named: "sport")!))
        arrData.append(Subject(photo: UIImage(named: "history")!))
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MarwanCell
        let data = arrData[indexPath.row]
        cell.setup(data.photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.4, height: self.view.frame.width * 0.4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let selectCategory = category[indexPath.item]
        
        // choose Apis
        
        var selectCategoryApi: String?
        switch indexPath.row {
        case 0:
            selectCategoryApi = "https://opentdb.com/api.php?amount=10&category=19&type=multiple" // Math
        case 1:
            selectCategoryApi = "https://opentdb.com/api.php?amount=10&category=21&type=multiple" // Sport
        case 2:
            selectCategoryApi = "https://opentdb.com/api.php?amount=10&category=17&type=multiple" // Science
        case 3:
            selectCategoryApi = "https://opentdb.com/api.php?amount=10&category=23&type=multiple" // History
        default:
            break
        }
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ready") as? ReadyView {
            vc.ApiURL = selectCategoryApi
            vc.selectCategory = selectCategory
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
   
}

struct Subject {
    let photo: UIImage
}

enum Category: String {
    case math = "math"
    case science = "science"
    case sport = "sport"
    case history = "history"
}
