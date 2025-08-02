# Legacy Spanish Vocabulary Tests

This folder contains the original Spanish vocabulary test files that were refactored to use the new BaseTest architecture and Page Object Model pattern.

## Files in this folder:

### WordPower Tests:
- `spanishWordPower25EspanolTests.swift` → Refactored to `WordPower25EspanolTests.swift`
- `spanishWordPower48EspanolTests.swift` → Refactored to `WordPower48EspanolTests.swift`
- `spanishWordPower48EspanolBasicoTests.swift` → Refactored to `WordPower48EspanolBasicoTests.swift`
- `spanishWordPower60EspanolBasicoTests.swift` → Refactored to `WordPower60EspanolBasicoTests.swift`
- `spniashWordPower96Espanol.swift` → Refactored to `WordPower96EspanolLiteTechTests.swift`

### MultiChat Tests:
- `spanishMultiChat15Tests.swift` → Refactored to `MultiChat15SpanishTests.swift`
- `spanishMultiChat15BilingualTests.swift` → Refactored to `MultiChat15BilingualTests.swift`

### Sintaxis Tests:
- `spanishSinsintaxis4x4SpanishTests.swift` → Refactored to `Sintaxis4x4SpanishTests.swift`
- `spanishSintaxis4x5SpanishTests.swift` → Refactored to `Sintaxis4x5SpanishTests.swift`

### Specialized Tests:
- `aphasiaSpanishTests.swift` → Refactored to `AphasiaSpanishTests.swift`
- `spanishAfasiaEspanolTests.swift` → Refactored to `AphasiaSpanishTests.swift`
- `spanishTecladoTests.swift` → Refactored to `TecladoTests.swift`
- `spanishVocabPCTests.swift` → Refactored to `VocabPCSpanishTests.swift`

## Refactoring Changes:

1. **Architecture:** Moved from `XCTestCase` to `BaseTest` inheritance
2. **Setup:** Removed duplicate setup/teardown code (now handled by BaseTest)
3. **Naming:** Improved naming conventions (PascalCase for classes and files)
4. **Organization:** Reorganized by vocabulary type instead of language
5. **Page Objects:** Created specialized page objects:
   - `VocabularyPage` - Vocabulary selection and verification
   - `LanguageSelectionPage` - Language and region selection
6. **Maintainability:** Cleaner, more readable test structure

## New Directory Structure:

```
Tests/Vocabularies/
├── WordPower/
│   ├── WordPower25EspanolTests.swift
│   ├── WordPower48EspanolTests.swift
│   ├── WordPower48EspanolBasicoTests.swift
│   ├── WordPower60EspanolBasicoTests.swift
│   └── WordPower96EspanolLiteTechTests.swift
├── MultiChat/
│   ├── MultiChat15SpanishTests.swift
│   └── MultiChat15BilingualTests.swift
├── Sintaxis/
│   ├── Sintaxis4x4SpanishTests.swift
│   └── Sintaxis4x5SpanishTests.swift
└── Specialized/
    ├── AphasiaSpanishTests.swift
    ├── TecladoTests.swift
    └── VocabPCSpanishTests.swift
```

## Note:
These files are kept for reference and comparison. The new refactored versions are located in their respective directories with improved architecture and maintainability. 