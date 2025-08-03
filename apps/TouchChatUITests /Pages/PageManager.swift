import XCTest

class PageManager {
    let app: XCUIApplication
    
    // Page Objects
    lazy var mainPage: MainPage = MainPage(app: app, vocabName: "vocabulary")
    lazy var vocabPage: VocabPage = VocabPage(app: app, vocabName: "vocab")
    lazy var editPage: EditPageActions = EditPageActions(app: app)
    lazy var gesturesPage: GesturesPage = GesturesPage(app: app)
    lazy var abbreviationsPage: AbbreviationsPage = AbbreviationsPage(app: app)
    lazy var pronunciationsPage: PronunciationsPage = PronunciationsPage(app: app)
    lazy var settingsPage: SettingsPage = SettingsPage(app: app)
    lazy var buttonActionsPage: ButtonActionsPage = ButtonActionsPage(app: app)
    lazy var actionsPage: ActionaPageClass = ActionaPageClass(app: app)
    lazy var grammarActionsPage: GrammarActionaPageClass = GrammarActionaPageClass(app: app)
    lazy var functionalityPage: FunctionalityPage = FunctionalityPage(app: app)
    lazy var modifiersPage: ModifiersPage = ModifiersPage(app: app)
    lazy var waitPage: WaitPage = WaitPage(app: app)
    lazy var vocabularyPage: VocabularyPage = VocabularyPage(app: app)
    lazy var languageSelectionPage: LanguageSelectionPage = LanguageSelectionPage(app: app)
    lazy var common: CommonActions = CommonActions(app: app)
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Navigation Helper (temporary, will be moved to CommonActions)
    func reachMenuPageIfOnVocabPage() {
        if mainPage.menuButton.exists {
            if vocabPage.vocabButton.exists {
                vocabPage.vocabButton.tap()
                vocabPage.chooseNewVocab.tap()
                assert(mainPage.editButton.exists)
            }
            print("********* We reached the Vocab list page")
            
            // Access the element by its identifier
            let expandIndicator = app.images["expandIndicator"]
            
            // Check if the element exists
            if expandIndicator.waitForExistence(timeout: 5) {
                scrollUpUntilElementIsVisible(element: mainPage.cancelSearchButton)
                tapFirstLockedImage()
                print("********* We opened the first vocabulary")
                
                if vocabPage.vocabButton.exists {
                    vocabPage.vocabButton.tap()
                    vocabPage.chooseNewVocab.tap()
                    assert(mainPage.editButton.exists)
                } else {
                    print("********* The Vocabulary failed to open in reach menu if on vocab page func.")
                }
            }
            print("********* We already are on the vocabulary list screen.")
        }
    }
    
    // MARK: - Helper Methods (temporary, will be refactored)
    private func scrollUpUntilElementIsVisible(element: XCUIElement, maxScrolls: Int = 5, timeout: TimeInterval = 10) {
        let startTime = Date()
        var scrollAttempts = 0
        
        while !element.exists || !element.isHittable {
            if scrollAttempts >= maxScrolls || Date().timeIntervalSince(startTime) >= timeout {
                break
            }
            app.swipeDown()
            scrollAttempts += 1
            sleep(1)
        }
    }
    
    private func tapFirstLockedImage() {
        let lockedImages = app.images.matching(identifier: "locked")
        if lockedImages.count > 0 {
            let firstLockedImage = lockedImages.element(boundBy: 0)
            if firstLockedImage.exists {
                firstLockedImage.tap()
            } else {
                print("The first 'locked' image does not exist.")
            }
        } else {
            print("No images with the identifier 'locked' were found.")
        }
    }
} 
