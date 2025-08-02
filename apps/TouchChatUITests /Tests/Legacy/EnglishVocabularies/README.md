# Legacy English Vocabulary Tests

This folder contains the original English vocabulary test files that were refactored to use the new BaseTest architecture and Page Object Model pattern.

## Files in this folder:

### Basic Tests:
- `4BasicTests.swift` → Refactored to `Basic4Tests.swift`
- `engageForiOSTests.swift` → Refactored to `EngageForiOSTests.swift`
- `myCoreTests.swift` → Refactored to `MyCoreTests.swift`
- `spellingTests.swift` → Refactored to `SpellingTests.swift`
- `vocabPCTests.swift` → Refactored to `VocabPCTests.swift`

### WordPower Tests:
- `Wordpower/WordPower25Tests.swift` → Refactored to `WordPower25Tests.swift`
- `Wordpower/WordPower42Tests.swift` → Refactored to `WordPower42Tests.swift`
- `Wordpower/WordPower48Tests.swift` → Refactored to `WordPower48Tests.swift`
- `Wordpower/WordPower60Tests.swift` → Refactored to `WordPower60Tests.swift`

### MultiChat Tests:
- `MultiChat15/multiChatAdultTests.swift` → Refactored to `MultiChat15AdultTests.swift`
- `MultiChat15/multiChatAdolescentTests.swift` → Refactored to `MultiChat15AdolescentTests.swift`
- `MultiChat15/multiChatStudentTests.swift` → Refactored to `MultiChat15StudentTests.swift`

### Aphasia Tests:
- `Aphasia/aphasiaUSTests.swift` → Refactored to `AphasiaUSTests.swift`
- `Aphasia/aphasiaUKTests.swift` → Refactored to `AphasiaUKTests.swift`

### Sintaxis Tests:
- `Sinsintaxis4x4EnglishTests.swift` → Refactored to `Sintaxis4x4EnglishTests.swift`
- `Sintaxis4x5EnglishTests.swift` → Refactored to `Sintaxis4x5EnglishTests.swift`

### QuickChat Tests:
- `My QuickChat/Child/myQuickChatChild4Tests.swift` → Refactored to `MyQuickChatChild4Tests.swift`
- `My QuickChat/Child/myQuickChatChild8Tests.swift` → Refactored to `MyQuickChatChild8Tests.swift`
- `My QuickChat/Adult/myQuickChatAdult8Tests.swift` → Refactored to `MyQuickChatAdult8Tests.swift`

## Refactoring Changes:

1. **Architecture:** Moved from `XCTestCase` to `BaseTest` inheritance
2. **Setup:** Removed duplicate setup/teardown code (now handled by BaseTest)
3. **Naming:** Improved naming conventions (PascalCase for classes and files)
4. **Organization:** Reorganized by vocabulary type instead of language
5. **Page Objects:** Used specialized page objects:
   - `VocabularyPage` - Vocabulary selection and verification
   - `LanguageSelectionPage` - Language and region selection
6. **Maintainability:** Cleaner, more readable test structure

## Note:
These files are kept for reference and comparison. The new refactored versions are located in their respective directories with improved architecture and maintainability. 