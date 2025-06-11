//  TouchChatUITests
//
//  Created by Alin Voinescu on 02.09.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class predictionsTests: XCTestCase {

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

   func testPredictions() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let predictionsSettingsPage = PredictionsSettingsPage(app: app)
       let vocabularyName = "copied vocabulary predictions settings"
       let vocabylaryDesc = "vocabulary description e2e"
       var vocabName = "vocabulary"
       lazy var mainPage: MainPage = {
           return MainPage(app: XCUIApplication(), vocabName: vocabName)
       }()
       
       //copy a new vocab
       mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
       mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary predictions settings"], vocab: vocabularyName)
       
       //enable rename vocab option
       profilesAndEditingPage.openTheSettingsTab()
       profilesAndEditingPage.ensureAllowDeleteIsOn()
       
       //clear all predictions
       profilesAndEditingPage.openTheSettingsTab()
       predictionsSettingsPage.clearAllPredictions()
       
       //check if the prediction works
       predictionsSettingsPage.checkIfThePredictionsWorks()
       
       //delete the new prediction
       profilesAndEditingPage.openTheSettingsTab()
       predictionsSettingsPage.deleteTheNewPrediction()
       
       //add a new prediction
       predictionsSettingsPage.addANewPrediction()
       //remove the renamed prediction
       predictionsSettingsPage.deleteTheRenamedPredictions()
       
       pages.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Predictions Settings Test Finished with success!")
   }
}
