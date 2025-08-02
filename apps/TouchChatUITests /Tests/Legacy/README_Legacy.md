# Legacy Test Files

This folder contains the original test files that were refactored to use the new BaseTest architecture and Page Object Model pattern.

## Files in this folder:

### `AboutTests_Legacy.swift`
- **Original name:** `00_AboutTests.swift`
- **Purpose:** Tests for the About screen functionality
- **Status:** Refactored to `AboutTests.swift` using BaseTest architecture

### `CopyVocabularyTests_Legacy.swift`
- **Original name:** `01_CopyVocabularyTests.swift`
- **Purpose:** Tests for copying vocabulary functionality
- **Status:** Refactored to `CopyVocabularyTests.swift` using BaseTest architecture

### `ImportVocabularyTests_Legacy.swift`
- **Original name:** `importAVocabTests.swift`
- **Purpose:** Tests for importing vocabulary from DropBox
- **Status:** Refactored to `ImportVocabularyTests.swift` using BaseTest architecture

### `Modifiers_Legacy.swift`
- **Original name:** `Modifiers.swift`
- **Purpose:** Page object for modifier functionality (old architecture)
- **Status:** Refactored to `ModifiersPage.swift` using new Page Object Model

## Refactoring Changes:

1. **Architecture:** Moved from `XCTestCase` to `BaseTest` inheritance
2. **Setup:** Removed duplicate setup/teardown code (now handled by BaseTest)
3. **Naming:** Improved naming conventions (PascalCase for classes)
4. **Organization:** Better separation of concerns with specialized page objects
5. **Maintainability:** Cleaner, more readable test structure

## Note:
These files are kept for reference and comparison. The new refactored versions are located in their respective directories with improved architecture and maintainability. 