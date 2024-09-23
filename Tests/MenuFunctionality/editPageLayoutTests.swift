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
         
         app = XCUIApplication()
         app.launchArguments.append("--reset-app-state")
         app.launch()
         pages.clickWelcomeX()
         pages.reachMenuPageIfOnVocabPage()
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testEditPageLayoutPage() throws {
        
        let pages = Pages(app: app)
        let vocabularyName = "copied vocabulary pagelayout"
        let vocabylaryDesc = "vocabulary description e2e"
        var vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.copySpellingVocab(vocabName: vocabularyName, vocabDescription: vocabylaryDesc)
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary pagelayout"], vocab: vocabularyName)

        //open the Edit Page Layout tab
        pages.editPage()
        pages.addPageLayout()
        
        //change the page name
        pages.changeThePageName()
        
        //change the rows and columns
        pages.changeRowsAndColumns()
        
        //import image from library
        
//        let app = XCUIApplication()
//        let elementsQuery = app.popovers.scrollViews.otherElements
//        elementsQuery.buttons["Import Image"].tap()
//        elementsQuery.buttons["Image Library"].tap()
//        //app/*@START_MENU_TOKEN@*/.scrollViews.otherElements.images["Photo, 02 September, 15:30"]/*[[".otherElements[\"Photos\"].scrollViews.otherElements",".otherElements[\"Photo, 03 September, 16:42, Photo, 03 September, 16:39, Photo, 03 September, 14:07, Photo, 03 September, 12:58, Photo, 03 September, 12:43, Photo, 03 September, 12:29, Photo, 03 September, 12:28, Photo, 03 September, 12:21, Photo, 03 September, 12:15, Photo, 03 September, 12:14, Photo, 03 September, 09:58, Photo, 02 September, 16:54, Photo, 02 September, 16:47, Photo, 02 September, 16:36, Photo, 02 September, 16:34, Photo, 02 September, 16:32, Photo, 02 September, 16:22, Photo, 02 September, 16:18, Photo, 02 September, 16:16, Photo, 02 September, 15:37, Photo, 02 September, 15:30\"].images[\"Photo, 02 September, 15:30\"]",".images[\"Photo, 02 September, 15:30\"]",".scrollViews.otherElements"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//        app.scrollViews.otherElements.images["Photo, 02 September, 16:47"].tap()
//        app.buttons["Use"].tap()
        
        //select image
        pages.selectImageLayout()
        
        //clear image and save the section
        pages.clearImageLayout()
        
        pages.backToVocab()
        mainPage.deleteVocabFromMainPage(vocabDesc: vocabularyName)
        
        print("Edit Page Layout Test Finished with success!")
    }
}
