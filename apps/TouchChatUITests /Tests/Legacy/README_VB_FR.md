# Legacy French Vocabulary Tests

This folder contains the original French vocabulary test files that were refactored to use the new BaseTest architecture and Page Object Model pattern.

## Files in this folder:

### WordPower Tests:
- `frenchWordPower60FrancaisTests.swift` → Refactored to `WordPower60FrancaisTests.swift`
- `frenchWordPower120FrancaisTests.swift` → Refactored to `WordPower120FrancaisTests.swift`
- `frenchWordPower120FrancaisAzertyTests.swift` → Refactored to `WordPower120AzertyTests.swift`

### MultiChat Tests:
- `frenchMultiChat15FrancaisTests.swift` → Refactored to `MultiChat15FrancaisTests.swift`

### Specialized Tests:
- `french4debaseTests.swift` → Refactored to `Base4FrenchTests.swift`
- `frenchCommunicationJourneyTests.swift` → Refactored to `CommunicationJourneyTests.swift`
- `frenchVocabPCFrancaisTests.swift` → Refactored to `VocabPCFrancaisTests.swift`
- `frenchEpelerFrancaisTests.swift` → Refactored to `EpelerFrancaisTests.swift`

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
├── WordPower/
│   ├── WordPower60FrancaisTests.swift
│   ├── WordPower120FrancaisTests.swift
│   └── WordPower120AzertyTests.swift
├── MultiChat/
│   └── MultiChat15FrancaisTests.swift
└── Specialized/
    ├── Base4FrenchTests.swift
    ├── CommunicationJourneyTests.swift
    ├── VocabPCFrancaisTests.swift
    └── EpelerFrancaisTests.swift
```

## Note:
These files are kept for reference and comparison. The new refactored versions are located in their respective directories with improved architecture and maintainability. 