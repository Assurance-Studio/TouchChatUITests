import XCTest

final class CreateButtonStepByStepAppsTestsRefactored: BaseTest {
    
    func testOpenStepByStepApplications() throws {
        // MARK: - Given (Setup)
        // BaseTest handles all setup automatically
        let vocabularyName = "Create Button Step By Step Apps Vocabulary"
        let vocabularyDesc = "Vocabulary Description by e2e"
        
        // MARK: - When (Test Actions)
        // Copy a new vocabulary
        pages.mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        pages.mainPage.openVocab(vocab: vocabularyName)
        
        // Enable delete vocabulary option
        pages.common.openTheSettingsTab()
        pages.settingsPage.ensureAllowDeleteIsOn()
        
        // MARK: - Test 1: Animal Jigsaw
        pages.editPage.editPage()
        pages.buttonActionsPage.removeAButton(button: 25)
        pages.buttonActionsPage.createButtonForActions(button: 25, nameButton: "Open Step By Step Apps - Animal Jigsaw")
        
        // Remove the speech message action
        pages.actionsPage.removeSpeechMessageAction()
        
        // Add no animation action
        pages.actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Step by Step"].tap()
        app.staticTexts["Animal Jigsaw - Assemble 4 pieces of a picture"].tap()
        pages.waitPage.waitShort()
        app.buttons["Save"].tap()
        
        // MARK: - Test 2-20: Various Step By Step Apps
        // Animal Maze
        pages.buttonActionsPage.removeAButton(button: 26)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Step By Step Apps - Animal Maze", actionType: "Open App", directionType: "Step by Step", appType: "Animal Maze - Find a route through the maze")
        
        // Baby Jigsaw
        pages.buttonActionsPage.removeAButton(button: 27)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Step By Step Apps - Baby Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Baby Jigsaw - Assemble 3 pieces of a picture")
        
        // Create a Series
        pages.buttonActionsPage.removeAButton(button: 28)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Step By Step Apps - Create a Series", actionType: "Open App", directionType: "Step by Step", appType: "Create a Series - Arrange items in a sequence")
        
        // Differ By Kind
        pages.buttonActionsPage.removeAButton(button: 29)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Step By Step Apps - Differ By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Kind - Find the visually odd one out")
        
        // Differ By Nature
        pages.buttonActionsPage.removeAButton(button: 30)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Step By Step Apps - Differ By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Nature - Find the logically odd one out")
        
        // Fairytale Jigsaw
        pages.buttonActionsPage.removeAButton(button: 31)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Step By Step Apps - Fairytale Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Fairytale Jigsaw - Assemble 9 pieces of a picture")
        
        // Fill the Matrix
        pages.buttonActionsPage.removeAButton(button: 24)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Step By Step Apps - Fill the MAtrix", actionType: "Open App", directionType: "Step by Step", appType: "Fill the Matrix - Place items in the correct cells")
        
        // Monster Maze
        pages.buttonActionsPage.removeAButton(button: 43)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Step By Step Apps - Monster Maze", actionType: "Open App", directionType: "Step by Step", appType: "Monster Maze - Find a route through the maze")
        
        // Mosaics
        pages.buttonActionsPage.removeAButton(button: 44)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Step By Step Apps - Mosaics", actionType: "Open App", directionType: "Step by Step", appType: "Mosaics - Arrange colorful pieces to form a mosaic")
        
        // Pair By Kind
        pages.buttonActionsPage.removeAButton(button: 45)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Step By Step Apps - Pair By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Kind - Match visually related items")
        
        // Pair By Nature
        pages.buttonActionsPage.removeAButton(button: 46)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Step By Step Apps - Pair By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Nature - Match logically related items")
        
        // Pair By Number
        pages.buttonActionsPage.removeAButton(button: 47)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Step By Step Apps - Pair By Number", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Number - Match quantities and numbers")
        
        // Place in Groups
        pages.buttonActionsPage.removeAButton(button: 48)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Step By Step Apps - Place in Groups", actionType: "Open App", directionType: "Step by Step", appType: "Place in Groups - Create groups of related items")
        
        // Same Same
        pages.buttonActionsPage.removeAButton(button: 49)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 49, navigateDirection: "Open Step By Step Apps - Same Same", actionType: "Open App", directionType: "Step by Step", appType: "Same Same - Match identical items")
        
        // Sort By Kind
        pages.buttonActionsPage.removeAButton(button: 50)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Step By Step Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        // Sort by Nature
        pages.buttonActionsPage.removeAButton(button: 67)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Step By Step Apps - Sort By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Nature - Sort logically related items")
        
        // Stack Up
        pages.buttonActionsPage.removeAButton(button: 68)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Step By Step Apps - Stack up", actionType: "Open App", directionType: "Step by Step", appType: "Stack Up - Stack items bottom-up to build a tower")
        
        // Vehicle Jigsaw
        pages.buttonActionsPage.removeAButton(button: 70)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Step By Step Apps - Vehicle Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Jigsaw - Assemble 6 pieces of a picture")
        
        // Vehicle Maze
        pages.buttonActionsPage.removeAButton(button: 71)
        pages.grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Step By Step Apps - Vehicle Maze", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Maze - Find a route through the maze")
        
        // MARK: - Verification Tests
        // Check Animal Jigsaw app
        app.buttons["Done"].tap()
        app.buttons["Open Step By Step Apps - Animal Jigsaw"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        // Check various apps
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Animal Maze")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Kind")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Baby Jigsaw")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Create a Series")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Nature")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fairytale Jigsaw")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fill the MAtrix")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Monster Maze")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Mosaics")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Nature")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Number")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Place in Groups")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Same Same")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Nature")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Stack up")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Jigsaw")
        pages.grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Maze")
        
        // MARK: - Cleanup
        pages.common.backToVocab()
        pages.mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create buttons for Open Step by Step Apps Test Finished Successfully!")
    }
} 