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

   func testPredictions() throws {
       
       let pages = Pages(app: app)
       let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
       let predictionsSettingsPage = PredictionsSettingsPage(app: app)
       let commonActions = CommonActions(app: app)
       let vocabularyName = "copied vocabulary predictions settings"
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
       
       commonActions.backToVocab()
       mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
       
       print("Predictions Settings Test Finished with success!")
   }
}
