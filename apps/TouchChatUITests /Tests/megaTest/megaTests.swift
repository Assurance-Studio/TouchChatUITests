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
    
    func testVocabularies() throws {
        //check aphasiaUKSS vocab
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        pages.aphasiaVocab.tap()
        pages.aphasiaUKSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Places", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Shopping"].tap()
        XCTAssertTrue(app.buttons["supermarket "].exists)
        app.buttons["supermarket "].tap()
        
        commonActions.checkSdbText(sdbText: "Supermarket ")
        pages.backButton.tap()
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check aphasiaUSSS vocab
        pages.aphasiaUSSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Scales", vocabWord: "Me", vocabElement: 10, nameElement: "Clear")
        
        app.buttons["Feelings"].tap()
        XCTAssertTrue(app.buttons["happy"].exists)
        app.buttons["happy"].tap()
        
        commonActions.checkSdbText(sdbText: "Supermarket happy ")
        pages.backButton.tap()
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check multiChat15 vocab
        pages.multiChat15Vocab.tap()
        pages.multiChatAdolescentSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        
        XCTAssertTrue(app.buttons["to drink"].exists)
        app.buttons["to drink"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Supermarket happy I want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check multiChatAdult vocab
        pages.multiChatAdultSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Shopping", vocabWord: "I want", vocabElement: 10, nameElement: "I don't want")
        
        XCTAssertTrue(app.buttons["to watch"].exists)
        app.buttons["to watch"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check multiChatStudent vocab
        pages.multiChatStudentSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "My Scenes", vocabWord: "I don't want", vocabElement: 11, nameElement: "I need")
        
        XCTAssertTrue(app.buttons["to wear"].exists)
        app.buttons["to wear"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I don't want ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check myQuickChatAdult8 vocab
        pages.myQuickChatVocab.tap()
        pages.adultQuickChatVocab.tap()
        pages.quickChatAdult8SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "Emotions", vocabElement: 8, nameElement: "Break")
        
        XCTAssertTrue(app.buttons["Happy"].exists)
        app.buttons["Happy"].tap()
        
        commonActions.checkSdbText(sdbText: "I'm happy. ")
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check myQuickChatAdult12
        pages.quickChatAdult12SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Interact", vocabWord: "People", vocabElement: 11, nameElement: "Clothes")
        
        XCTAssertTrue(app.buttons["Daughter"].exists)
        app.buttons["Daughter"].tap()
        
        commonActions.checkSdbText(sdbText: "Daughter ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check myQuickChatChild4 vocab
        pages.childQuickChatVocab.tap()
        pages.quickChatChild4SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Greetings/Closings", vocabWord: "Playing", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Can I play?"].exists)
        app.buttons["Can I play?"].tap()
        
        commonActions.checkSdbText(sdbText: "Can I play? ")
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check myQuickChatChild8 vocab
        pages.quickChatChild8SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Greetings/Closings", vocabElement: 18, nameElement: "Greetings/Closings")
        
        XCTAssertTrue(app.buttons["Hey!"].exists)
        app.buttons["Hey!"].tap()
        
        commonActions.checkSdbText(sdbText: "Hey! ")
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check myQuickChat12 vocab
        pages.quickChatChild12SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Playing", vocabWord: "Drinks", vocabElement: 14, nameElement: "Places")
        
        XCTAssertTrue(app.buttons["Lemonade"].exists)
        app.buttons["Lemonade"].tap()
        
        commonActions.checkSdbText(sdbText: "I want some lemonade. ")
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check WordPower25 vocab
        pages.wordPowerVocab.tap()
        pages.wordPower25Position.tap()
        pages.wordPower25TouchScan.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "stop", vocabWord: "I want", vocabElement: 4, nameElement: "clear")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["cookies"].tap()
        
        commonActions.checkSdbText(sdbText: "I want some lemonade. I want to eat cookies ")
        
        pages.backButton.tap()
        app.buttons["clear"].tap()
        commonActions.backToVocab();
        
        //check WordPower42Basic vocab
        pages.wordPower42Position.tap()
        pages.wordPower42BasicSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PLACES", vocabElement: 7, nameElement: "TIME")
        
        XCTAssertTrue(app.buttons["restaurant"].exists)
        app.buttons["restaurant"].tap()
        app.buttons["can"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Restaurant ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check WordPower42 vocab
        pages.wordPower42SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "go", vocabElement: 9, nameElement: "DESCRIBE")
        
        XCTAssertTrue(app.buttons["for a walk"].exists)
        app.buttons["for a walk"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Go for a walk ")
        
        commonActions.backToVocab();
        
        //check wordPower48Basic vocab
        pages.wordPower48Position.tap()
        pages.wordPower48SS.tap()
        commonActions.openAVocab()
        app.buttons["clear"].tap()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Come back to ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower48 vocab
        pages.wordPower48SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "come", vocabElement: 9, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["back"].exists)
        app.buttons["back"].tap()
        app.buttons["to"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Come back to ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower60Basic vocab
        pages.wordPower60Position.tap()
        pages.wordPower60BasicSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "it", vocabElement: 9, nameElement: "SOCIAL")
        
        XCTAssertTrue(app.buttons["help"].exists)
        app.buttons["help"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "It ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower60 vocab
        pages.wordPower60SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "out", vocabWord: "finish", vocabElement: 7, nameElement: "ACTIONS")
        
        XCTAssertTrue(app.buttons["the"].exists)
        app.buttons["the"].tap()
        app.buttons["and"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Finish ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower80 vocab
        pages.wordPower80Position.tap()
        pages.wordPower80SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "is", vocabElement: 9, nameElement: "PLACES")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["the"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Is eating ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower108Keyboard vocab
        pages.wordPower108Position.tap()
        pages.wordPower108SSKeyboard.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "PEOPLE", vocabElement: 3, nameElement: "PEOPLE")
        
        XCTAssertTrue(app.buttons["mom"].exists)
        app.buttons["mom"].tap()
        app.buttons["T"].tap()
        app.buttons["E"].tap()
        app.buttons["S"].tap()
        pages.backButton.tap()
        app.buttons["more"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Mom ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower108 vocab
        pages.wordPower108SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "clear", vocabWord: "GROUPS", vocabElement: 24, nameElement: "GROUPS")
        
        XCTAssertTrue(app.buttons["BODY"].exists)
        app.buttons["BODY"].tap()
        app.buttons["hair"].tap()
        
        commonActions.checkSdbText(sdbText: "Hair ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check wordPower140 vocab
        pages.wordPower140Position.tap()
        pages.wordPower140SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "under", vocabWord: "I...", vocabElement: 4, nameElement: "I...")
        
        XCTAssertTrue(app.buttons["I am"].exists)
        app.buttons["I am"].tap()
        app.buttons["me"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I am ")
        app.buttons["clear"].tap()
        
        commonActions.backToVocab();
        
        //check 4Basic vocab
        pages.basic4SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["to eat"].exists)
        app.buttons["to eat"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I want ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check engageForiOS vocab
        pages.engageForiOS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "i", vocabWord: "2 BUTTONS", vocabElement: 3, nameElement: "PRACTICE")
        
        XCTAssertTrue(app.buttons["Feelings"].exists)
        app.buttons["Feelings"].tap()
        app.buttons["happy"].tap()
        
        commonActions.checkSdbText(sdbText: "Happy ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check myCore vocab
        pages.myCoreSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        XCTAssertTrue(app.buttons["eating"].exists)
        app.buttons["eating"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Are ")
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check sintaxis4x4English vocab
        pages.sintaxis4x4English.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Places", vocabWord: "Body Parts", vocabElement: 3, nameElement: "Food/Drink")
        
        XCTAssertTrue(app.buttons["eyes"].exists)
        app.buttons["eyes"].tap()
        app.buttons["nose"].tap()
        
        commonActions.checkSdbText(sdbText: "Eyes nose ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check sinsintaxis4x5English vocab
        pages.sintaxis4x5English.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        
        XCTAssertTrue(app.buttons["Buy me"].exists)
        app.buttons["Buy me"].tap()
        
        commonActions.checkSdbText(sdbText: "Buy me ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check spelling vocab
        pages.spellingSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "BACKSPACE", vocabWord: "PHRASES", vocabElement: 5, nameElement: "TEXTING")
        
        XCTAssertTrue(app.buttons["Good Morning"].exists)
        app.buttons["Good Morning"].tap()
        
        commonActions.checkSdbText(sdbText: "Good morning, how are you? ")
        pages.backButton.tap()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab();
        
        //check vocabPC vocab
        pages.vocabPCSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "time", vocabWord: "I feel", vocabElement: 3, nameElement: "I want")
        
        XCTAssertTrue(app.buttons["confused"].exists)
        app.buttons["confused"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "I feel ")
        
        commonActions.backToVocab();
        
        //check french4DeBase vocab
        pages.openDifferentLanguagePageMega(languageVocab: "French (Canada)")
        pages.scrollDownUntilElementIsVisible(element: pages.frenchVocab)
        pages.frenchVocab.tap()
        pages.base4FrenchSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "TOUT SUR MOI", vocabWord: "Je veux", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["boire"].exists)
        app.buttons["boire"].tap()
        app.buttons["lait"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Je veux boire du ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check frenchCommunicationJourney vocab
        pages.communicationFrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Échelles", vocabWord: "Social", vocabElement: 3, nameElement: "Objets")
        
        XCTAssertTrue(app.buttons["Comment ça va?"].exists)
        app.buttons["Comment ça va?"].tap()
        
        commonActions.checkSdbText(sdbText: "Comment ça va? ")
        pages.backButton.tap()
        app.buttons["Effacer"].tap()
        
        commonActions.backToVocab();
        
        //check frenchEpeler vocab
        pages.epelerFrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "PHRASES", vocabElement: 6, nameElement: "PHRASES")
        
        XCTAssertTrue(app.buttons["Bonjour!"].exists)
        app.buttons["Bonjour!"].tap()
        
        commonActions.checkSdbText(sdbText: "Bonjour, comment-allez vous? ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check frenchMultiChat15 vocab
        pages.multiChat15FrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mon environnement", vocabWord: "J'ai besoin", vocabElement: 3, nameElement: "Questions ")
        
        XCTAssertTrue(app.buttons["de prendre un pause"].exists)
        app.buttons["de prendre un pause"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "J'ai besoin de prendre une ")
        app.buttons["Supprimer "].tap()
        
        commonActions.backToVocab();
        
        //check frenchVocabPC vocab
        pages.vocabPCFrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "temps", vocabWord: "Je suis", vocabElement: 3, nameElement: "Je veux")
        
        XCTAssertTrue(app.buttons["mélangé"].exists)
        app.buttons["mélangé"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Je suis ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check frenchWordPower60 vocab
        pages.wordPower60FrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "tout", vocabWord: "je", vocabElement: 4, nameElement: "ABC 123")
        
        XCTAssertTrue(app.buttons["donne"].exists)
        app.buttons["donne"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Je ")
        app.buttons["efface tout"].tap()
        
        commonActions.backToVocab();
        
        //check frenchWordPower120Azerty vocab
        pages.wordPower120Azerty.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "je", vocabElement: 4, nameElement: "QUESTNS")
        
        let adoreBtn = app.buttons["'adore"]
        let adoreBtnExists = adoreBtn.waitForExistence(timeout: 15)
        XCTAssertTrue(adoreBtnExists)
        adoreBtn.tap()
        
        commonActions.checkSdbText(sdbText: "J'adore ")
        app.buttons["efface tout"].tap()
        
        commonActions.backToVocab();
        
        //check frenchWordPower120Francais vocab
        pages.wordPower120FrancaisSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "efface tout", vocabWord: "tu", vocabElement: 4, nameElement: "QUESTNS")
        
        XCTAssertTrue(app.buttons["espères"].exists)
        app.buttons["espères"].tap()
        
        commonActions.checkSdbText(sdbText: "Tu espères ")
        app.buttons["efface tout"].tap()
        commonActions.backToVocab();
        
        //check aphasiaSpanish vocab
        pages.openDifferentLanguagePage(languageVocab: "Spanish (United States)")
        pages.scrollDownUntilElementIsVisible(element: pages.SpanishVocab)
        pages.SpanishVocab.tap()
        pages.aphasiaSpanishSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Despejar", vocabElement: 7, nameElement: "Social")
        
        app.buttons["Yo"].tap()
        app.buttons["Emociones (hombre)"].tap()
        XCTAssertTrue(app.buttons["estresado"].exists)
        app.buttons["estresado"].tap()
        
        commonActions.checkSdbText(sdbText: "Estresado ")
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check AfasiaEspanol vocab
        pages.aphasiaSpanishSS.tap()
        commonActions.openAVocab()
        pages.verifyTheVocab(lastElement: "Escalas", vocabWord: "Mis Actividades", vocabElement: 3, nameElement: "Cosas")
        
        XCTAssertTrue(app.buttons["Terapia"].exists)
        app.buttons["Terapia"].tap()
        app.buttons["muy difícil"].tap()
        
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Esto es muy ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["Despejar"].tap()
        
        commonActions.backToVocab();
        
        //check spanishMultiChat15Bilingual
        pages.multiChat15Bilingual.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mis escenas - My Scenes", vocabWord: "Yo quiero - I want", vocabElement: 3, nameElement: "Preguntas - Questions")
        
        XCTAssertTrue(app.buttons["comer - to eat"].exists)
        app.buttons["comer - to eat"].tap()
        app.buttons["FRUTA - FRUIT"].tap()
        app.buttons["uvas - grapes"].tap()
        
        commonActions.checkSdbText(sdbText: "Yo quiero comer uvas ")
        
        pages.backButton.tap()
        pages.backButton.tap()
        pages.backButton.tap()
        app.buttons["Despejar - Clear"].tap()
        
        commonActions.backToVocab();
        
        //check spanishMulti15 vocab
        pages.multiChat15Spanish.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "Mis escenas ", vocabWord: "Yo necesito", vocabElement: 4, nameElement: "Personas")
        
        XCTAssertTrue(app.buttons["ir a la oficina"].exists)
        app.buttons["ir a la oficina"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Yo necesito ir a la ")
        app.buttons["Despejar"].tap()
        
        commonActions.backToVocab();
        
        //check spanishSinSintaxis4x4
        pages.sintaxis4x4Spanish.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "lugares", vocabWord: "casa", vocabElement: 3, nameElement: "comida")
        
        XCTAssertTrue(app.buttons["cochera"].exists)
        app.buttons["cochera"].tap()
        app.buttons["sala"].tap()
        
        commonActions.checkSdbText(sdbText: "Cochera sala ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        commonActions.backToVocab()
        
        //check spanshSinSintaxis4x5
        pages.sintaxis4x5Spanish.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: " transporte", vocabWord: "comida", vocabElement: 4, nameElement: "lugares")
        
        
        XCTAssertTrue(app.buttons["pescado"].exists)
        app.buttons["pescado"].tap()
        app.buttons["pan"].tap()
        
        commonActions.checkSdbText(sdbText: "Pescado pan ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        pages.backButton.tap()
        
        commonActions.backToVocab();
        
        //check spanishTeclado vocab
        pages.tecladoSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "?", vocabWord: "FRASES", vocabElement: 6, nameElement: "FRASES")
        
        XCTAssertTrue(app.buttons["Hola, ¿cómo estás?"].exists)
        app.buttons["Hola, ¿cómo estás?"].tap()
        
        commonActions.checkSdbText(sdbText: "Hola, ¿cómo estás? ")
        pages.backButton.tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check spanishVocabPC vocab
        pages.vocabPCSpanishSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "tiempo", vocabWord: "quiero", vocabElement: 3, nameElement: "yo quiero")
        
        XCTAssertTrue(app.buttons["beber"].exists)
        app.buttons["beber"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Yo quiero buscar algo de ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab();
        
        //check spanishWordPower25Espanol
        pages.wordPowerEspanol25.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "jugar", vocabWord: "toma", vocabElement: 4, nameElement: "borrar")
        
        XCTAssertTrue(app.buttons["una foto"].exists)
        app.buttons["una foto"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Toma una ")
        app.buttons["borrar"].tap()
        
        commonActions.backToVocab();
        
        //check spanishWordPower48EspanolBasico vocab
        pages.wordPowerBasico48.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ven", vocabWord: "me", vocabElement: 5, nameElement: "GENTE")
        
        XCTAssertTrue(app.buttons["gusta"].exists)
        app.buttons["gusta"].tap()
        app.buttons["estar"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Me gusta ")
        app.buttons["borrar"].tap()
        commonActions.backToVocab();
        
        //check spanishWordPower48Espanol vocab
        pages.wordPowerEspanol48.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "porque", vocabWord: "comer", vocabElement: 4, nameElement: "GENTE")
        
        XCTAssertTrue(app.buttons["que"].exists)
        app.buttons["que"].tap()
        app.buttons["el"].tap()
        
        commonActions.checkSdbText(sdbText: "Comer que el ")
        app.buttons["borrar"].tap()
        commonActions.backToVocab();
        
        //check spanishWordPower60Espanol vocab
        pages.wordPowerBasico60.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ya", vocabWord: "yo", vocabElement: 7, nameElement: "ACCIONES")
        
        XCTAssertTrue(app.buttons["espero"].exists)
        app.buttons["espero"].tap()
        app.buttons["la"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.checkSdbText(sdbText: "Espero ")
        app.buttons["borrar"].tap()
        commonActions.backToVocab();
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
        let commonActions = CommonActions(app: app)
        
        mainPage.nameVocab(vocabName: "copied vocabulary button Dwell Time", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
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
        commonActions.backToVocab();
        
        //check copied vocab - buttons Settings
        let buttonsSettingsPage = ButtonsSettingsPage(app: app)
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary buttons settings", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
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
        
        commonActions.backToVocab()
        
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
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //check if the force font size works
        profilesAndEditingPage.openTheSettingsTab()
        
        //change the voice for English Voice
        languagesPage.changeEnglishVoice()
        
        //change the voice for Arabic Voice
        languagesPage.checkArabicVoice()
        
        //try to select another Acapela Voice
        languagesPage.trySelectAcapelaVoice()
        
        commonActions.backToVocab()
        
        //check copied vocab - almagu voices
        //        mainPage.nameVocab(vocabName: "copied vocabulary almagu voices", vocabDescription: "vocabulary description e2e")
        //
        //        //enable rename vocab option
        //        pages.openTheSettingsTab()
        //        pages.ensureAllowDeleteIsOn()
        //
        //        //check if the force font size works
        //        profilesAndEditingPage.openTheSettingsTab()
        //
        //        //change the voice for English Voice
        //        languagesPage.changeEnglishVoiceToAlmaguVoiceMegaTest()
        //
        //        //try to select another Almagu Voice
        //        languagesPage.trySelectAlmaguVoice()
        //
        //        pages.backToVocab()
        
        //check copied vocab - dataLogging
        mainPage.nameVocab(vocabName: "copied vocabulary data logging", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check if the enable Logging image appears
        dataLoginPage.checkLoggingImage()
        
        //set privacy password and clear log
        dataLoginPage.setPrivacyPass()
        
        //remove the privacy password
        profilesAndEditingPage.openTheSettingsTab()
        dataLoginPage.removePrivacyPass()
        
        commonActions.backToVocab()
        
        //check copied vocab - editing
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 7).staticTexts["English"].tap()
        
        pages.myCoreSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //set a menu password
        profilesAndEditingPage.setAPassMenu()
        
        //check if the password works
        profilesAndEditingPage.checkIfThePassWorks()
        
        //Remove the password and check if it was removed
        profilesAndEditingPage.removeThePass()
        
        commonActions.backToVocab()
        
        //check copied vocab - expandedSpeechArea
        let expandedSpeechArea = ExpandedSpeechDisplayArea(app: app)
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary speech display bar", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check the fonts for expanded speech area
        expandedSpeechArea.checkTheFontOptions()
        
        //check the font size
        expandedSpeechArea.checkTheFontSize()
        
        //check the font color
        expandedSpeechArea.checkTheFontColors()
        
        //check the background color
        expandedSpeechArea.checkBackgroundColors()
        
        commonActions.backToVocab()
        
        //check copied vocab - navigationButtonsIcons
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 8).staticTexts["English"].tap()
        pages.myCoreSS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "with", vocabWord: "are", vocabElement: 3, nameElement: "myQuickChat")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check the navigation button action works as expected
        profilesAndEditingPage.navigationsIcons()
        
        commonActions.backToVocab()
        
        //check copied vocab - pageSize
        mainPage.nameVocab(vocabName: "copied vocabulary Page Size", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //turn on the status bar and check if it works
        profilesAndEditingPage.unCheckStatusBar()
        
        //swith to Generic the keyguard inset and check if it works
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.checkKeyguardInset()
        
        //return to initial settings for Page Size Tab
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.returnToInitialSettingsPageSize()
        
        commonActions.backToVocab()
        
        //check copied vocab - predictions
        let predictionsSettingsPage = PredictionsSettingsPage(app: app)
        
        mainPage.nameVocab(vocabName: "copied vocabulary predictions settings", vocabDescription: "vocabulary description e2e")
        
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
        
        //check copied vocab - profiles
        XCUIApplication().tables.children(matching: .cell).element(boundBy: 10).staticTexts["English"].tap()
        pages.basic4SS.tap()
        commonActions.openAVocab()
        
        pages.verifyTheVocab(lastElement: "ALL ABOUT ME", vocabWord: "I want", vocabElement: 3, nameElement: "I want")
        
        //add a new profile
        profilesAndEditingPage.addAProfile()
        
        //check the new profile and check the override message
        profilesAndEditingPage.checkTheOverrideMessage()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        commonActions.backToVocab();
        
        //open a new vocab and load the new profile
        pages.engageForiOS.tap()
        commonActions.openAVocab()
        profilesAndEditingPage.loadTheNewProfile()
        
        //rename the new profile
        profilesAndEditingPage.renameTheNewProfile()
        
        //Remove the new profile and check if it was removed
        profilesAndEditingPage.removeTheNewProfile()
        
        commonActions.backToVocab()
        
        //check copied vocab - skinTone
        pages.sintaxis4x5English.tap()
        app.buttons["Customize"].tap()
        let copyVocabTab = app.staticTexts["Copy Vocab"]
        let copyVocabExists = copyVocabTab.waitForExistence(timeout: 10)
        XCTAssertTrue(copyVocabExists)
        app.textFields.element(boundBy: 0).tap()
        app.buttons["Clear text"].tap()
        app.textFields.element(boundBy: 0).typeText("copied vocabulary skin tone settings")
        app.buttons["Save"].tap()
        mainPage.openVocab(vocabToOpen: app.staticTexts["copied vocabulary skin tone settings"], vocab: "copied vocabulary skin tone settings")
        
        pages.verifyTheVocab(lastElement: "Transportation", vocabWord: "Toys", vocabElement: 3, nameElement: "People")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //clear all predictions
        app.buttons["Menu"].tap()
        let vocabSettingsButton = app.buttons["Vocabulary Settings"]
        let vocabSettingsButtonExists = vocabSettingsButton.waitForExistence(timeout: 7)
        XCTAssertTrue(vocabSettingsButtonExists)
        vocabSettingsButton.tap()
        
        app.staticTexts["SymbolStix Skin Tone"].tap()
        let randomBtn = app.staticTexts["Random"]
        let randomBtnExists = randomBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(randomBtnExists)
        randomBtn.tap()
        app.buttons["Done"].tap()
        app.buttons["Back"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - speechDisplayBar
        let speechDisplayBarPage = SpeechDisplayBarPage(app: app)
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary speech display bar1", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //check the hide speech display bar and check if it works
        speechDisplayBarPage.checkTheHideDisplayBar()
        
        //uncheck Auto Capitalization and check if it works
        speechDisplayBarPage.checkAutoCapitalization()
        
        commonActions.checkSdbText(sdbText: "test")
        
        profilesAndEditingPage.openTheSettingsTab()
        let autoCapitalization = app.switches.element(boundBy: 10)
        autoCapitalization.tap()
        
        //hide delete button
        speechDisplayBarPage.checkHideDeleteButton()
        
        //check the fonts
        //ToDo: check if changing the font has a result
        speechDisplayBarPage.checkFontsType()
        
        //check the font size
        //toDo: check if changing the font suze has a result
        speechDisplayBarPage.checkFontSize()
        
        //check the font color
        speechDisplayBarPage.checkFontColor()
        
        //check the background color
        speechDisplayBarPage.checkBackgroundColor()
        
        //check the number of lines
        speechDisplayBarPage.checkNumberOfLines()
        
        //visible Cursor
        speechDisplayBarPage.checkTheCursor()
        
        //check the highlight Spoken Word options
        speechDisplayBarPage.checkTheHighlightSpoken()
        
        //check the highlight color phone/facetime
        speechDisplayBarPage.checkHighlightColorPhone()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - tapAction
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary tap action", vocabDescription: "vocabulary description e2e")
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //enable the Speak and Enlarge Text action
        profilesAndEditingPage.enableSpeakEnlargeAction()
        
        //enable No Action - Tap Action
        profilesAndEditingPage.openTheSettingsTab()
        profilesAndEditingPage.enableNoActionTap()
        
        commonActions.backToVocab()
        
    }
    
    func testMenuFunctionalities() throws{
        
        //check copied vocab - addNewHomePage
        let pages = Pages(app: app)
        let commonActions = CommonActions(app: app)
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary homepage", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        pages.addNewBlankPage()
        
        //add rows and columns
        pages.addRowsColumnsBlankPage()
        
        //select page type
        pages.addHomePageType()
        
        //add background color and select image
        pages.addBackgroundColorAndImage()
        
        //clear image
        pages.clearImageNewPage()
        
        XCUIApplication().navigationBars["Page by e2e"].buttons["Done"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - addNewPageTemplate
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary from template", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //add a template page
        pages.addNewPage()
        pages.addNewTemplatePage()
        
        //set a name for the template page and save it
        pages.setANameForTemplatePage()
        
        commonActions.backToVocab()
        
        //check copied vocab - addNewTemplatePage
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary template", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        pages.addNewBlankPage()
        
        //add rows and columns
        pages.addRowsColumnsBlankPage()
        
        //select page type
        pages.addTemplatePage()
        
        //add background color and select image
        pages.addBackgroundColorAndImage()
        
        //check if the iOS Gallery is opening
        pages.checkTheiOSGallery()
        
        //clear image
        pages.clearImageNewPage()
        
        XCUIApplication().navigationBars["Page by e2e"].buttons["Done"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - buttonSet
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary ButtonSet", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page Layout tab
        pages.editPage()
        
        //remove a buttonSet
        pages.removeAButton(button: 22)
        
        //copy buttonSet
        pages.copyButtonSet()
        
        //paste buttonSet
        pages.pasteButtonSet()
        
        //check if the action works as expected
        pages.checkHowCopyPasteButtonSetWorks()
        
        commonActions.backToVocab()
        
        //check copied vocab - copyPasteButtonFunctionalities
        //copy a new vocab
        mainPage.nameVocabPC(vocabName: "copied vocabulary edit button", vocabDescription: "vocabulary description e2e")
        
        //open the Edit Page tab
        pages.editPage()
        
        //copy an existing butto
        pages.copyAButton(buttonName: "I want")
        
        //paste the button
        pages.pasteTheButton()
        
        commonActions.checkSdbText(sdbText: "I want a drink ")
        
        app.buttons["Back"].tap()
        
        pages.editPage()
        
        //use the same button
        pages.useTheSameButton()
        
        commonActions.checkSdbText(sdbText: "I want a drink I want a snack ")
        
        app.buttons["Back"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - createANewButton
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create button", vocabDescription: "vocabulary description e2e")
        
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
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - delete the Page
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //add a new blank page
        pages.addNewPage()
        pages.addNewBlankPage()
        
        //add rows and columns
        pages.addRowsColumnsBlankPage()
        
        //add background color and select image
        pages.addBackgroundColorAndImage()
        
        //clear image
        pages.clearImageNewPage()
        
        //delete the page
        pages.deleteThePage()
        
        commonActions.backToVocab()
        
        //check copied vocab - edit Abbreviations
        let abbreviationsPage = AbbreviationsPage(app: app)
        XCUIApplication().tables.cells.containing(.image, identifier:"collapsIndicator").staticTexts["English"].tap()
        pages.spellingSS.tap()
        commonActions.openAVocab()
        
        //add abbreviation
        abbreviationsPage.reachAddAbbreviation()
        abbreviationsPage.addAbbreviation()
        abbreviationsPage.checkAddAbbreviation()
        commonActions.checkSdbText(sdbText: "Test by e2e ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        //edit&delete abbreviation
        abbreviationsPage.reachToEditAbbreviation()
        abbreviationsPage.removeTheAbbreviation()
        
        //clearAllAbbreviation
        abbreviationsPage.reachToEditAbbreviation()
        abbreviationsPage.clearAllAbbreviations()
        
        //restoreToDefaults
        abbreviationsPage.restoreToDefaultsAbbreviation()
        
        commonActions.backToVocab();
        
        //check copied vocab - editAButton
        //copy a new vocab
        mainPage.nameVocabPC(vocabName: "copied vocabulary edit button1", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
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
        commonActions.checkSdbText(sdbText: "Edit Button by e2e ")
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        app.buttons["BackButton"].tap()
        
        //change button size
        pages.changeButtonSize(buttonName: "Edit Button by e2e")
        
        //remove the new button
        pages.removeTheButton(buttonName: "Edit Button by e2e")
        
        commonActions.backToVocab()
        
        //check copied vocab - editGestures
        //copy a new vocab
        let gesturesPage = GesturesPage(app: app)
        mainPage.nameVocab(vocabName: "copied vocabulary gestures", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //add a new gesture
        pages.editPage()
        gesturesPage.addNewGesture()
        gesturesPage.verifyGestureExists()
        app.buttons["CLEAR "].tap()
        commonActions.backToVocab()
        
        //check copied vocab - edigtPageLayout
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary pagelayout", vocabDescription: "vocabulary description e2e")
        
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
        
        //        //check copied vocab - editPronunciations
        //        XCUIApplication().tables.cells.containing(.image, identifier:"collapsIndicator").staticTexts["English"].tap()
        //        pages.spellingSS.tap()
        //        pages.openAVocab()
        //
        //        //add pronunciations
        //        pages.reachEditPronunciations()
        //        pages.addPronunciations()
        //
        //        //edit & delete pronunciations
        //        pages.scrollForSearchPronunciations()
        //        pages.searchPronunciations()
        //        pages.deletePronunciations()
        //
        //        //clearAllPronunciations
        //        pages.clearAllPronunciations()
        //
        //        //restoreToDefaults
        //        pages.restoreToDefaultsPronunciations()
        //
        //        pages.backToVocab();
        //
        //check copied vocab - editRenameACopiedVocab
        //copy a new vocab
        mainPage.nameVocabPC(vocabName: "copied vocabulary edit/rename", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        commonActions.backToVocab()
        //rename the copied vocab
        pages.renameACopiedVocabMegaTest()
        
        //check if the vocab was renamed
        XCTAssertTrue(app.staticTexts["Renamed description e2e"].exists, "The renamed vocab is not visible")
        
        //check copied vocab - hideMode
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary hide mode", vocabDescription: "vocabulary description e2e")
        
        //open the Edit Page tab
        pages.editPage()
        
        //hide a button & check if it works
        pages.hideAButton()
        
        //hide all buttons and check if it works
        pages.hideAllButtons()
        
        //show all buttons
        pages.showAllButtons()
        
        //normal mode
        pages.normalModeButtons()
        
        commonActions.backToVocab()
        
        //check copied vocab - pageStyleOverride
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary page style override", vocabDescription: "vocabulary description e2e")
        
        //enable rename vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //open the Edit Page tab
        pages.editPage()
        
        //open the Page Style Override tab
        pages.openPageStyleOverride()
        
        //check the initial state/new state of the switch and tick it
        pages.checkTheToggleandSwitchIt()
        
        //choose a color and check if multiple colors exist
        pages.chooseAColorandChecktheOptions()
        
        commonActions.backToVocab()
        
        //check copied vocab - pasteButton
        //copy a new vocab
        mainPage.nameVocabPC(vocabName: "copied vocabulary paste button", vocabDescription: "vocabulary description e2e")
        
        //open the Edit Page tab
        pages.editPage()
        
        //open the Edit This button tab and fill in the button label&pronunciation
        pages.editThisButton()
        
        //select image
        pages.selectImageButton()
        //turn off switches
        pages.editAButtonForButtonStyle()
        
        //copy the button style
        pages.copyPasteButtonStyle()
        
        //check if the paste button style works as expected
        pages.checkIfTheButtonStyleWasCopied()
        
        commonActions.backToVocab()
        
        //check copied vocab - storeTextButton
        //copy a Spelling Vocab
        mainPage.nameVocab(vocabName: "copied vocabulary1", vocabDescription: "vocabulary description e2e")
        
        //storeTextToAButton
        commonActions.writeTestBy()
        commonActions.openStoreTextBtn()
        
        //check if the storeTextButton is displayed
        commonActions.checkIfTheStoreButtonWorks()
        
        //check if the word appears
        commonActions.checkSdbText(sdbText: "TestbyTestby ")
        commonActions.backToVocab();
    }
    
    func testEditButtonsActions() throws{
        
        //check copied vocab - addNewHomePage
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let commonActions = CommonActions(app: app)
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //check copied vocab - date and time
        mainPage.nameVocab(vocabName: "copied vocabulary date and time action", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Add Action Time/Date")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        
        actionsPage.addActionForTimeDate(actionType: "Date and Time")
        
        //check if the action works
        actionsPage.checkIfTheDateTimeAreDisplayed()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - add date
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary date action", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Add Action Date")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        actionsPage.addActionForTimeDate(actionType: "Date Only")
        
        //check if the action works
        actionsPage.checkIfTheDateisDisplayed()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - add message display
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary add message", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Add Message To Display")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add message to display
        actionsPage.addANewAction(actionName: "Add Message to Display")
        
        //check if the action works
        actionsPage.checkAddMessageDisplay()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - add time
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary time action", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Add Action Time")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        
        actionsPage.addActionForTimeDate(actionType: "Time Only")
        
        //check if the action works
        actionsPage.checkIfTheTimeisDisplayed()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - applyGrammarState
        let profilesAndEditingPage = ProfilesAndEditingPage(app: app)
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary grammar action", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        
        //add Apply Grammar Property action - verb
        grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 24, buttonName: "open", subActionName: "verb")
        
        //add Apply Grammar Property action - adjective
        grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 23, buttonName: "sweet", subActionName: "adjective")
        
        //add Apply Grammar Property action - noun
        grammarActionsPage.addSubActionGrammarProperty(ActionName: "Apply Grammar Property", buttonPosition: 22, buttonName: "player", subActionName: "noun")
        
        //add Apply Grammar State actions
        actionsPage.editButtonForAction(nameButton: "Grammar State -ed")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add apply grammar action -ed
        actionsPage.addANewAction(actionName: "Apply Grammar State")
        grammarActionsPage.addActionED()
        
        //add apply grammar state action -en
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 26, buttonName: "Grammar State -en", subActionName: "add -en")
        
        //add apply grammar state action -er
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 27, buttonName: "Grammar State -er", subActionName: "add -er")
        
        //add grammar state action -est
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 28, buttonName: "Grammar State -est", subActionName: "add -est")
        
        //add grammar state action -ing
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 29, buttonName: "Grammar State -ing", subActionName: "add -ing")
        
        //add grammar state action -ly
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 30, buttonName: "Grammar State -ly", subActionName: "add -ly")
        
        //add grammar state action -s
        grammarActionsPage.addSubAction(ActionName: "Apply Grammar State", buttonPosition: 31, buttonName: "Grammar State -s", subActionName: "add -s")
        
        grammarActionsPage.doneBtn.tap()
        
        //open The Settings Menu
        profilesAndEditingPage.openTheSettingsTab()
        
        //set on the Dynamic Labels Toggle
        grammarActionsPage.setOnDynamicLabels()
        
        grammarActionsPage.checkTheDynamicLabelsToggle()
        
        //Check if the actions work as expected
        grammarActionsPage.checkIfTheActionsWorkAsExpected()
        
        commonActions.backToVocab()
        
        //check copied vocab - backspaceKey
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary backspace key", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Backspace Key")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Backspace Key")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkIfTheActionsWorks()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - batteryStatus
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary battery status", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Battery Sts")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Battery Status")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkTheBatteryStatus()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - calculator
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary calculator", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Calculator")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Calculator")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkTheCalculatorAction()
        
        commonActions.backToVocab()
        
        //check copied vocab - cancel Visit
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary cancel visit", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Cancel Visit Btn")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Cancel Visit")
        
        //save the action
        actionsPage.saveTheAction()
        
        commonActions.backToVocab()
        
        //check copied vocab - clear Display
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary clear display", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Clear Display")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Clear Display")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.clearDisplay()
        
        commonActions.backToVocab()
        
        //check copied vocab - clear Last Word
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary clear last word", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Clear Last Word")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Clear Last Word")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.clearLastWord()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - grammar Actions
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary grammar action1", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Grammar Action -ed")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add grammar action -ed
        actionsPage.addANewAction(actionName: "Grammar Action")
        grammarActionsPage.addActionED()
        
        //add grammar action -en
        grammarActionsPage.addActionEN()
        
        //add grammar action -er
        grammarActionsPage.addActionER()
        
        //add grammar action -est
        grammarActionsPage.addActionEST()
        
        //add grammar action -ing
        grammarActionsPage.addActionING()
        
        //add grammar action -ly
        grammarActionsPage.addActionLY()
        
        //add grammar -s
        grammarActionsPage.addActionS()
        
        //create a new button
        grammarActionsPage.createAVerb()
        
        //app.buttons["z"].tap()
        grammarActionsPage.createAnAdjective()
        
        //check if the grammar action works as expected
        grammarActionsPage.checkGrammarAction()
        app.buttons["CLEAR "].tap()
        commonActions.backToVocab()
        
        //check copied vocab - help Signal
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary help signal", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Help Signal")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Help Signal")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        app.buttons["Help Signal"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - jump to Page
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary jump to page", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Jump To Page No Anim")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add action Jump To Page
        actionsPage.addANewAction(actionName: "Jump To Page")
        actionsPage.addNoAnimAction()
        
        //add Jump to Page - Animate Up
        grammarActionsPage.addJumpAction(button: 26, jumpDirection: "Jump To Page Up", directionType: "  Animate Up")
        
        //add Jump To Page - Animate Down
        grammarActionsPage.addJumpAction(button: 27, jumpDirection: "Jump To Page Down", directionType: "  Animate Down")
        
        //add Jump To Page - Animate Right
        grammarActionsPage.addJumpAction(button: 28, jumpDirection: "Jump To Page Right", directionType: "  Animate Right")
        
        //add Jump To Page - Animate Left
        grammarActionsPage.addJumpAction(button: 29, jumpDirection: "Jump To Page Left", directionType: "  Animate Left")
        
        //check if the jump to page actions works as expected
        actionsPage.checkTheJumpActions()
        
        commonActions.backToVocab()
        
        //check copied vocab - logging Data
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary data logging", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Data Logging")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Data Logging On/Off")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkLoggingData()
        
        commonActions.backToVocab()
        
        //check copied vocab - navigate to HomeBack
        //copy a new vocab
        app.swipeUp()
        mainPage.nameVocab(vocabName: "copied vocabulary navigate back", vocabDescription: "vocabulary description e2e")
        
        //open a second page
        grammarActionsPage.openSecondPage()
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForNavigateAction(nameButton: "Navigate Back No Anim")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Navigate Back")
        grammarActionsPage.addNoAnimNavigateHomeBack()
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 8, navigateDirection: "Navigate Back Animate Up", actionType: "Navigate Back", directionType: "  Animate Up")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 9, navigateDirection: "Navigate Back Animate Down", actionType: "Navigate Back", directionType: "  Animate Down")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 10, navigateDirection: "Navigate Back Animate Right", actionType: "Navigate Back", directionType: "  Animate Right")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 11, navigateDirection: "Navigate Back Animate Left", actionType: "Navigate Back", directionType: "  Animate Left")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 12, navigateDirection: "Navigate To Home No Anim", actionType: "Navigate To Home", directionType: "  No Animation")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 13, navigateDirection: "Navigate To Home Animate Up", actionType: "Navigate To Home", directionType: "  Animate Up")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 14, navigateDirection: "Navigate To Home Animate Down", actionType: "Navigate To Home", directionType: "  Animate Down")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 15, navigateDirection: "Navigate To Home Animate Right", actionType: "Navigate To Home", directionType: "  Animate Right")
        
        grammarActionsPage.addNavigateActionsHomeBack(button: 16, navigateDirection: "Navigate To Home Animate Left", actionType: "Navigate To Home", directionType: "  Animate Left")
        
        
        grammarActionsPage.checkNavigateHomeBackActions()
        
        commonActions.backToVocab()
        
        //check copied vocab - navigate to Conversation
        //copy a new vocab
        app.swipeUp()
        mainPage.nameVocab(vocabName: "copied vocabulary navigate to conversations", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        
        //edit a button
        actionsPage.editButtonForAction(nameButton: "Navigate to Conversations")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add the action
        actionsPage.addANewAction(actionName: "Texting - Navigate to Conversations")
        actionsPage.saveTheAction()
        
        //check if the action works as expected
        actionsPage.checkIfTheTextingConversationsWorks()
        
        commonActions.backToVocab()
        
        //check copied vocab - navigate to
        //copy a new vocab
        app.swipeUp()
        mainPage.nameVocab(vocabName: "copied vocabulary navigate to", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Navigate to Page No Anim")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Navigate")
        actionsPage.addNoAnimAction()
        
        //add navigation - up
        grammarActionsPage.addNavigateAction(button: 26, navigateDirection: "Navigate to Page Up", directionType: "  Animate Up")
        
        //add navigation - down
        grammarActionsPage.addNavigateAction(button: 27, navigateDirection: "Navigate to Page Down", directionType: "  Animate Down")
        
        //add navigation - right
        grammarActionsPage.addNavigateAction(button: 28, navigateDirection: "Navigate to Page Right", directionType: "  Animate Right")
        
        //add navigation - left
        grammarActionsPage.addNavigateAction(button: 29, navigateDirection: "Navigate to Page Left", directionType: "  Animate Left")
        
        //check if the action works
        actionsPage.checkNavigateActions()
        
        commonActions.backToVocab()
        
        //check copied vocab - open apple apps
        //copy a new vocab
        app.swipeUp()
        mainPage.nameVocab(vocabName: "copied vocabulary open apple apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Apple Apps - Apple Maps")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Apple"].tap()
        app.staticTexts["Apple Maps"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Apple Apps - Calendar", actionType: "Open App", directionType: "Apple", appType: "Calendar")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Apple Apps - Notes", actionType: "Open App", directionType: "Apple", appType: "Notes")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Apple Apps - Photos", actionType: "Open App", directionType: "Apple", appType: "Photos")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Apple Apps - Safari", actionType: "Open App", directionType: "Apple", appType: "Safari")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Apple Apps - iMessage", actionType: "Open App", directionType: "Apple", appType: "iMessage")
        
        
        //check Notes App
        grammarActionsPage.checkNotesApp()
        
        commonActions.backToVocab()
        
        //check copied vocab - open different apps
        //copy a new vocab
        app.swipeUp()
        mainPage.nameVocab(vocabName: "copied vocabulary open different apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Different Apps - ChoiceWorks")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["ChoiceWorks"].tap()
        app.staticTexts["ChoiceWorks"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Different Apps - ChoiceWorks Calendar", actionType: "Open App", directionType: "ChoiceWorks", appType: "Choiceworks Calendar")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Different Apps - Disney", actionType: "Open App", directionType: "Disney", appType: "Disney+")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Different Apps - Bose", actionType: "Open App", directionType: "Bose", appType: "Bose Connect")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Different Apps - DoorDash", actionType: "Open App", directionType: "DoorDash", appType: "DoorDash")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Different Apps - Fandango", actionType: "Open App", directionType: "Fandango", appType: "Fandango")
        
        grammarActionsPage.addOpenAppsAction(button: 31, navigateDirection: "Open Different Apps - FitBit", actionType: "Open App", directionType: "FitBit", appType: "FitBit")
        
        grammarActionsPage.addOpenAppsAction(button: 24, navigateDirection: "Open Different Apps - Flickr", actionType: "Open App", directionType: "Flickr", appType: "Flickr")
        
        grammarActionsPage.addOpenAppsAction(button: 43, navigateDirection: "Open Different Apps - Hulu", actionType: "Open App", directionType: "Hulu", appType: "Hulu")
        
        grammarActionsPage.addOpenAppsAction(button: 44, navigateDirection: "Open Different Apps - Microsoft", actionType: "Open App", directionType: "Microsoft", appType: "MS Word")
        
        grammarActionsPage.addOpenAppsAction(button: 45, navigateDirection: "Open Different Apps - Netflix", actionType: "Open App", directionType: "Netflix", appType: "Netflix")
        
        grammarActionsPage.addOpenAppsAction(button: 46, navigateDirection: "Open Different Apps - Pandora", actionType: "Open App", directionType: "Pandora", appType: "Pandora")
        
        grammarActionsPage.addOpenAppsAction(button: 47, navigateDirection: "Open Different Apps - Pair By Number", actionType: "Open App", directionType: "Pictello", appType: "Pictello")
        
        grammarActionsPage.addOpenAppsAction(button: 48, navigateDirection: "Open Different Apps - Pinterest", actionType: "Open App", directionType: "Pinterest", appType: "Pinterest")
        
        //        grammarActionsPage.addOpenAppsAction(button: 49, navigateDirection: "Open Different Apps - Scribd", actionType: "Open App", directionType: "Scribd", appType: "Scribd")
        
        grammarActionsPage.addOpenAppsAction(button: 50, navigateDirection: "Open Different Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        grammarActionsPage.addOpenAppsAction(button: 63, navigateDirection: "Open Different Apps - Skype", actionType: "Open App", directionType: "Skype", appType: "Skype")
        
        grammarActionsPage.addOpenAppsAction(button: 64, navigateDirection: "Open Different Apps - Snapchat", actionType: "Open App", directionType: "Snapchat", appType: "Snapchat")
        
        grammarActionsPage.addOpenAppsAction(button: 65, navigateDirection: "Open Different Apps - Spotify", actionType: "Open App", directionType: "Spotify", appType: "Spotify")
        
        grammarActionsPage.addOpenAppsAction(button: 67, navigateDirection: "Open Diffrent Apps - First Then Visual Schedule HD", actionType: "Open App", directionType: "First Then Visual Schedule HD", appType: "First Then Visual Schedule HD")
        
        grammarActionsPage.addOpenAppsAction(button: 68, navigateDirection: "Open Diffrent Apps - Time", actionType: "Open App", directionType: "Time", appType: "Visual Timer (discontinued)")
        
        grammarActionsPage.addOpenAppsAction(button: 69, navigateDirection: "Open Diffrent Apps - Twitter", actionType: "Open App", directionType: "Twitter", appType: "Twitter")
        
        grammarActionsPage.addOpenAppsAction(button: 70, navigateDirection: "Open Diffrent Apps - Waze", actionType: "Open App", directionType: "Waze", appType: "Waze")
        
        grammarActionsPage.addOpenAppsAction(button: 71, navigateDirection: "Open Diffrent Apps - WhatsApp", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp")
        
        grammarActionsPage.addOpenAppsAction(button: 22, navigateDirection: "Open Diffrent Apps - WhatsApp Client iPad", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp Web Client for iPad")
        
        grammarActionsPage.addOpenAppsAction(button: 23, navigateDirection: "Open Diffrent Apps - YouTube", actionType: "Open App", directionType: "YouTube", appType: "YouTube")
        
        grammarActionsPage.addOpenAppsAction(button: 42, navigateDirection: "Open Diffrent Apps - YouTube Kids", actionType: "Open App", directionType: "YouTube", appType: "YouTube Kids")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Different Apps - ChoiceWorks"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check ChoiceWorks Calendar App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - ChoiceWorks Calendar")
        
        //check Disney App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Disney")
        
        //check Bose App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Bose")
        
        //check DoorDash App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - DoorDash")
        
        //check Fandango App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Fandango")
        
        //check FitBit App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - FitBit")
        
        //check Flickr App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Flickr")
        
        //check Hulu App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Hulu")
        
        //check Microsoft App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Microsoft")
        
        //check Netflix App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Netflix")
        
        //check Pandora App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pandora")
        
        //check Pair By Number App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pair By Number")
        
        //check Pinterest App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pinterest")
        
        //check Sort By Kind App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Sort By Kind")
        
        //check Skype App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Skype")
        
        //check Snapchat App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Snapchat")
        
        //check Spotify App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Spotify")
        
        //check First Then Visual Schedule HD App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - First Then Visual Schedule HD")
        
        //check Time App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Time")
        
        //check Twitter App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Twitter")
        
        //check Waze App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Waze")
        
        //check WhatsApp App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - WhatsApp")
        
        //check YouTube App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube")
        
        //check YouTube Kids App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube Kids")
        
        commonActions.backToVocab()
        
        //check copied vocab - open Google apps
        //copy a new vocab
        mainPage.nameVocab(vocabName: "1copied vocabulary open google apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Google Apps - GMail")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Google"].tap()
        app.staticTexts["GMail"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Google Apps - Google", actionType: "Open App", directionType: "Google", appType: "Google")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Google Apps - Google Docs", actionType: "Open App", directionType: "Google", appType: "Google Docs")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Google Apps - Google Drive", actionType: "Open App", directionType: "Google", appType: "Google Drive")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Google Apps - Google Maps", actionType: "Open App", directionType: "Google", appType: "Google Maps")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Google Apps - Google Slides", actionType: "Open App", directionType: "Google", appType: "Google Slides")
        
        //check Google app
        grammarActionsPage.checkGoogleApp()
        
        //check Google Docs app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Docs")
        
        //check Google Drive app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Drive")
        
        //check Google Google Maps app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Maps")
        
        //check Google Slides app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Slides")
        
        //check Gmail app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - GMail")
        
        commonActions.backToVocab()
        
        //check copied vocab - open Meta Apps
        //copy a new vocab
        mainPage.nameVocab(vocabName: "2copied vocabulary open meta apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Facebook"].tap()
        app.staticTexts["Facebook"].tap()
        app.buttons["Save"].tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Facebook Apps - Facebook Messenger", actionType: "Open App", directionType: "Facebook", appType: "Facebook Messenger")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Instagram App", actionType: "Open App", directionType: "Instagram", appType: "Instagram")
        
        //check Facebook app
        grammarActionsPage.checkFacebookApp()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Facebook Apps - Facebook Messenger")
        
        //check Instagram App
        grammarActionsPage.checkAppType(appType: "Open Instagram App")
        
        commonActions.backToVocab()
        
        //check copied vocab - open step by step
        //copy a new vocab
        mainPage.nameVocab(vocabName: "3copied vocabulary open step apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Open Step By Step Apps - Animal Jigsaw")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Step by Step"].tap()
        app.staticTexts["Animal Jigsaw - Assemble 4 pieces of a picture"].tap()
        let saveBtn = app.buttons["Save"]
        let saveBtnExists = saveBtn.waitForExistence(timeout: 10)
        XCTAssertTrue(saveBtnExists)
        saveBtn.tap()
        
        grammarActionsPage.addOpenAppsAction(button: 26, navigateDirection: "Open Step By Step Apps - Animal Maze", actionType: "Open App", directionType: "Step by Step", appType: "Animal Maze - Find a route through the maze")
        
        grammarActionsPage.addOpenAppsAction(button: 27, navigateDirection: "Open Step By Step Apps - Baby Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Baby Jigsaw - Assemble 3 pieces of a picture")
        
        grammarActionsPage.addOpenAppsAction(button: 28, navigateDirection: "Open Step By Step Apps - Create a Series", actionType: "Open App", directionType: "Step by Step", appType: "Create a Series - Arrange items in a sequence")
        
        grammarActionsPage.addOpenAppsAction(button: 29, navigateDirection: "Open Step By Step Apps - Differ By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Kind - Find the visually odd one out")
        
        grammarActionsPage.addOpenAppsAction(button: 30, navigateDirection: "Open Step By Step Apps - Differ By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Nature - Find the logically odd one out")
        
        grammarActionsPage.addOpenAppsAction(button: 31, navigateDirection: "Open Step By Step Apps - Fairytale Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Fairytale Jigsaw - Assemble 9 pieces of a picture")
        
        grammarActionsPage.addOpenAppsAction(button: 24, navigateDirection: "Open Step By Step Apps - Fill the MAtrix", actionType: "Open App", directionType: "Step by Step", appType: "Fill the Matrix - Place items in the correct cells")
        
        grammarActionsPage.addOpenAppsAction(button: 43, navigateDirection: "Open Step By Step Apps - Monster Maze", actionType: "Open App", directionType: "Step by Step", appType: "Monster Maze - Find a route through the maze")
        
        grammarActionsPage.addOpenAppsAction(button: 44, navigateDirection: "Open Step By Step Apps - Mosaics", actionType: "Open App", directionType: "Step by Step", appType: "Mosaics - Arrange colorful pieces to form a mosaic")
        
        grammarActionsPage.addOpenAppsAction(button: 45, navigateDirection: "Open Step By Step Apps - Pair By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Kind - Match visually related items")
        
        grammarActionsPage.addOpenAppsAction(button: 46, navigateDirection: "Open Step By Step Apps - Pair By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Nature - Match logically related items")
        
        grammarActionsPage.addOpenAppsAction(button: 47, navigateDirection: "Open Step By Step Apps - Pair By Number", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Number - Match quantities and numbers")
        
        grammarActionsPage.addOpenAppsAction(button: 48, navigateDirection: "Open Step By Step Apps - Place in Groups", actionType: "Open App", directionType: "Step by Step", appType: "Place in Groups - Create groups of related items")
        
        grammarActionsPage.addOpenAppsAction(button: 49, navigateDirection: "Open Step By Step Apps - Same Same", actionType: "Open App", directionType: "Step by Step", appType: "Same Same - Match identical items")
        
        grammarActionsPage.addOpenAppsAction(button: 50, navigateDirection: "Open Step By Step Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        grammarActionsPage.addOpenAppsAction(button: 67, navigateDirection: "Open Step By Step Apps - Sort By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Nature - Sort logically related items")
        
        grammarActionsPage.addOpenAppsAction(button: 68, navigateDirection: "Open Step By Step Apps - Stack up", actionType: "Open App", directionType: "Step by Step", appType: "Stack Up - Stack items bottom-up to build a tower")
        
        grammarActionsPage.addOpenAppsAction(button: 70, navigateDirection: "Open Step By Step Apps - Vehicle Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Jigsaw - Assemble 6 pieces of a picture")
        
        grammarActionsPage.addOpenAppsAction(button: 71, navigateDirection: "Open Step By Step Apps - Vehicle Maze", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Maze - Find a route through the maze")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Step By Step Apps - Animal Jigsaw"].tap()
        let textError = app.staticTexts["Error"]
        XCTAssertTrue(textError.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Animal Maze")
        
        //check Differ By Kind - Find the visually odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Kind")
        
        //check Baby Jigsaw - Assemble 3 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Baby Jigsaw")
        
        //check Create a Series - Arrange items in a sequence App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Create a Series")
        
        //check Differ By Nature - Find the logically odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Nature")
        
        //check Fairytale Jigsaw - Assemble 9 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fairytale Jigsaw")
        
        //check Fill the Matrix - Place items in the correct cells App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fill the MAtrix")
        
        //check Monster Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Monster Maze")
        
        //check Mosaics - Arrange colorful pieces to form a mosaic App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Mosaics")
        
        //check Pair By Kind - Match visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Pair By Nature - Match logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Nature")
        
        //check Pair By Number - Match quantities and numbers App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Number")
        
        //check Place in Groups - Create groups of related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Place in Groups")
        
        //check Same Same - Match identical items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Same Same")
        
        //check Sort By Kind - Sort visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Sort By Nature - Sort logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Nature")
        
        //check Stack Up - Stack items bottom-up to build a tower App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Stack up")
        
        //check Vehicle Jigsaw - Assemble 6 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Jigsaw")
        
        //check Vehicle Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Maze")
        
        commonActions.backToVocab()
        
        //check copied vocab - open Website
        //copy a new vocab
        mainPage.nameVocab(vocabName: "4copied vocabulary open website", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Google Website Toggle On")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add website with restricted toggle turned on
        actionsPage.addANewAction(actionName: "Open Website")
        actionsPage.addWebsiteToggleOn()
        
        //add website with restricted toggle turned off
        grammarActionsPage.addWebsiteRestrictedToggleOff()
        
        //check if the Google website works as expected - Toggle On
        actionsPage.checkTheWebsiteToggleOn()
        
        //check if the Google website works as expected - Toggle Off
        actionsPage.checkTheWebsiteToggleOff()
        
        commonActions.backToVocab()
        
        //check copied vocab - pauseResume Tracking
        //copy a new vocab
        mainPage.nameVocab(vocabName: "5copied vocabulary pause resume tracking", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Pause/Resume Tracking")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Pause/Resume Tracking")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        app.buttons["Pause/Resume Tracking"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - play Video
        //copy a new vocab
        mainPage.nameVocab(vocabName: "6copied vocabulary play video", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Play YouTube Video")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Play Video")
        
        //check Library Video tab
        actionsPage.checkLibraryVideoTab()
        
        //check youtube video tab and insert a video
        actionsPage.checkYoutubeVideoTab()
        
        //check if the action works as expected
        actionsPage.checkYoutubeVideoBtn()
        
        commonActions.backToVocab()
        
        //check copied vocab - system Keyboards
        //copy a new vocab
        mainPage.nameVocab(vocabName: "7copied vocabulary system keyboard", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "System Keyboard")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "System Keyboard")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkSystemKeyboardAction()
        
        commonActions.backToVocab()
        
        //check copied vocab - textCopyPaste
        //copy a new vocab
        mainPage.nameVocab(vocabName: "8copied vocabulary copy paste text", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Text Copy Button")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Text Copy")
        
        //save the action
        actionsPage.editTextPasteBtn()
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Text Paste")
        actionsPage.saveTheAction()
        
        //check if the actions work as expected
        actionsPage.checkTextPasteCopyFunctions()
        
        commonActions.checkSdbText(sdbText: "Endtoend ")
        app.buttons["BackButton"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - visit Exception
        //copy a new vocab
        mainPage.nameVocab(vocabName: "9copied vocabulary visit exception1", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Visit Exception")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Visit Exception")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        app.buttons["Visit Exception"].tap()
        
        commonActions.backToVocab()
        
        //check copied vocab - visit To
        //copy a new vocab
        mainPage.nameVocab(vocabName: "11copied vocabulary visit to", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Visit to Page No Anim")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Visit")
        actionsPage.addNoAnimAction()
        
        //add navigation - up
        grammarActionsPage.addVisitAction(button: 26, jumpDirection: "Visit to Page Up", directionType: "  Animate Up")
        
        //add navigation - down
        grammarActionsPage.addVisitAction(button: 27, jumpDirection: "Visit to Page Down", directionType: "  Animate Down")
        
        //add navigation - right
        grammarActionsPage.addVisitAction(button: 28, jumpDirection: "Visit to Page Right", directionType: "  Animate Right")
        
        //add navigation - left
        grammarActionsPage.addVisitAction(button: 29, jumpDirection: "Visit to Page Left", directionType: "  Animate Left")
        
        //check if the action works
        actionsPage.checkVisitAction()
        
        commonActions.backToVocab()
        
        //check copied vocab - wordFinder
        //copy a new vocab
        mainPage.nameVocab(vocabName: "01copied vocabulary wordfinder", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Word Finder Btn")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Word Finder")
        actionsPage.saveTheAction()
        //check the Word Finder action
        actionsPage.checkWordFinderAction()
        
        commonActions.backToVocab()
        
        //check copied vocab - wordPrediction
        //copy a new vocab
        mainPage.nameVocab(vocabName: "02copied vocabulary wordprediction", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        actionsPage.editButtonForAction(nameButton: "Word Prediction Btn 1")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Word Prediction")
        app.staticTexts["  Number 1"].tap()
        app.buttons["Save"].tap()
        //check the Word Finder action
        grammarActionsPage.addNavigateActionsHomeBack(button: 26, navigateDirection: "Word Prediction Btn 2", actionType: "Word Prediction", directionType: "  Number 2")
        //add no3
        grammarActionsPage.addNavigateActionsHomeBack(button: 27, navigateDirection: "Word Prediction Btn 3", actionType: "Word Prediction", directionType: "  Number 3")
        //add no4
        grammarActionsPage.addNavigateActionsHomeBack(button: 28, navigateDirection: "Word Prediction Btn 4", actionType: "Word Prediction", directionType: "  Number 4")
        //add no5
        grammarActionsPage.addNavigateActionsHomeBack(button: 22, navigateDirection: "Word Prediction Btn 5", actionType: "Word Prediction", directionType: "  Number 5")
        //add no6
        grammarActionsPage.addNavigateActionsHomeBack(button: 23, navigateDirection: "Word Prediction Btn 6", actionType: "Word Prediction", directionType: "  Number 6")
        //add no7
        grammarActionsPage.addNavigateActionsHomeBack(button: 24, navigateDirection: "Word Prediction Btn 7", actionType: "Word Prediction", directionType: "  Number 7")
        //add no8
        grammarActionsPage.addNavigateActionsHomeBack(button: 29, navigateDirection: "Word Prediction Btn 8", actionType: "Word Prediction", directionType: "  Number 8")
        //add no9
        grammarActionsPage.addNavigateActionsHomeBack(button: 30, navigateDirection: "Word Prediction Btn 9", actionType: "Word Prediction", directionType: "  Number 9")
        //add no10
        grammarActionsPage.addNavigateActionsHomeBack(button: 31, navigateDirection: "Word Prediction Btn 10", actionType: "Word Prediction", directionType: "  Number 10")
        
        actionsPage.checkWordPredictionsAction()
        
        commonActions.backToVocab()
        
    }
    
    func testCreateButtonsActions() throws{
        
        let pages = Pages(app: app)
        let actionsPage = ActionaPageClass(app: app)
        let commonActions = CommonActions(app: app)
        let vocabName = "vocabulary"
        lazy var mainPage: MainPage = {
            return MainPage(app: XCUIApplication(), vocabName: vocabName)
        }()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create button actions1", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action - Add Time/Date
        pages.removeAButton(button: 22)
        pages.createButtonForActions(button: 22, nameButton: "Add Action Time/Date")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        actionsPage.addActionForTimeDate(actionType: "Date and Time")
        
        //check if the action works as expected
        actionsPage.checkIfTheDateTimeAreDisplayed()
        app.buttons["CLEAR "].tap()
        
        //add a new action
        pages.editPage()
        
        //add an action - Add Message To Display
        pages.removeAButton(button: 24)
        pages.createButtonForActions(button: 24, nameButton: "Add Message To Display")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add message to display
        actionsPage.addANewAction(actionName: "Add Message to Display")
        
        //check if the action works as expected
        actionsPage.checkAddMessageDisplay()
        app.buttons["CLEAR "].tap()
        
        //add a new action
        pages.editPage()
        
        //add an action - BackSpace Key
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Backspace Key")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add backspace key action
        actionsPage.addANewAction(actionName: "Backspace Key")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works as expected
        actionsPage.checkIfTheActionsWorks()
        app.buttons["CLEAR "].tap()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 26)
        pages.createButtonForActions(button: 26, nameButton: "Clear Display")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add clear dipsplay action
        actionsPage.addANewAction(actionName: "Clear Display")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works as expected
        actionsPage.clearDisplay()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 27)
        pages.createButtonForActions(button: 27, nameButton: "Battery Sts")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Battery Status")
        
        //save the action
        actionsPage.saveTheAction()
        
        //check if the action works
        actionsPage.checkTheBatteryStatus()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create button actions2", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 28)
        pages.createButtonForActions(button: 28, nameButton: "Clear Last Word")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Clear Last Word")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        actionsPage.clearLastWord()
        app.buttons["CLEAR "].tap()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 29)
        pages.createButtonForActions(button: 29, nameButton: "Calculator")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Calculator")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        actionsPage.checkTheCalculatorAction()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 30)
        pages.createButtonForActions(button: 30, nameButton: "Help Signal")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Help Signal")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        app.buttons["Help Signal"].tap()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 31)
        pages.createButtonForActions(button: 31, nameButton: "Play YouTube Video")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Play Video")
        
        //check Library Video tab
        actionsPage.checkLibraryVideoTab()
        
        //check youtube video tab and insert a video
        actionsPage.checkYoutubeVideoTab()
        
        //check if the action works as expected
        actionsPage.checkYoutubeVideoBtn()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 42)
        pages.createButtonForActions(button: 42, nameButton: "Add Action Date")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        actionsPage.addActionForTimeDate(actionType: "Date Only")
        
        //check if the action works
        actionsPage.checkIfTheDateisDisplayed()
        app.buttons["CLEAR "].tap()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create button actions3", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 43)
        pages.createButtonForActions(button: 43, nameButton: "Add Action Time")
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time action
        actionsPage.addANewAction(actionName: "Add Time/Date")
        
        actionsPage.addActionForTimeDate(actionType: "Time Only")
        
        //check if the action works
        actionsPage.checkIfTheTimeisDisplayed()
        app.buttons["CLEAR "].tap()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 44)
        pages.createButtonForActions(button: 44, nameButton: "Word Finder Btn")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Word Finder")
        actionsPage.saveTheAction()
        //check the Word Finder action
        actionsPage.checkWordFinderAction()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 45)
        pages.createButtonForActions(button: 45, nameButton: "Data Logging")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Data Logging On/Off")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        actionsPage.checkLoggingData()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 46)
        pages.createButtonForActions(button: 46, nameButton: "Cancel Visit Btn")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Cancel Visit")
        
        //save the action
        actionsPage.saveTheAction()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 47)
        pages.createButtonForActions(button: 47, nameButton: "System Keyboard")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "System Keyboard")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        actionsPage.checkSystemKeyboardAction()
        
        pages.editPage()
        
        //edit a button
        pages.removeAButton(button: 48)
        pages.createButtonForActions(button: 48, nameButton: "Navigate to Conversations")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add the action
        actionsPage.addANewAction(actionName: "Texting - Navigate to Conversations")
        actionsPage.saveTheAction()
        
        //check if the action works as expected
        actionsPage.checkIfTheTextingConversationsWorks()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        let grammarActionsPage = GrammarActionaPageClass(app: app)
        mainPage.nameVocab(vocabName: "copied vocabulary create button actions4", vocabDescription: "vocabulary description e2e")
        
        //enable delete vocab option
        commonActions.openTheSettingsTab()
        commonActions.ensureAllowDeleteIsOn()
        
        //add a new action
        pages.editPage()
        
        //add an action - Add Message To Display
        pages.removeAButton(button: 23)
        pages.createButtonForActions(button: 23, nameButton: "Google Website Toggle On")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add website with restricted toggle turned on
        actionsPage.addANewAction(actionName: "Open Website")
        actionsPage.addWebsiteToggleOn()
        
        //add website with restricted toggle turned off
        grammarActionsPage.addWebsiteRestrictedToggleOff()
        
        //check if the Google website works as expected - Toggle On
        actionsPage.checkTheWebsiteToggleOn()
        
        //check if the Google website works as expected - Toggle Off
        actionsPage.checkTheWebsiteToggleOff()
        
        //open edit page tab
        pages.editPage()
        //add a new action
        pages.removeAButton(button: 28)
        pages.createButtonForActions(button: 28, nameButton: "Pause/Resume Tracking")
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Pause/Resume Tracking")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        app.buttons["Pause/Resume Tracking"].tap()
        
        //add a new action
        pages.editPage()
        
        //add an action - BackSpace Key
        pages.removeAButton(button: 29)
        pages.createButtonForActions(button: 29, nameButton: "Text Copy Button")
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Text Copy")
        
        //save the action
        actionsPage.editTextPasteBtn()
        actionsPage.removeSpeechMessageAction()
        actionsPage.addANewAction(actionName: "Text Paste")
        actionsPage.saveTheAction()
        
        //check if the actions work as expected
        actionsPage.checkTextPasteCopyFunctions()
        
        commonActions.checkSdbText(sdbText: "Endtoend ")
        app.buttons["CLEAR "].tap()
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Visit Exception")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add time/date action
        actionsPage.addANewAction(actionName: "Visit Exception")
        
        //save the action
        actionsPage.saveTheAction()
       
        //check if the action works
        app.buttons["Visit Exception"].tap()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create button grammar actions", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 24)
        pages.createButtonForActions(button: 24, nameButton: "Grammar Action -ed")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add grammar action -ed
        actionsPage.addANewAction(actionName: "Grammar Action")
        grammarActionsPage.addActionED()
        
        //add grammar action -en
        pages.removeAButton(button: 26)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -en", actionType: "add -en", buttonNumber: 26)
        
        //add grammar action -er
        pages.removeAButton(button: 27)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -er", actionType: "add -er", buttonNumber: 27)
        
        //add grammar action -est
        pages.removeAButton(button: 28)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -est", actionType: "add -est", buttonNumber: 28)
        
        //add grammar action -ing
        pages.removeAButton(button: 29)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ing", actionType: "add -ing", buttonNumber: 29)
        
        //add grammar action -ly
        pages.removeAButton(button: 30)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -ly", actionType: "add -ly", buttonNumber: 30)
        
        //add grammar -s
        pages.removeAButton(button: 31)
        grammarActionsPage.createBtnGrammar(buttonName: "Grammar Action -s", actionType: "add -s", buttonNumber: 31)
        
        //create a new button
        grammarActionsPage.createAVerb()
        
        //app.buttons["z"].tap()
        grammarActionsPage.createAnAdjective()
        
        //check if the grammar action works as expected
        grammarActionsPage.checkGrammarActionMegaT()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary open apple apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Apple"].tap()
        app.staticTexts["Apple Maps"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //remove button and add a new action - Calendar
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Apple Apps - Calendar", actionType: "Open App", directionType: "Apple", appType: "Calendar")
        
        //remove button and add a new action - Notes
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Apple Apps - Notes", actionType: "Open App", directionType: "Apple", appType: "Notes")
        
        //remove button and add a new action - Photos
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Apple Apps - Photos", actionType: "Open App", directionType: "Apple", appType: "Photos")
        
        //remove button and add a new action - Safari
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Apple Apps - Safari", actionType: "Open App", directionType: "Apple", appType: "Safari")
        
        //remove button and add a new action - iMessage
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Apple Apps - iMessage", actionType: "Open App", directionType: "Apple", appType: "iMessage")
        
        //check Notes App
        grammarActionsPage.checkNotesApp()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary create different apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Different Apps - ChoiceWorks")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["ChoiceWorks"].tap()
        app.staticTexts["ChoiceWorks"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //create button ChoiceWorks
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Different Apps - ChoiceWorks Calendar", actionType: "Open App", directionType: "ChoiceWorks", appType: "Choiceworks Calendar")
        
        //create button Disney+
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Different Apps - Disney", actionType: "Open App", directionType: "Disney", appType: "Disney+")
        
        //create button Bose Connect
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Different Apps - Bose", actionType: "Open App", directionType: "Bose", appType: "Bose Connect")
        
        //create button DoorDash
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Different Apps - DoorDash", actionType: "Open App", directionType: "DoorDash", appType: "DoorDash")
        
        //create button Fandango
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Different Apps - Fandango", actionType: "Open App", directionType: "Fandango", appType: "Fandango")
        
        //create button FitBit
        pages.removeAButton(button: 31)
        grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Different Apps - FitBit", actionType: "Open App", directionType: "FitBit", appType: "FitBit")
        
        //create button Flickr
        pages.removeAButton(button: 24)
        grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Different Apps - Flickr", actionType: "Open App", directionType: "Flickr", appType: "Flickr")
        
        //create button Hulu
        pages.removeAButton(button: 43)
        grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Different Apps - Hulu", actionType: "Open App", directionType: "Hulu", appType: "Hulu")
        
        //create button MS Word
        pages.removeAButton(button: 44)
        grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Different Apps - Microsoft", actionType: "Open App", directionType: "Microsoft", appType: "MS Word")
        
        //create button Netflix
        pages.removeAButton(button: 45)
        grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Different Apps - Netflix", actionType: "Open App", directionType: "Netflix", appType: "Netflix")
        
        //create button Pandora
        pages.removeAButton(button: 46)
        grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Different Apps - Pandora", actionType: "Open App", directionType: "Pandora", appType: "Pandora")
        
        //create button Pictello
        pages.removeAButton(button: 47)
        grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Different Apps - Pair By Number", actionType: "Open App", directionType: "Pictello", appType: "Pictello")
        
        //create button Pinterest
        pages.removeAButton(button: 48)
        grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Different Apps - Pinterest", actionType: "Open App", directionType: "Pinterest", appType: "Pinterest")
        
        //create button Sort By Kind Sort visually
        pages.removeAButton(button: 50)
        grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Different Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        //create button Skype
        pages.removeAButton(button: 63)
        grammarActionsPage.createButtonOpenAppsAction(button: 63, navigateDirection: "Open Different Apps - Skype", actionType: "Open App", directionType: "Skype", appType: "Skype")
        
        //create button Snapchat
        pages.removeAButton(button: 64)
        grammarActionsPage.createButtonOpenAppsAction(button: 64, navigateDirection: "Open Different Apps - Snapchat", actionType: "Open App", directionType: "Snapchat", appType: "Snapchat")
        
        //create button Spotify
        pages.removeAButton(button: 65)
        grammarActionsPage.createButtonOpenAppsAction(button: 65, navigateDirection: "Open Different Apps - Spotify", actionType: "Open App", directionType: "Spotify", appType: "Spotify")
        
        //create button Visual Schedule HD
        pages.removeAButton(button: 67)
        grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Diffrent Apps - First Then Visual Schedule HD", actionType: "Open App", directionType: "First Then Visual Schedule HD", appType: "First Then Visual Schedule HD")
        
        //create button Visual Timer
        pages.removeAButton(button: 68)
        grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Diffrent Apps - Time", actionType: "Open App", directionType: "Time", appType: "Visual Timer (discontinued)")
        
        //create button Twitter
        pages.removeAButton(button: 69)
        grammarActionsPage.createButtonOpenAppsAction(button: 69, navigateDirection: "Open Diffrent Apps - Twitter", actionType: "Open App", directionType: "Twitter", appType: "Twitter")
        
        //create button Waze
        pages.removeAButton(button: 70)
        grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Diffrent Apps - Waze", actionType: "Open App", directionType: "Waze", appType: "Waze")
        
        //create button WhatsApp
        pages.removeAButton(button: 71)
        grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Diffrent Apps - WhatsApp", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp")
        
        //create button WhatsApp Client
        pages.removeAButton(button: 22)
        grammarActionsPage.createButtonOpenAppsAction(button: 22, navigateDirection: "Open Diffrent Apps - WhatsApp Client iPad", actionType: "Open App", directionType: "WhatsApp", appType: "WhatsApp Web Client for iPad")
        
        //create button Youtube
        pages.removeAButton(button: 23)
        grammarActionsPage.createButtonOpenAppsAction(button: 23, navigateDirection: "Open Diffrent Apps - YouTube", actionType: "Open App", directionType: "YouTube", appType: "YouTube")
        
        //create button YouTube Kids
        pages.removeAButton(button: 42)
        grammarActionsPage.createButtonOpenAppsAction(button: 42, navigateDirection: "Open Diffrent Apps - YouTube Kids", actionType: "Open App", directionType: "YouTube", appType: "YouTube Kids")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Different Apps - ChoiceWorks"].tap()
        let errorText = app.staticTexts["Error"]
        XCTAssertTrue(errorText.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check ChoiceWorks Calendar App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - ChoiceWorks Calendar")
        
        //check Disney App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Disney")
                                        
        //check Bose App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Bose")
        
        //check DoorDash App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - DoorDash")
        
        //check Fandango App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Fandango")
        
        //check FitBit App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - FitBit")
        
        //check Flickr App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Flickr")
        
        //check Hulu App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Hulu")
        
        //check Microsoft App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Microsoft")
        
        //check Netflix App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Netflix")
        
        //check Pandora App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pandora")
        
        //check Pair By Number App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pair By Number")
        
        //check Pinterest App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Pinterest")
        
        //check Sort By Kind App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Sort By Kind")
        
        //check Skype App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Skype")
        
        //check Snapchat App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Snapchat")
        
        //check Spotify App
        grammarActionsPage.checkAppType(appType: "Open Different Apps - Spotify")
        
        //check First Then Visual Schedule HD App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - First Then Visual Schedule HD")
        
        //check Time App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Time")
        
        //check Twitter App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Twitter")
        
        //check Waze App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - Waze")
        
        //check WhatsApp App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - WhatsApp")
        
        //check YouTube App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube")
        
        //check YouTube Kids App
        grammarActionsPage.checkAppType(appType: "Open Diffrent Apps - YouTube Kids")
       
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary open google apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Google Apps - GMail")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Google"].tap()
        app.staticTexts["GMail"].tap()
        app.buttons["Save"].tap()
        
        //create Google button
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Google Apps - Google", actionType: "Open App", directionType: "Google", appType: "Google")
        
        //create Google Docs button
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Google Apps - Google Docs", actionType: "Open App", directionType: "Google", appType: "Google Docs")
        
        //create Google Drive button
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Google Apps - Google Drive", actionType: "Open App", directionType: "Google", appType: "Google Drive")
        
        //create Google Maps button
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Google Apps - Google Maps", actionType: "Open App", directionType: "Google", appType: "Google Maps")
        
        //create Google Slides button
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Google Apps - Google Slides", actionType: "Open App", directionType: "Google", appType: "Google Slides")
        
        //check Google app
        grammarActionsPage.checkGoogleApp()
        
        //check Google Docs app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Docs")
        
        //check Google Drive app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Drive")
        
        //check Google Google Maps app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Maps")
        
        //check Google Slides app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - Google Slides")
        
        //check Gmail app
        grammarActionsPage.checkAppType(appType: "Open Google Apps - GMail")
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary open meta apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Facebook Apps - Facebook")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Facebook"].tap()
        app.staticTexts["Facebook"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        //remove button and add a new action - Messenger
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Facebook Apps - Facebook Messenger", actionType: "Open App", directionType: "Facebook", appType: "Facebook Messenger")
        
        //remove button and a new action - Instagram
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Instagram App", actionType: "Open App", directionType: "Instagram", appType: "Instagram")
        
        //check Facebook app
        grammarActionsPage.checkFacebookApp()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Facebook Apps - Facebook Messenger")
        
        //check Instagram App
        grammarActionsPage.checkAppType(appType: "Open Instagram App")
       
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary open step apps", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Open Step By Step Apps - Animal Jigsaw")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Open App")
        app.staticTexts["Step by Step"].tap()
        app.staticTexts["Animal Jigsaw - Assemble 4 pieces of a picture"].tap()
        sleep(3)
        app.buttons["Save"].tap()
        
        
        //create new button - Animal Maze
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonOpenAppsAction(button: 26, navigateDirection: "Open Step By Step Apps - Animal Maze", actionType: "Open App", directionType: "Step by Step", appType: "Animal Maze - Find a route through the maze")
        
        //create new button - Baby Jigsaw
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonOpenAppsAction(button: 27, navigateDirection: "Open Step By Step Apps - Baby Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Baby Jigsaw - Assemble 3 pieces of a picture")
        
        //create new button - Create a Series
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonOpenAppsAction(button: 28, navigateDirection: "Open Step By Step Apps - Create a Series", actionType: "Open App", directionType: "Step by Step", appType: "Create a Series - Arrange items in a sequence")
        
        //create new button - Differ By Kind
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonOpenAppsAction(button: 29, navigateDirection: "Open Step By Step Apps - Differ By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Kind - Find the visually odd one out")
        
        //create new button - Differ By Nature
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonOpenAppsAction(button: 30, navigateDirection: "Open Step By Step Apps - Differ By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Differ By Nature - Find the logically odd one out")
        
        //create new button - Fairytale Jigsaw
        pages.removeAButton(button: 31)
        grammarActionsPage.createButtonOpenAppsAction(button: 31, navigateDirection: "Open Step By Step Apps - Fairytale Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Fairytale Jigsaw - Assemble 9 pieces of a picture")
        
        //create new button - Fill the Matrix
        pages.removeAButton(button: 24)
        grammarActionsPage.createButtonOpenAppsAction(button: 24, navigateDirection: "Open Step By Step Apps - Fill the MAtrix", actionType: "Open App", directionType: "Step by Step", appType: "Fill the Matrix - Place items in the correct cells")
        
        //create new button - Monster Maze
        pages.removeAButton(button: 43)
        grammarActionsPage.createButtonOpenAppsAction(button: 43, navigateDirection: "Open Step By Step Apps - Monster Maze", actionType: "Open App", directionType: "Step by Step", appType: "Monster Maze - Find a route through the maze")
        
        //create new button - Mosaics
        pages.removeAButton(button: 44)
        grammarActionsPage.createButtonOpenAppsAction(button: 44, navigateDirection: "Open Step By Step Apps - Mosaics", actionType: "Open App", directionType: "Step by Step", appType: "Mosaics - Arrange colorful pieces to form a mosaic")
        
        //create new button - Pair By Kind
        pages.removeAButton(button: 45)
        grammarActionsPage.createButtonOpenAppsAction(button: 45, navigateDirection: "Open Step By Step Apps - Pair By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Kind - Match visually related items")
        
        //create new button - Pair By Nature
        pages.removeAButton(button: 46)
        grammarActionsPage.createButtonOpenAppsAction(button: 46, navigateDirection: "Open Step By Step Apps - Pair By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Nature - Match logically related items")
        
        //create new button - Pair By Number
        pages.removeAButton(button: 47)
        grammarActionsPage.createButtonOpenAppsAction(button: 47, navigateDirection: "Open Step By Step Apps - Pair By Number", actionType: "Open App", directionType: "Step by Step", appType: "Pair By Number - Match quantities and numbers")
        
        //create new button - Place in Groups
        pages.removeAButton(button: 48)
        grammarActionsPage.createButtonOpenAppsAction(button: 48, navigateDirection: "Open Step By Step Apps - Place in Groups", actionType: "Open App", directionType: "Step by Step", appType: "Place in Groups - Create groups of related items")
        
        //create new button - Same Same
        pages.removeAButton(button: 49)
        grammarActionsPage.createButtonOpenAppsAction(button: 49, navigateDirection: "Open Step By Step Apps - Same Same", actionType: "Open App", directionType: "Step by Step", appType: "Same Same - Match identical items")
        
        //create new button - Sort By Kind
        pages.removeAButton(button: 50)
        grammarActionsPage.createButtonOpenAppsAction(button: 50, navigateDirection: "Open Step By Step Apps - Sort By Kind", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Kind - Sort visually related items")
        
        //create new button - Sort by Nature
        pages.removeAButton(button: 67)
        grammarActionsPage.createButtonOpenAppsAction(button: 67, navigateDirection: "Open Step By Step Apps - Sort By Nature", actionType: "Open App", directionType: "Step by Step", appType: "Sort By Nature - Sort logically related items")
        
        //create new button - Stack Up
        pages.removeAButton(button: 68)
        grammarActionsPage.createButtonOpenAppsAction(button: 68, navigateDirection: "Open Step By Step Apps - Stack up", actionType: "Open App", directionType: "Step by Step", appType: "Stack Up - Stack items bottom-up to build a tower")
        
        //create new button - Vehicle Jigsaw
        pages.removeAButton(button: 70)
        grammarActionsPage.createButtonOpenAppsAction(button: 70, navigateDirection: "Open Step By Step Apps - Vehicle Jigsaw", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Jigsaw - Assemble 6 pieces of a picture")
        
        //create new button - Vehicle Maze
        pages.removeAButton(button: 71)
        grammarActionsPage.createButtonOpenAppsAction(button: 71, navigateDirection: "Open Step By Step Apps - Vehicle Maze", actionType: "Open App", directionType: "Step by Step", appType: "Vehicle Maze - Find a route through the maze")
        
        //check Facebook app
        app.buttons["Done"].tap()
        app.buttons["Open Step By Step Apps - Animal Jigsaw"].tap()
        let textError = app.staticTexts["Error"]
        XCTAssertTrue(textError.exists, "The error is not visible")
        app.buttons["Okay"].tap()
        
        //check Messenger App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Animal Maze")
        
        //check Differ By Kind - Find the visually odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Kind")
                                        
        //check Baby Jigsaw - Assemble 3 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Baby Jigsaw")
        
        //check Create a Series - Arrange items in a sequence App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Create a Series")
        
        //check Differ By Nature - Find the logically odd one out App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Differ By Nature")
        
        //check Fairytale Jigsaw - Assemble 9 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fairytale Jigsaw")
        
        //check Fill the Matrix - Place items in the correct cells App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Fill the MAtrix")
        
        //check Monster Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Monster Maze")
        
        //check Mosaics - Arrange colorful pieces to form a mosaic App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Mosaics")
        
        //check Pair By Kind - Match visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Pair By Nature - Match logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Nature")
        
        //check Pair By Number - Match quantities and numbers App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Pair By Number")
        
        //check Place in Groups - Create groups of related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Place in Groups")
        
        //check Same Same - Match identical items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Same Same")
        
        //check Sort By Kind - Sort visually related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Kind")
        
        //check Sort By Nature - Sort logically related items App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Sort By Nature")
        
        //check Stack Up - Stack items bottom-up to build a tower App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Stack up")
        
        //check Vehicle Jigsaw - Assemble 6 pieces of a picture App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Jigsaw")
        
        //check Vehicle Maze - Find a route through the maze App
        grammarActionsPage.checkAppType(appType: "Open Step By Step Apps - Vehicle Maze")
       
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary visit to", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Visit to Page No Anim")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add no animation action
        actionsPage.addANewAction(actionName: "Visit")
        actionsPage.addNoAnimAction()
        
        //add navigation - up
        pages.removeAButton(button: 26)
        grammarActionsPage.addVisitCreateButtonAction(button: 26, jumpDirection: "Visit to Page Up", directionType: "  Animate Up")
        
        //add navigation - down
        pages.removeAButton(button: 27)
        grammarActionsPage.addVisitCreateButtonAction(button: 27, jumpDirection: "Visit to Page Down", directionType: "  Animate Down")
        
        //add navigation - right
        pages.removeAButton(button: 28)
        grammarActionsPage.addVisitCreateButtonAction(button: 28, jumpDirection: "Visit to Page Right", directionType: "  Animate Right")
        
        //add navigation - left
        pages.removeAButton(button: 29)
        grammarActionsPage.addVisitCreateButtonAction(button: 29, jumpDirection: "Visit to Page Left", directionType: "  Animate Left")
        
        //check if the action works
        actionsPage.checkVisitAction()
        
        commonActions.backToVocab()
        
        //copy a new vocab
        mainPage.nameVocab(vocabName: "copied vocabulary wordprediction", vocabDescription: "vocabulary description e2e")
        
        pages.editPage()
        //add an action
        pages.removeAButton(button: 25)
        pages.createButtonForActions(button: 25, nameButton: "Word Prediction Btn 1")
        
        //remove the speech message action
        actionsPage.removeSpeechMessageAction()
        
        //add a new action "Text Copy"
        actionsPage.addANewAction(actionName: "Word Prediction")
        app.staticTexts["  Number 1"].tap()
        app.buttons["Save"].tap()
        
        //check the Word Finder action
        pages.removeAButton(button: 26)
        grammarActionsPage.createButtonWordPrediction(button: 26, navigateDirection: "Word Prediction Btn 2", actionType: "Word Prediction", directionType: "  Number 2")
        //add no3
        pages.removeAButton(button: 27)
        grammarActionsPage.createButtonWordPrediction(button: 27, navigateDirection: "Word Prediction Btn 3", actionType: "Word Prediction", directionType: "  Number 3")
        //add no4
        pages.removeAButton(button: 28)
        grammarActionsPage.createButtonWordPrediction(button: 28, navigateDirection: "Word Prediction Btn 4", actionType: "Word Prediction", directionType: "  Number 4")
        //add no5
        pages.removeAButton(button: 22)
        grammarActionsPage.createButtonWordPrediction(button: 22, navigateDirection: "Word Prediction Btn 5", actionType: "Word Prediction", directionType: "  Number 5")
        //add no6
        pages.removeAButton(button: 23)
        grammarActionsPage.createButtonWordPrediction(button: 23, navigateDirection: "Word Prediction Btn 6", actionType: "Word Prediction", directionType: "  Number 6")
        //add no7
        pages.removeAButton(button: 24)
        grammarActionsPage.createButtonWordPrediction(button: 24, navigateDirection: "Word Prediction Btn 7", actionType: "Word Prediction", directionType: "  Number 7")
        //add no8
        pages.removeAButton(button: 29)
        grammarActionsPage.createButtonWordPrediction(button: 29, navigateDirection: "Word Prediction Btn 8", actionType: "Word Prediction", directionType: "  Number 8")
        //add no9
        pages.removeAButton(button: 30)
        grammarActionsPage.createButtonWordPrediction(button: 30, navigateDirection: "Word Prediction Btn 9", actionType: "Word Prediction", directionType: "  Number 9")
        //add no10
        pages.removeAButton(button: 31)
        grammarActionsPage.createButtonWordPrediction(button: 31, navigateDirection: "Word Prediction Btn 10", actionType: "Word Prediction", directionType: "  Number 10")
        
        actionsPage.checkWordPredictionsAction()
        
        commonActions.backToVocab()
    }
    
}
