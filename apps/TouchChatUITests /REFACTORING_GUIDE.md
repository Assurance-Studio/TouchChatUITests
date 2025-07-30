# TouchChat UI Tests Refactoring Guide

## 🚀 Phase 1: Foundation Setup (COMPLETED)

You now have the foundation classes in place! Here's what has been created:

### ✅ New Architecture Files Created:
- `BaseTest.swift` - Base class for all tests
- `PageManager.swift` - Coordinates all page objects  
- `CommonActions.swift` - Common UI interactions
- `EditPageActions.swift` - Edit page functionality
- `GesturesPage.swift` - Gesture management
- `AbbreviationsPage.swift` - Abbreviation management
- `PronunciationsPage.swift` - Pronunciation management
- `SettingsPage.swift` - Settings functionality
- `ButtonActionsPage.swift` - Button actions (stub)
- `editAButtonTestsRefactored.swift` - Example refactored test

## 📋 Next Steps: What You Should Do Now

### Step 1: Test the Foundation (Day 1)

1. **Build the project** to ensure all new files compile correctly
2. **Run the refactored test** to verify the new architecture works:
   ```bash
   # Run the refactored test
   xcodebuild test -scheme TouchChatUITests -destination 'platform=iOS Simulator,name=iPhone 15' -only-testing:TouchChatUITests/editAButtonTestsRefactored/testEditAButton
   ```

### Step 2: Start Migrating Individual Tests (Days 2-5)

**Choose 3-5 simple tests to migrate first:**

1. `editAbbreviationsTests.swift`
2. `editGesturesTests.swift` 
3. `storeTextButtonTests.swift`
4. `addNewHomePage.swift`
5. `editPronunciationsTests.swift`

**Migration Pattern for Each Test:**

```swift
// OLD WAY (before)
final class editAbbreviationsTests: XCTestCase {
    var app = XCUIApplication()
    
    override func setUpWithError() throws {
        // 15 lines of setup code...
        let pages = Pages(app: app)
        pages.checkLicenseModal()
        // etc...
    }
    
    func testLaunchEditAbbreviations() throws {
        let pages = Pages(app: app)
        pages.reachAddAbbreviation()
        // etc...
    }
}

// NEW WAY (after)
final class editAbbreviationsTests: BaseTest {
    
    func testLaunchEditAbbreviations() throws {
        // Setup is handled by BaseTest automatically!
        
        pages.abbreviationsPage.reachAddAbbreviation()
        pages.abbreviationsPage.addAbbreviation()
        pages.abbreviationsPage.checkAddAbbreviation()
        
        // Clean, focused, readable!
    }
}
```

### Step 3: Fix Compilation Issues (As You Go)

When you migrate tests, you might find missing methods. Here's how to handle them:

1. **If method exists in old Pages.swift but not in new page classes:**
   - Copy the method to the appropriate page class
   - Update the method to use the new patterns

2. **Example: Moving a method from Pages.swift to AbbreviationsPage.swift**
   ```swift
   // In old Pages.swift, find method like this:
   func someAbbreviationMethod() {
       // implementation
   }
   
   // Move it to AbbreviationsPage.swift:
   func someAbbreviationMethod() {
       // same implementation
   }
   ```

### Step 4: Update Method Calls (As You Go)

**Find and Replace Pattern:**
```swift
// OLD
let pages = Pages(app: app)
pages.reachAddAbbreviation()

// NEW  
pages.abbreviationsPage.reachAddAbbreviation()
```

## 🎯 Migration Priority Order

### **Week 1: Core Infrastructure**
- [x] ✅ Foundation classes (DONE)
- [ ] Migrate 5 simple tests
- [ ] Verify new tests work correctly
- [ ] Fix any compilation issues

### **Week 2: Menu Functionality Tests**
- [ ] `editAButtonTests.swift` (use refactored version as reference)
- [ ] `editPageLayoutTests.swift`
- [ ] `editGesturesTests.swift`
- [ ] `editAbbreviationsTests.swift`
- [ ] `editPronunciationsTests.swift`

### **Week 3: Settings Tests**
- [ ] All files in `SettingsFunctionality/` folder
- [ ] Move methods from old `Pages.swift` to `SettingsPage.swift`

### **Week 4: Button Action Tests**
- [ ] Move methods from `ActionsPage.swift` to `ButtonActionsPage.swift`
- [ ] Migrate tests in `ButtonActions/` folders

## 🔧 Practical Tips

### Finding Methods to Move
```bash
# Search for a method in the old Pages.swift
grep -n "func methodName" apps/TouchChatUITests\ /Pages/Pages.swift

# Find where it's used in tests
grep -r "methodName" apps/TouchChatUITests\ /Tests/
```

### Creating New Page Classes
When you need a new page class:

```swift
import XCTest

class NewPage {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // Add methods here
}
```

Then add it to `PageManager.swift`:
```swift
lazy var newPage: NewPage = NewPage(app: app)
```

### Testing Individual Methods
```swift
// In any test, you can now easily test individual page actions:
func testSingleAction() {
    pages.abbreviationsPage.addAbbreviation()
    // Test passes or fails quickly - easy to debug!
}
```

## 🚫 DO NOT Touch (For Now)

**Leave these files alone until later phases:**
- `Pages.swift` (1,585 lines) - We'll delete this AFTER migration
- `megaTests.swift` (2,852 lines) - Phase 2 task
- Any existing working tests - Don't break what works

## ✅ Success Metrics

After Week 1, you should have:
- [ ] 5 tests successfully migrated and passing
- [ ] New architecture working correctly
- [ ] Clear understanding of the migration pattern
- [ ] Confidence to continue with more tests

## 🆘 If You Get Stuck

**Common Issues & Solutions:**

1. **"Method not found" errors:**
   - Copy method from old `Pages.swift` to appropriate new page class
   - Add page class to `PageManager.swift` if needed

2. **"Pages object not accessible":**
   - Make sure test inherits from `BaseTest`
   - Use `pages.pageName.methodName()` pattern

3. **Setup issues:**
   - `BaseTest` handles all setup - don't override `setUpWithError`
   - Use `createTestVocabulary()` and `cleanupTestVocabulary()` helpers

## 🎉 Next Phase Preview

Once you have 10-15 tests migrated successfully, we'll tackle:
- Splitting the monster `megaTests.swift` file
- Creating vocabulary test data management
- Eliminating `sleep()` calls with proper waits
- Advanced page object patterns

**Start with Step 1 and let me know how it goes!** 