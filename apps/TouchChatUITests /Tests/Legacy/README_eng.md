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
- `Wordpower/WordPower42BasicTests.swift` → Refactored to `WordPower42BasicTests.swift`
- `Wordpower/WordPower48Tests.swift` → Refactored to `WordPower48Tests.swift`
- `Wordpower/WordPower48BasicTests.swift` → Refactored to `WordPower48BasicTests.swift`
- `Wordpower/WordPower60Tests.swift` → Refactored to `WordPower60Tests.swift`
- `Wordpower/WordPower60BasicTests.swift` → Refactored to `WordPower60BasicTests.swift`
- `Wordpower/WordPower80Tests.swift` → Refactored to `WordPower80Tests.swift`
- `Wordpower/WordPower108Tests.swift` → Refactored to `WordPower108Tests.swift`
- `Wordpower/WordPower108KeyboardTests.swift` → Refactored to `WordPower108KeyboardTests.swift`
- `Wordpower/WordPower140Tests.swift` → Refactored to `WordPower140Tests.swift`
- `Wordpower/WordPower20SimplyTests.swift` → Refactored to `WordPower20SimplyTests.swift`

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
- `My QuickChat/Child/myQuickChatChild12Tests.swift` → Refactored to `MyQuickChatChild12Tests.swift`
- `My QuickChat/Adult/myQuickChatAdult8Tests.swift` → Refactored to `MyQuickChatAdult8Tests.swift`
- `My QuickChat/Adult/myQuickChatAdult12Tests.swift` → Refactored to `MyQuickChatAdult12Tests.swift`

### Other Tests:
- `00_CheckVocab.swift` → Utility test for vocabulary checking

## Complete Refactoring Summary:

**Total Files Refactored: 38 English vocabulary tests**

### Breakdown by Category:
- **Basic Tests**: 5 files
- **WordPower Tests**: 12 files
- **MultiChat Tests**: 3 files
- **Aphasia Tests**: 2 files
- **Sintaxis Tests**: 2 files
- **QuickChat Tests**: 5 files
- **Other Tests**: 1 file

## Refactoring Changes:

1. **Architecture:** Moved from `XCTestCase` to `BaseTest` inheritance
2. **Setup:** Removed duplicate setup/teardown code (now handled by BaseTest)
3. **Naming:** Improved naming conventions (PascalCase for classes and files)
4. **Organization:** Reorganized by vocabulary type instead of language
5. **Page Objects:** Used specialized page objects:
   - `VocabularyPage` - Vocabulary selection and verification
   - `LanguageSelectionPage` - Language and region selection
6. **Maintainability:** Cleaner, more readable test structure

## New Directory Structure:

```
Tests/Vocabularies/
├── Basic/
│   ├── Basic4Tests.swift (English)
│   ├── EngageForiOSTests.swift (English)
│   ├── MyCoreTests.swift (English)
│   ├── SpellingTests.swift (English)
│   └── VocabPCTests.swift (English)
├── WordPower/
│   ├── WordPower25EspanolTests.swift (Spanish)
│   ├── WordPower48EspanolTests.swift (Spanish)
│   ├── WordPower60FrancaisTests.swift (French)
│   ├── WordPower25Tests.swift (English)
│   ├── WordPower42Tests.swift (English)
│   ├── WordPower42BasicTests.swift (English)
│   ├── WordPower48Tests.swift (English)
│   ├── WordPower48BasicTests.swift (English)
│   ├── WordPower60Tests.swift (English)
│   ├── WordPower60BasicTests.swift (English)
│   ├── WordPower80Tests.swift (English)
│   ├── WordPower108Tests.swift (English)
│   ├── WordPower108KeyboardTests.swift (English)
│   ├── WordPower140Tests.swift (English)
│   └── WordPower20SimplyTests.swift (English)
├── MultiChat/
│   ├── MultiChat15SpanishTests.swift (Spanish)
│   ├── MultiChat15BilingualTests.swift (Spanish)
│   ├── MultiChat15FrancaisTests.swift (French)
│   ├── MultiChat15AdultTests.swift (English)
│   ├── MultiChat15AdolescentTests.swift (English)
│   └── MultiChat15StudentTests.swift (English)
├── Aphasia/
│   ├── AphasiaSpanishTests.swift (Spanish)
│   ├── AphasiaUSTests.swift (English)
│   └── AphasiaUKTests.swift (English)
├── Sintaxis/
│   ├── Sintaxis4x4SpanishTests.swift (Spanish)
│   ├── Sintaxis4x5SpanishTests.swift (Spanish)
│   ├── Sintaxis4x4EnglishTests.swift (English)
│   └── Sintaxis4x5EnglishTests.swift (English)
├── QuickChat/
│   ├── MyQuickChatChild4Tests.swift (English)
│   ├── MyQuickChatChild8Tests.swift (English)
│   ├── MyQuickChatChild12Tests.swift (English)
│   ├── MyQuickChatAdult8Tests.swift (English)
│   └── MyQuickChatAdult12Tests.swift (English)
└── Specialized/
    ├── TecladoTests.swift (Spanish)
    ├── VocabPCSpanishTests.swift (Spanish)
    ├── Base4FrenchTests.swift (French)
    ├── CommunicationJourneyTests.swift (French)
    ├── VocabPCFrancaisTests.swift (French)
    └── EpelerFrancaisTests.swift (French)
```

## Note:
These files are kept for reference and comparison. The new refactored versions are located in their respective directories with improved architecture and maintainability. 