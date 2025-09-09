//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class EditPageLayoutTests: XCTestCase {
    
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

    func testEditPageLayoutPage() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary pagelayout"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: vocabularyName, vocabDescription: vocabularyDesc)

        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page Layout tab
        pages.editPage()
        pages.addPageLayout()
        
        //change the page name
        pages.changeThePageName()
        
        //change the rows and columns
        pages.changeRowsAndColumns()
        
        //check if the iOS Gallery is opening
        pages.checkTheiOSGallery()
        
        //select image
        pages.selectImageLayout()
        
        //clear image and save the section
        pages.clearImageLayout()
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Page Layout Test Finished with success!")
    }
}
