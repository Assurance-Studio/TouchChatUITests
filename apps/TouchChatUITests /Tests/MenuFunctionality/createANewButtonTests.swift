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

    func testcreateANewButtonTests() throws {
        
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        let vocabularyName = "copied vocabulary create button"
        let vocabularyDesc = "vocabulary description e2e"
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocabPC(vocabName: vocabularyName, vocabDescription: vocabularyDesc)

        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //remove an existing button
        pages.removeAnExistingButton()
        
        //create a new button
        pages.createANewButton()
        
        //check if the iOS Gallery is opening
        pages.checkTheiOSGallery()
        
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
        commonActions.checkSdbText(sdbText: "Create Button by e2e Create Button by e2e ")
        
        //change button size
        pages.changeButtonSize(buttonName: "Create Button by e2e")
        
        //remove the new button
        pages.removeTheButton(buttonName: "Create Button by e2e")
        
        commonActions.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Create Button Test Finished with success!")
    }
}
