//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class pageStyleOverrideTests: XCTestCase {
    
     var app = XCUIApplication()

     override func setUpWithError() throws {
         try super.setUpWithError()
         continueAfterFailure = false
         
         let pages = Pages(app: app)
         let commonActions = CommonActions(app: app)
         
         app = XCUIApplication()
         app.launchArguments.append("--reset-app-state")
         app.launch()
         commonActions.checkLicenseModal()
         commonActions.checkStartModal()
         commonActions.clickWelcomeX()
         pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testPageStyleOverrideTests() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary page style override"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)

        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //open the Page Style Override tab
        pages.openPageStyleOverride()
        
        //check the initial state/new state of the switch and tick it
        pages.checkTheToggleandSwitchIt()
        
        //choose a color and check if multiple colors exist
        pages.chooseAColorandChecktheOptions()
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Page Style Override Test Finished with success!")
    }    
}
