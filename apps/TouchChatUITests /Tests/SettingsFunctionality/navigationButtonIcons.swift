//  TouchChatUITests
//
//  Created by Alin Voinescu on 08.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class navigationButtonIcons: XCTestCase {

    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
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
    
    func testEditingTests() throws {
        
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let commonActions = CommonActions(app: app)
        
        pages.myCoreSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check the navigation button action works as expected
        profilesAndEditingPage.navigationsIcons()
       
        commonActions.backToVocab()
                
        print("Navigation Icons Test Finished with success!")
        
        app.terminate()
    }
}
