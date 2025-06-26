//
//  createButtonStepByStepAppsTests.swift
//  TouchChatAppUITests
//
//  Created by Alin V on 08.04.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class createButtonStepByStepAppsTests: XCTestCase {

    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset-app-state")
        app.launch()
        pages.checkLicenseModal()
        pages.checkStartModal()
        pages.clickWelcomeX()
        pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }
    
    
    func testOpenStepByStepApplications() throws {
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let vocabularyName = "copied vocabulary open step apps"
        let vocabylaryDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary open step apps"], vocab: vocabularyName)
        
        //enable delete vocab option
<<<<<<< HEAD:Tests/ButtonActions/CreateButtonActions/createButtonStepByStepAppsTests.swift
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
=======
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.ensureAllowDeleteIsOn()
>>>>>>> ip_june2025:apps/TouchChatUITests/Tests/ButtonActions/CreateButtonActions/createButtonStepByStepAppsTests.swift
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Step By Step Apps - Animal Jigsaw")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Step by Step"].tap()
        app.staticTexts["Animal Jigsaw - Assemble 4 pieces of a picture"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        
        //create new button - Animal Maze
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Step By Step Apps - Animal Maze", actionType: "Open App", directionType: "Step by Step", appType: "Animal Maze - Find a route through the maze")
        
        //create new button - Baby Jigsaw
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Step By Step Apps - Baby Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Baby Jigsaw - Assemble 3 pieces of a picture")
        
        //create new button - Create a Series
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Step By Step Apps - Create a Series", actionType: "Open App", directionType: "Step by Step", appType: "Create a Series - Arrange items in a sequence")
        
        //create new button - Differ By Kind
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Step By Step Apps - Differ By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Kind - Find the visually odd one out")
        
        //create new button - Differ By Nature
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Step By Step Apps - Differ By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Nature - Find the logically odd one out")
        
        //create new button - Fairytale Jigsaw
        pages.removeAButton(button: 31)
        grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Step By Step Apps - Fairytale Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Fairytale Jigsaw - Assemble 9 pieces of a picture")
        
        //create new button - Fill the Matrix
        pages.removeAButton(button: 24)
        grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Step By Step Apps - Fill the MAtrix", actionType: "Open App", directionType: "Step by Step", appType: "Fill the Matrix - Place items in the correct cells")
        
        //create new button - Monster Maze
        pages.removeAButton(button: 43)
        grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Step By Step Apps - Monster Maze", actionType: "Open App", directionType: "Step by Step", appType: "Monster Maze - Find a route through the maze")
        
        //create new button - Mosaics
        pages.removeAButton(button: 44)
        grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Step By Step Apps - Mosaics", actionType: "Open App", directionType: "Step by Step", appType: "Mosaics - Arrange colorful pieces to form a mosaic")
        
        //create new button - Pair By Kind
        pages.removeAButton(button: 45)
        grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Step By Step Apps - Pair By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Kind - Match visually related items")
        
        //create new button - Pair By Nature
        pages.removeAButton(button: 46)
        grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Step By Step Apps - Pair By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Nature - Match logically related items")
        
        //create new button - Pair By Number
        pages.removeAButton(button: 47)
        grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Step By Step Apps - Pair By Number", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Number - Match quantities and numbers")
        
        //create new button - Place in Groups
        pages.removeAButton(button: 48)
        grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Step By Step Apps - Place in Groups", actionType: "Open App", directionType: "Step by Step", appType: "Place in Groups - Create groups of related items")
        
        //create new button - Same Same
        pages.removeAButton(button: 49)
        grammarActionsPage.createButtonOpenAppsAction(button: 49, navigateDirection: "Open Step By Step Apps - Same Same", actionType: "Open App", directionType: "Step by Step", appType: "Same Same - Match identical items")
        
        //create new button - Sort By Kind
        pages.removeAButton(button: 50)
        grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Step By Step Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        //create new button - Sort by Nature
        pages.removeAButton(button: 67)
        grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Step By Step Apps - Sort By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Nature - Sort logically related items")
        
        //create new button - Stack Up
        pages.removeAButton(button: 68)
        grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Step By Step Apps - Stack up", actionType: "Open App", directionType: "Step by Step", appType: "Stack Up - Stack items bottom-up to build a tower")
        
        //create new button - Vehicle Jigsaw
        pages.removeAButton(button: 70)
        grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Step By Step Apps - Vehicle Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Jigsaw - Assemble 6 pieces of a picture")
        
        //create new button - Vehicle Maze
        pages.removeAButton(button: 71)
        grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Step By Step Apps - Vehicle Maze", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Maze - Find a route through the maze")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Step By Step Apps - Animal Jigsaw"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Animal Maze")
        
        //check Differ By Kind - Find the visually odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Kind")
                                        
        //check Baby Jigsaw - Assemble 3 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Baby Jigsaw")
        
        //check Create a Series - Arrange items in a sequence App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Create a Series")
        
        //check Differ By Nature - Find the logically odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Nature")
        
        //check Fairytale Jigsaw - Assemble 9 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fairytale Jigsaw")
        
        //check Fill the Matrix - Place items in the correct cells App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fill the MAtrix")
        
        //check Monster Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Monster Maze")
        
        //check Mosaics - Arrange colorful pieces to form a mosaic App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Mosaics")
        
        //check Pair By Kind - Match visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Pair By Nature - Match logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Nature")
        
        //check Pair By Number - Match quantities and numbers App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Number")
        
        //check Place in Groups - Create groups of related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Place in Groups")
        
        //check Same Same - Match identical items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Same Same")
        
        //check Sort By Kind - Sort visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Sort By Nature - Sort logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Nature")
        
        //check Stack Up - Stack items bottom-up to build a tower App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Stack up")
        
        //check Vehicle Jigsaw - Assemble 6 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Jigsaw")
        
        //check Vehicle Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Maze")
       
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
            
        print("Create buttons for Open Step by Step Apps Test Finished with success!")
    }
}
