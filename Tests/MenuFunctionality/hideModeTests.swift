//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.


import XCTest

extension XCUIElement {
    func snapshot() -> XCUIScreenshot{
        return self.screenshot()
    }
}

final class hideModeTests: XCTestCase {
    
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

    func testhideModeTests() throws {
        
        let pages = Pages(app: app)
        let vocabularyName = "copied vocabulary hide mode"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary hide mode"], vocab: vocabularyName)

        //open the Edit Page tab
        pages.editPage()
        
        //hide a button & check if it works
        pages.hideAButton()
        
        //hide all buttons and check if it works
        pages.hideAllButtons()
        
        //show all buttons
        pages.showAllButtons()
                
        //normal mode
        pages.normalModeButtons()
                        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Hide Mode Test Finished with success!")
    }
    
}







