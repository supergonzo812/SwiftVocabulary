//
//  DefinitionViewController.swift
//  Swift Vocabulary
//
//  Created by Chris Gonzales on 1/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {

    var vocabWord: VocabularyWord?
    
    func updateViews(){
        if let unwrappedWord = vocabWord{
            SwiftTerm.text = unwrappedWord.word
            Definition.text = unwrappedWord.definition
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var SwiftTerm: UILabel!
    
    @IBOutlet weak var Definition: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
