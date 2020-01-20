//
//  WordsTableViewController.swift
//  Swift Vocabulary
//
//  Created by Chris Gonzales on 1/17/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import UIKit

class WordsTableViewController: UITableViewController {

    var vocabWords: [VocabularyWord] = [(VocabularyWord(word: "String", definition: "A string is a series of characters, such as 'hello, world' or 'albatross'. Swift strings are represented by the String type. The contents of a String can be accessed in various ways, including as a collection of Character values.")), (VocabularyWord(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed."))]
 
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
        

        let alert = UIAlertController(title: "Add new term", message: nil, preferredStyle: .alert)
        self.present(alert, animated: true)
            
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: {UITextField in UITextField.placeholder = "New Term"})
            
        alert.addTextField(configurationHandler: {UITextField in UITextField.placeholder = "Definition"})
            
        func newTermAdded() {
            guard let term = alert.textFields?[0].text,
            let def = alert.textFields?[1].text else { return }
            for entry in vocabWords{
                if term == entry.word ||
                def == entry.definition{
                    
                    print("already here")
                    let errorAlert = UIAlertController(title: "Error", message: "Term or definition already in dictionary", preferredStyle: .alert)
                    errorAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
                    self.present(errorAlert, animated: true, completion: nil)
                    return
                }
            }
            self.vocabWords.append(VocabularyWord(word: term, definition: def))
            self.tableView.reloadData()
            }
           
            alert.addAction(UIAlertAction(title: "Okay",
                                         style: .default,
                                         handler: {(alert: UIAlertAction!) in newTermAdded()}))
            
    }
          
}

