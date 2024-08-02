//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class createANewButtonTests: XCTestCase {
    
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

    func testcreateANewButtonTests() throws {
        
        let pages = Pages(app: app)
        pages.scrollDownUntilElementIsVisible(element: pages.spellingSS)
        let vocabularyName = "copied vocabulary create button"
        let vocabularyDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copyVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary create button"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //remove an existing button
        app.buttons.element(boundBy: 12).tap()
        XCUIApplication().popovers.scrollViews.otherElements.buttons["Remove Button From Page"].tap()
        XCTAssertTrue(app.staticTexts["Confirm Button Deletion"].exists, "The delete modal doesn't appear")
        app.buttons["Okay"].tap()
        
        //create a new button
        pages.createANewButton()
        //select image
        pages.selectImageButton()
                
        //check all the switches
        pages.checkSwitchesEditButton()
        
        //check the font options
        pages.checkTheFontOptions(fontName: "Istok Web")
    
        //check the point options
        pages.checkPointOptions(pointField: "16 Point")
        
        //check the text color options
        pages.checkTextColorOptions()
        
        //check the Body color options
        pages.checkBodyColorOptions(bodyColor: "Light Yellow")
        
        //check the border color options
        pages.checkBorderColorOptions()
        
        //check the Border Width options
        pages.checkBorderWidthOptions(borderPoint: "2 Point")
        
        //add an action for a button and check if it works
        pages.addActionButton(buttonName: "Create Button by e2e")
        
        //check the Speech Display Bar
        pages.checkSdbText(sdbText: "Create Button by e2e Create Button by e2e ")
        
        //change button size
        pages.changeButtonSize(buttonName: "Create Button by e2e")
        
        //remove the new button
        pages.removeTheButton(buttonName: "Create Button by e2e")
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create Button Test Finished with success!")
    }
}
