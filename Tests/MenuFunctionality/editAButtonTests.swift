//  TouchChatUITests
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class buttonFunctionalitiesTests: XCTestCase {
    
    
     var app = XCUIApplication()

     override func setUpWithError() throws {
         try super.setUpWithError()
         continueAfterFailure = false
         
         let pages = Pages(app: app)
         
         app = XCUIApplication()
         app.launchArguments.append("--reset")
         app.launch()
         pages.clearAppCache()
         pages.resetPersistentStorage()
         pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testButtonFunctionalitiesTests() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary edit button"
        let vocabularyDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copyVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary edit button"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //open the Edit This button tab and fill in the button label&pronunciation
        pages.editThisButton()
        
        //select image
        pages.selectImageButton()
                
        //check all the switches
        pages.checkSwitchesEditButton()
        
        //check the font options
        pages.checkTheFontOptions()
        
        //check the point options
        pages.checkPointOptions()
         
        //check the text color options
        pages.checkTextColorOptions()
        
        //check the Body color options
        pages.checkBodyColorOptions()
        
        //check the border color options
        pages.checkBorderColorOptions()
        
        //check the Border Width options
        pages.checkBorderWidthOptions()
        
        //add an action for a button and check if it works
        pages.addActionButton()
        
        //check the Speech Display Bar
        pages.checkSdbText(sdbText: "Edit Button by e2e ")
        
        //change button size
        pages.changeButtonSize()
        
        //remove the new button
        pages.removeTheButton()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Button Test Finished with success!")
    }
    
}








