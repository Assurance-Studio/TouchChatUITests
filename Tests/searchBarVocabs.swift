//
//  searchBarVocabs.swift
//  TouchChatUITests
//
//  Created by Alin Voinescu on 10.10.2024.
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//

import XCTest

final class searchBarVocabs: XCTestCase {

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
    
    func testSearchBarVocabsTests() throws {
        let pages = Pages(app: app)
        
        //check if the search bar is visible
        pages.checkIfTheSearchBarExists()
        
        //check if the search bar works as expected
        pages.checkHowTheSearchBarWorks()
        
        print("Search Bar Vocabs Test Finished with success!")
        
        app.terminate()
    }
}
