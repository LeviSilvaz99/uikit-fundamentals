//
//  StoryPromptViewController.swift
//  MyProject
//
//  Created by André Levi Oliveira Silva on 29/04/22.
//

import UIKit

class StoryPromptViewController: UIViewController {
    
    var storyPrompt: StoryPromptEntry?
    var isNewStoryPrompt = false
     
    @IBOutlet weak var storyPromptTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyPromptTextView.text = storyPrompt?.description
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt(_:)))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
        
        
    }

    @IBAction func cancelStoryPrompt(_ sender: Any) {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @IBAction func saveStoryPrompt(_ sender: Any) {
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
}

extension Notification.Name {
    static let StoryPromptSaved = Notification.Name("StoryPromptSave")
}
