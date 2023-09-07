//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    // Entender essa parte do CD1 e CD2 e como que ele tá fazendo link com a storyNumber
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()

    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let userChoice = sender.currentTitle
        let currentStory = storyBrain.stories[storyBrain.storyNumber]
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        
        if userChoice == currentStory.choice1 {
            storyBrain.storyNumber = currentStory.choice1Destination
        } else {
            storyBrain.storyNumber = currentStory.choice2Destination
        }
        updateUi()
    }
    
    func updateUi() {
        storyLabel.text = storyBrain.getStoryText()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}

