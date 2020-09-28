//
//  ViewController.swift
//  iOSBasicsFunS2
//
//  Created by Gina Sprint on 9/23/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

// MARK: - Overview of an iOS Project
// first, the folders are not folders, they are groups
// changes to the groups do not change on disk
// iOSBasicsFunS2
// - AppDelegate.swift: middleman between your app and the OS
// - SceneDelegate.swift: new in iOS13/Xcode 11... works with the AppDelegate to configure/manage scenes of your app
// - ViewController.swift: this file!! part of MVC
// - Main.storyboard: this is an archive of view objects created/edited in Interface Builder (IB)
// - Assets.xcassets: collection of assets/resources for your app (e.g. images, sounds, etc.)
// - LaunchScreen.storyboard: when the app launches there is a launch screen (AKA load screen AKA splash screen)
// - Info.plist: "property list" a dictionary storing important info about your app
// in Android, AndroidManifest.xml
// Products group
// - iOSBasicsFunS2.app: binary executable for your app

// MARK: - MVC Design Pattern
// design pattern: a reusable solution to a common software engineering problem
// mvc: model - view - controller (3 layers)
// mvc is old... used to separate state/concerns for GUI apps (graphical user interface)
// Model layer: stores and serves data to the app
// example: Quiz struct that will store and serve Qs and As
// View layer: presents and manages the state of the view (what the user sees)
// example: Main.storyboard
// Controller layer: middleman between the Model and the View
// handle events that the view fires, retrieve data from the model for the view to display, ...


class ViewController: UIViewController {
    var quizModel = QuizModel()
    
    // TODO: define a QuizModel struct
    // that is the model layer for our simple app
    
    // MARK: - Connections
    // we have some UIViews in our storyboard we built using IB
    // we need to create "connections" between our UIViews in storyboard and properties and/or methods in ViewController.swift
    // @IBOutlet tag
    @IBOutlet var questionLabel: UILabel!
    // @IBOutlet tells Xcode that this property refers to a UIView in Interface Builder
    // UILabel! is auto unwrapped optional
    // the open circle in the margin means invalid connection
    // closed circle is a valid connection
    @IBOutlet var answerLabel: UILabel!
    
    // @IBAction tag
    // when the user presses Next Question button, we want a method to execute
    // Next Question is going to fire an event
    // we want NExt Question to notify the target (ViewController) that it should execute an action (nextQuestionPressed())
    @IBAction func nextQuestionPressed(_ sender: UIButton) {
        // example of the target-action pair design pattern
        print("Hello from nextQuestionPressed()")
        showNextQuestion()
    }
    
    @IBAction func showAnswerPressed(_ sender: UIButton) {
        print("Hello from showAnswerPressed()")
        answerLabel.text = quizModel.getCurrentAnswer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("hello from viewDidLoad()")
        questionLabel.text = "HELLO from viewDidLoad()"
        
        showNextQuestion()
    }

    func showNextQuestion() {
        questionLabel.text = quizModel.getNextQuestion()
        answerLabel.text = "<Answer>"
    }
}

