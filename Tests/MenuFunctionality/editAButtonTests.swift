//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.

import XCTest

final class editAButtonTests: XCTestCase {
    
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

    func testeditAButtonTests() throws {
        
        let pages = Pages(app: app)
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
        
        //check if the iOS Gallery is opening
        pages.checkTheiOSGallery()
        
        //select image
        pages.selectImageButton()
                
        //check all the switches
        pages.checkSwitchesEditButton()
        
        //check the font options
        pages.checkTheFontOptions(fontName: "Ubuntu")
        
        //check the point options
        pages.checkPointOptions(pointField: "12 Point")
         
        //check the text color options
        pages.checkTextColorOptions()
        
        //check the Body color options
        pages.checkBodyColorOptions(bodyColor: "#ffff99")
        
        //check the border color options
        pages.checkBorderColorOptions()
        
        //check the Border Width options
        pages.checkBorderWidthOptions(borderPoint: "1 Point")
        
        //add an action for a button and check if it works
        pages.addActionButton(buttonName: "Edit Button by e2e")
        
        //check the Speech Display Bar
        pages.checkSdbText(sdbText: "Edit Button by e2e ")
        
        //change button size
        pages.changeButtonSize(buttonName: "Edit Button by e2e")
        
        //remove the new button
        pages.removeTheButton(buttonName: "Edit Button by e2e")
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Button Test Finished with success!")
    }
}
