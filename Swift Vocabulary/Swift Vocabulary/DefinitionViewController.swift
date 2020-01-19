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
    }
    
    @IBOutlet weak var SwiftTerm: UILabel!
    @IBOutlet weak var Definition: UITextView!

}
