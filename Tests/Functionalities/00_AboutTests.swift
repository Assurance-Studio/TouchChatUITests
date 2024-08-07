//  TouchChatUITests
//
//  Created by Alin Voinescu
//  Copyright © 2024 PRC-Saltillo. All rights reserved.
//  This test should test the "about" functionality

import XCTest

final class aboutTests: XCTestCase {
    
    var app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        
        let pages = Pages(app: app)
        
        app = XCUIApplication()
        app.launchArguments.append("--reset")
        app.launch()
        pages.clearAppCache()
        pages.resetPersistentStorage()
        pages.deleteVocabFromVocabPageIfExisting(deleteCircle: "minus.circle.fill", maxScrolls: 3, timeout: 5)
    }
    
    override func tearDownWithError() throws {
        app.terminate()
        try super.tearDownWithError()
    }

    func testAbout() throws {
        let pages = Pages(app: app)
        
        app.launch()
        pages.reachAboutScreen()
    }
}
