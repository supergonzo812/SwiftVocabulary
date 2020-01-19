//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Chris Gonzales on 1/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = [(VocabularyWord(word: "Word 1", definition: "Definition 1")), (VocabularyWord(word: "Word 2", definition: "Defintion 2"))]
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return vocabWords.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        let text = vocabWords[indexPath.row]
        cell.textLabel?.text = text.word
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDefinitionSegue"{
            if let indexPath = tableView.indexPathForSelectedRow, let definitionVC = segue.destination as? DefinitionViewController{
                let term = vocabWords[indexPath.row]
                definitionVC.vocabWord = term
            }
        }
    }
    
    
 
        @IBAction func AddTerm(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Add a new term", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: {UITextField in UITextField.placeholder = "New Term"})
            self.present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "Add Term", style: .default, handler: {
            action in
            if let newTerm = alert.textFields?.first?.text{
                for term in self.vocabWords{
                    guard newTerm == term.word else{
                        let errorAlert = UIAlertController(title: "Error", message: "Term already in dictionary", preferredStyle: UIAlertController.Style.alert)
                        errorAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        
                        for _ in newTerm{
                        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                        alert.addTextField(configurationHandler: {UITextField in UITextField.placeholder = "Definition"})
                        self.present(alert, animated: true)
                        alert.addAction(UIAlertAction(title: "Add Definition", style: .default, handler: {
                            
                            action in
                            if var newDefintion = alert.textFields?.first?.text{
                                for term in self.vocabWords{
                                    newDefintion = term.definition
                                    return
                                }
                                }
                                }
                            )
                            )
                                
                        }
                            
                            
                        return
                        self.vocabWords.append(VocabularyWord(word: "\(newTerm)", definition: "\(term.definition)"))
                            }
                }}}))
    
}
}
