//  megaTests.swift
//  TouchChatUITests
//
//  Created by Alin V on 04.07.2025.
//  Copyright © 2025 PRC-Saltillo. All rights reserved.
//

import XCTest

final class megaTests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
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
    
    func testVocabularies() throws {
        //check aphasiaUKSS vocab
        let pages = Pages(app: app)
        pages.aphasiaVocab.tap()
        pages.aphasiaUKSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        
        pages.checkSdbText(sdbText: "Supermarket ")
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        //check aphasiaUSSS vocab
        pages.aphasiaUSSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Me", vocabElement: 10, nameElement: "Clear")
        
        app.buttons["Feelings"].tap()
        XCTAssertTrue(app.buttons["happy"].exists)
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Supermarket happy ")
        pages.backButton.tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        //check multiChat15 vocab
        pages.multiChat15Vocab.tap()
        pages.multiChatAdolescentSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        
        XCTAssertTrue(app.buttons["to drink"].exists)
        app.buttons["to drink"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Supermarket happy I want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check multiChatAdult vocab
        pages.multiChatAdultSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        
        XCTAssertTrue(app.buttons["to watch"].exists)
        app.buttons["to watch"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check multiChatStudent vocab
        pages.multiChatStudentSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "My Scenes", vocabWord: "I don't want", vocabElement: 11, nameElement: "I need")
        
        XCTAssertTrue(app.buttons["to wear"].exists)
        app.buttons["to wear"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I don't want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check myQuickChatAdult8 vocab
        pages.myQuickChatVocab.tap()
        pages.adultQuickChatVocab.tap()
        pages.quickChatAdult8SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "Emotions", vocabElement: 8, nameElement: "Break")
        
        XCTAssertTrue(app.buttons["Happy"].exists)
        app.buttons["Happy"].tap()
        
        pages.checkSdbText(sdbText: "I'm happy. ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        //check myQuickChatAdult12
        pages.quickChatAdult12SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "People", vocabElement: 11, nameElement: "Clothes")
        
        XCTAssertTrue(app.buttons["Daughter"].exists)
        app.buttons["Daughter"].tap()
        
        pages.checkSdbText(sdbText: "Daughter ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check myQuickChatChild4 vocab
        pages.childQuickChatVocab.tap()
        pages.quickChatChild4SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Greetings/Closings", vocabWord: "Playing", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        
        pages.checkSdbText(sdbText: "Can I play? ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        //check myQuickChatChild8 vocab
        pages.quickChatChild8SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Greetings/Closings", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Hey!"].exists)
        app.buttons["Hey!"].tap()
        
        pages.checkSdbText(sdbText: "Hey! ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        //check myQuickChat12 vocab
        pages.quickChatChild12SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Drinks", vocabElement: 14, nameElement: "Places")
        
        XCTAssertTrue(app.buttons["Lemonade"].exists)
        app.buttons["Lemonade"].tap()
        
        pages.checkSdbText(sdbText: "I want some lemonade. ")
        pages.backButton.tap()
    
        pages.backToVocab();
        
        //check WordPower25 vocab
        pages.wordPowerVocab.tap()
        pages.wordPower25Position.tap()
        pages.wordPower25TouchScan.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "stop", vocabWord: "I want", vocabElement: 4, nameElement: "clear")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["cookies"].tap()
        
        pages.checkSdbText(sdbText: "I want some lemonade. I want to eat cookies ")
        
        pages.backButton.tap()
        app.buttons["clear"].tap()
        pages.backToVocab();
        
        //check WordPower42Basic vocab
        pages.wordPower42Position.tap()
        pages.wordPower42BasicSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PLACES", vocabElement: 7, nameElement: "TIME")
        
        XCTAssertTrue(app.buttons["restaurant"].exists)
        app.buttons["restaurant"].tap()
        app.buttons["can"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Restaurant ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check WordPower42 vocab
        pages.wordPower42SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "go", vocabElement: 9, nameElement: "DESCRIBE")
        
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Go for a walk ")
        
        pages.backToVocab();
        
        //check wordPower48Basic vocab
        pages.wordPower48Position.tap()
        pages.wordPower48SS.tap()
        pages.openAVocab()
        app.buttons["clear"].tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Come back to ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower48 vocab
        pages.wordPower48SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Come back to ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower60Basic vocab
        pages.wordPower60Position.tap()
        pages.wordPower60BasicSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "It ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower60 vocab
        pages.wordPower60SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "out", vocabWord: "finish", vocabElement: 7, nameElement: "ACTIONS")
        
        XCTAssertTrue(app.buttons["the"].exists)
        app.buttons["the"].tap()
        app.buttons["and"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Finish ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower80 vocab
        pages.wordPower80Position.tap()
        pages.wordPower80SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "is", vocabElement: 9, nameElement: "PLACES")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["the"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Is eating ")
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower108Keyboard vocab
        pages.wordPower108Position.tap()
        pages.wordPower108SSKeyboard.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE", vocabElement: 3, nameElement: "PEOPLE")
        
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        pages.backButton.tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Mom ")
        app.buttons["clear"].tap()
    
        pages.backToVocab();
        
        //check wordPower108 vocab
        pages.wordPower108SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "GROUPS", vocabElement: 24, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["BODY"].exists)
        app.buttons["BODY"].tap()
        app.buttons["hair"].tap()
        
        pages.checkSdbText(sdbText: "Hair ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["clear"].tap()
        
        pages.backToVocab();
        
        //check wordPower140 vocab
        pages.wordPower140Position.tap()
        pages.wordPower140SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "under", vocabWord: "I...", vocabElement: 4, nameElement: "I...")
        
        XCTAssertTrue(app.buttons["I am"].exists)
        app.buttons["I am"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I am ")
        app.buttons["clear"].tap()
    
        pages.backToVocab();
        
        //check 4Basic vocab
        pages.basic4SS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I want ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check engageForiOS vocab
        pages.engageForiOS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "i", vocabWord: "2 BUTTONS", vocabElement: 3, nameElement: "PRACTICE")
        
        XCTAssertTrue(app.buttons["Feelings"].exists)
        app.buttons["Feelings"].tap()
        app.buttons["happy"].tap()
        
        pages.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check myCore vocab
        pages.myCoreSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Are ")
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check sintaxis4x4English vocab
        pages.sintaxis4x4English.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Places", vocabWord: "Body Parts", vocabElement: 3, nameElement: "Food/Drink")
        
        XCTAssertTrue(app.buttons["eyes"].exists)
        app.buttons["eyes"].tap()
        app.buttons["nose"].tap()
        
        pages.checkSdbText(sdbText: "Eyes nose ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.backButton.tap()
        
        pages.backToVocab();
        
        //check sinsintaxis4x5English vocab
        pages.sintaxis4x5English.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        
        XCTAssertTrue(app.buttons["Buy me"].exists)
        app.buttons["Buy me"].tap()
        
        pages.checkSdbText(sdbText: "Buy me ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        //check spelling vocab
        pages.spellingSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "PHRASES", vocabElement: 5, nameElement: "TEXTING")
        
        XCTAssertTrue(app.buttons["Good Morning"].exists)
        app.buttons["Good Morning"].tap()
        
        pages.checkSdbText(sdbText: "Good morning, how are you? ")
        pages.backButton.tap()
        app.buttons["CLEAR "].tap()
    
        pages.backToVocab();
        
        //check vocabPC vocab
        pages.vocabPCSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "time", vocabWord: "I feel", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["confused"].exists)
        app.buttons["confused"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "I feel ")
    
        pages.backToVocab();
        
        //check french4DeBase vocab
        pages.openDifferentLanguagePageMega(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.base4FrenchSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "TOUT SUR MOI", vocabWord: "Je veux", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["boire"].exists)
        app.buttons["boire"].tap()
        app.buttons["lait"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je veux boire du ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backToVocab();
        
        //check frenchCommunicationJourney vocab
        pages.communicationFrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        
        pages.checkSdbText(sdbText: "Comment ça va? ")
        pages.backButton.tap()
        app.buttons["Effacer"].tap()
        
        pages.backToVocab();
        
        //check frenchEpeler vocab
        pages.epelerFrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "PHRASES", vocabElement: 6, nameElement: "PHRASES")
        
        XCTAssertTrue(app.buttons["Bonjour!"].exists)
        app.buttons["Bonjour!"].tap()
        
        pages.checkSdbText(sdbText: "Bonjour, comment-allez vous? ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backToVocab();
        
        //check frenchMultiChat15 vocab
        pages.multiChat15FrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mon environnement", vocabWord: "J'ai besoin", vocabElement: 3, nameElement: "Questions ")
        
        XCTAssertTrue(app.buttons["de prendre un pause"].exists)
        app.buttons["de prendre un pause"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "J'ai besoin de prendre une ")
        app.buttons["Supprimer "].tap()
        
        pages.backToVocab();
        
        //check frenchVocabPC vocab
        pages.vocabPCFrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "temps", vocabWord: "Je suis", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["mélangé"].exists)
        app.buttons["mélangé"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je suis ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backToVocab();
        
        //check frenchWordPower60 vocab
        pages.wordPower60FrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "tout", vocabWord: "je", vocabElement: 4, nameElement: "ABC 123")
        
        XCTAssertTrue(app.buttons["donne"].exists)
        app.buttons["donne"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Je ")
        app.buttons["efface tout"].tap()
        
        pages.backToVocab();
        
        //check frenchWordPower120Azerty vocab
        pages.wordPower120Azerty.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "je", vocabElement: 4, nameElement: "QUESTNS")
        
        let adoreBtn = app.buttons["'adore"]
        let adoreBtnExists = adoreBtn.waitForExistence(timeout: 15)
        XCTAssertTrue(adoreBtnExists)
        adoreBtn.tap()
        
        pages.checkSdbText(sdbText: "J'adore ")
        app.buttons["efface tout"].tap()
        
        pages.backToVocab();
        
        //check frenchWordPower120Francais vocab
        pages.wordPower120FrancaisSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "tu", vocabElement: 4, nameElement: "QUESTNS")
        
        XCTAssertTrue(app.buttons["espères"].exists)
        app.buttons["espères"].tap()
        
        pages.checkSdbText(sdbText: "Tu espères ")
        app.buttons["efface tout"].tap()
        pages.backToVocab();
        
        //check aphasiaSpanish vocab
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.aphasiaSpanishSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Despejar", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        pages.checkSdbText(sdbText: "Estresado ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
    
        pages.backToVocab();
        
        //check AfasiaEspanol vocab
        pages.aphasiaSpanishSS.tap()
        pages.openAVocab()
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Mis Actividades", vocabElement: 3, nameElement: "Cosas")
        
        XCTAssertTrue(app.buttons["Terapia"].exists)
        app.buttons["Terapia"].tap()
        app.buttons["muy difícil"].tap()
        
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Esto es muy ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["Despejar"].tap()
        
        pages.backToVocab();
        
        //check spanishMultiChat15Bilingual
        pages.multiChat15Bilingual.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mis escenas - My Scenes", vocabWord: "Yo quiero - I want", vocabElement: 3, nameElement: "Preguntas - Questions")
        
        XCTAssertTrue(app.buttons["comer - to eat"].exists)
        app.buttons["comer - to eat"].tap()
        app.buttons["FRUTA - FRUIT"].tap()
        app.buttons["uvas - grapes"].tap()
        
        pages.checkSdbText(sdbText: "Yo quiero comer uvas ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["Despejar - Clear"].tap()
        
        pages.backToVocab();
        
        //check spanishMulti15 vocab
        pages.multiChat15Spanish.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo necesito ir a la ")
        app.buttons["Despejar"].tap()
        
        pages.backToVocab();
        
        //check spanishSinSintaxis4x4
        pages.sintaxis4x4Spanish.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "lugares", vocabWord: "casa", vocabElement: 3, nameElement: "comida")
        
        XCTAssertTrue(app.buttons["cochera"].exists)
        app.buttons["cochera"].tap()
        app.buttons["sala"].tap()
        
        pages.checkSdbText(sdbText: "Cochera sala ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        pages.backToVocab()
        
        //check spanshSinSintaxis4x5
        pages.sintaxis4x5Spanish.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: " transporte", vocabWord: "comida", vocabElement: 4, nameElement: "lugares")
        
        
        XCTAssertTrue(app.buttons["pescado"].exists)
        app.buttons["pescado"].tap()
        app.buttons["pan"].tap()
        
        pages.checkSdbText(sdbText: "Pescado pan ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        pages.backToVocab();
        
        //check spanishTeclado vocab
        pages.tecladoSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "FRASES", vocabElement: 6, nameElement: "FRASES")
        
        XCTAssertTrue(app.buttons["Hola, ¿cómo estás?"].exists)
        app.buttons["Hola, ¿cómo estás?"].tap()
        
        pages.checkSdbText(sdbText: "Hola, ¿cómo estás? ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backToVocab();
        
        //check spanishVocabPC vocab
        pages.vocabPCSpanishSS.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "tiempo", vocabWord: "quiero", vocabElement: 3, nameElement: "yo quiero")
        
        XCTAssertTrue(app.buttons["beber"].exists)
        app.buttons["beber"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Yo quiero buscar algo de ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backToVocab();
        
        //check spanishWordPower25Espanol
        pages.wordPowerEspanol25.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "jugar", vocabWord: "toma", vocabElement: 4, nameElement: "borrar")
        
        XCTAssertTrue(app.buttons["una foto"].exists)
        app.buttons["una foto"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Toma una ")
        app.buttons["borrar"].tap()
        
        pages.backToVocab();
        
        //check spanishWordPower48EspanolBasico vocab
        pages.wordPowerBasico48.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ven", vocabWord: "me", vocabElement: 5, nameElement: "GENTE")
        
        XCTAssertTrue(app.buttons["gusta"].exists)
        app.buttons["gusta"].tap()
        app.buttons["estar"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Me gusta ")
        app.buttons["borrar"].tap()
        pages.backToVocab();
        
        //check spanishWordPower48Espanol vocab
        pages.wordPowerEspanol48.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "porque", vocabWord: "comer", vocabElement: 4, nameElement: "GENTE")
        
        XCTAssertTrue(app.buttons["que"].exists)
        app.buttons["que"].tap()
        app.buttons["el"].tap()
        
        pages.checkSdbText(sdbText: "Comer que el ")
        app.buttons["borrar"].tap()
        pages.backToVocab();
        
        //check spanishWordPower60Espanol vocab
        pages.wordPowerBasico60.tap()
        pages.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ya", vocabWord: "yo", vocabElement: 7, nameElement: "ACCIONES")
        
        XCTAssertTrue(app.buttons["espero"].exists)
        app.buttons["espero"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        
        pages.checkSdbText(sdbText: "Espero ")
        app.buttons["borrar"].tap()
        pages.backToVocab();
    }
    
    func testSettings() throws{
        
        //check copied vocab - button dwell time
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        let vocabName = "vocabulary"
        let pages = Pages(app: app)
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let dataLoginPage = DataLoggingPage(app: app)

        mainPage.nameVocab(vocabName: "copied vocabulary button Dwell Time", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        //open the settings menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //change the dwell & release time
        dataLoginPage.changeDwellReleaseTime()
        
        //check if the new settings work
        dataLoginPage.checkIfTheDwellReleaseTimeWork()
        
        //reset the dwell & release time
        profilesAndEditingPage.openTheSettingsTab()
        dataLoginPage.resetDwellReleaseTime()
        
        pages.backButton.tap()
        pages.backToVocab();
        
        //check copied vocab - buttons Settings
        let buttonsSettingsPage = ButtonsSettingsPage(app: app)
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary buttons settings", vocabDescription: "vocabulary description e2e")

        //enable rename vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //edit the font size for a button
        buttonsSettingsPage.editFontSizeButton()
        
        //hide a button
        pages.hideAButton()
        
        //check if the force font size works
        profilesAndEditingPage.openTheSettingsTab()
        buttonsSettingsPage.checkTheForceFontSize()
        
        //check if the hide button appears
        buttonsSettingsPage.checkHideButtons()
        
        pages.backToVocab()
        
        //check copied vocab - acapelaVoices
        let languagesPage = LanguagesRegionPage(app: app)
        //add languages&region
        languagesPage.openLanguagesRegionSection()
        //add arabic language
        languagesPage.addLanguage(language: "Arabic")
        //add chinese language
        languagesPage.addLanguage(language: "Chinese")
        //add french (canada) language
        languagesPage.addLanguage(language: "French (Canada)")
        app.buttons["Done"].tap()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary acapela voices", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        pages.openTheSettingsTab()
        pages.ensureAllowDeleteIsOn()
        
        //check if the force font size works
        profilesAndEditingPage.openTheSettingsTab()
        
        //change the voice for English Voice
        languagesPage.changeEnglishVoice()
        
        //change the voice for Arabic Voice
        languagesPage.checkArabicVoice()
        
        //try to select another Acapela Voice
        languagesPage.trySelectAcapelaVoice()
               
        pages.backToVocab()
        
    }
    
    
}
