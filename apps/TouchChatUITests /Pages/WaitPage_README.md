# WaitPage Documentation

The `WaitPage` class provides a comprehensive set of wait methods to replace scattered `sleep()` calls throughout the test suite. It offers standardized wait durations and intelligent wait patterns for better test reliability.

## Quick Start

```swift
// Instead of sleep(5)
pages.waitPage.waitMedium()

// Instead of element.waitForExistence(timeout: 10)
pages.waitPage.waitForElement(element, timeout: 10)

// Instead of sleep(2)
pages.waitPage.waitShort()
```

## Wait Duration Constants

| Method | Duration | Use Case |
|--------|----------|----------|
| `waitShort()` | 2 seconds | Quick UI updates, simple animations |
| `waitMedium()` | 5 seconds | Standard element loading, form submissions |
| `waitLong()` | 10 seconds | Complex operations, network requests |
| `waitExtraLong()` | 15 seconds | Heavy operations, file uploads |
| `waitVeryLong()` | 30 seconds | Very slow operations, system processes |

## Basic Wait Methods

### Simple Duration Waits
```swift
pages.waitPage.waitShort()      // 2 seconds
pages.waitPage.waitMedium()     // 5 seconds
pages.waitPage.waitLong()       // 10 seconds
pages.waitPage.waitExtraLong()  // 15 seconds
pages.waitPage.waitVeryLong()   // 30 seconds
pages.waitPage.wait(duration: 3.5) // Custom duration
```

## Element Wait Methods

### Basic Element Waits
```swift
// Wait for element to exist (fails if not found)
pages.waitPage.waitForElement(element, timeout: 10)

// Wait for element to exist (returns boolean)
let exists = pages.waitPage.waitForElementToExist(element, timeout: 10)

// Wait for element to disappear
pages.waitPage.waitForElementToDisappear(element, timeout: 10)

// Wait for element to be hittable
pages.waitPage.waitForElementToBeHittable(element, timeout: 10)

// Wait for element to be enabled
pages.waitPage.waitForElementToBeEnabled(element, timeout: 10)
```

### Text Waits
```swift
// Wait for text to appear
pages.waitPage.waitForText("Expected Text")

// Wait for text to exist (returns boolean)
let textExists = pages.waitPage.waitForTextToExist("Some Text")

// Wait for text to disappear
pages.waitPage.waitForTextToDisappear("Temporary Text")
```

### Button Waits
```swift
// Wait for button to exist
pages.waitPage.waitForButton("Button Text")

// Wait for button to exist (returns boolean)
let buttonExists = pages.waitPage.waitForButtonToExist("Button Text")

// Wait for button to be hittable
pages.waitPage.waitForButtonToBeHittable("Button Text")
```

### TextField Waits
```swift
// Wait for text field
pages.waitPage.waitForTextField("Email Field")

// Wait for secure text field
pages.waitPage.waitForSecureTextField("Password Field")
```

## Navigation Wait Methods

```swift
// Wait for navigation bar
pages.waitPage.waitForNavigationBar("Settings")

// Wait for tab bar
pages.waitPage.waitForTabBar("Home")
```

## UI Component Wait Methods

### Alert and Sheet Waits
```swift
// Wait for alert
pages.waitPage.waitForAlert("Error Alert")

// Wait for sheet
pages.waitPage.waitForSheet("Action Sheet")

// Wait for popover
pages.waitPage.waitForPopover("Options Popover")
```

### Activity Indicator and Keyboard Waits
```swift
// Wait for activity indicator to disappear
pages.waitPage.waitForActivityIndicatorToDisappear()

// Wait for keyboard to appear
pages.waitPage.waitForKeyboardToAppear()

// Wait for keyboard to disappear
pages.waitPage.waitForKeyboardToDisappear()
```

## Conditional Wait Methods

### Custom Condition Waits
```swift
// Wait until a condition is met
pages.waitPage.waitUntil({
    return app.staticTexts["Loading Complete"].exists
}, timeout: 10)

// Wait until element exists
let elementExists = pages.waitPage.waitUntilElementExists(element)
```

## Utility Wait Methods

### Application State Waits
```swift
// Wait for app to be ready
pages.waitPage.waitForAppToBeReady()

// Wait for background process
pages.waitPage.waitForBackgroundProcess()

// Wait for page to load
pages.waitPage.waitForPageToLoad()

// Wait for animation to complete
pages.waitPage.waitForAnimationToComplete()

// Wait for network request
pages.waitPage.waitForNetworkRequest()
```

## Migration Guide

### Replacing sleep() Calls

**Before:**
```swift
sleep(5)
element.tap()
```

**After:**
```swift
pages.waitPage.waitMedium()
element.tap()
```

### Replacing waitForExistence() Calls

**Before:**
```swift
let exists = element.waitForExistence(timeout: 10)
XCTAssertTrue(exists, "Element not found")
```

**After:**
```swift
pages.waitPage.waitForElement(element, timeout: 10)
```

### Replacing Complex Wait Patterns

**Before:**
```swift
let startTime = Date()
while !element.exists {
    if Date().timeIntervalSince(startTime) >= 10 {
        XCTFail("Element not found")
        return
    }
    sleep(0.5)
}
```

**After:**
```swift
pages.waitPage.waitForElement(element, timeout: 10)
```

## Best Practices

### 1. Use Appropriate Wait Durations
```swift
// For quick UI updates
pages.waitPage.waitShort()

// For standard operations
pages.waitPage.waitMedium()

// For complex operations
pages.waitPage.waitLong()
```

### 2. Prefer Element Waits Over Sleep
```swift
// Good: Wait for specific element
pages.waitPage.waitForButton("Submit")

// Avoid: Generic sleep
pages.waitPage.waitMedium()
```

### 3. Use Conditional Waits for Dynamic Content
```swift
// Wait for dynamic content
pages.waitPage.waitUntil({
    return app.staticTexts["Loading Complete"].exists
}, timeout: 10)
```

### 4. Handle Expected Failures
```swift
// Check if element exists without failing
let exists = pages.waitPage.waitForButtonToExist("Optional Button")
if exists {
    // Handle the button
}
```

## Error Handling

All wait methods include proper error handling with descriptive messages:

```swift
// This will fail with a clear error message
pages.waitPage.waitForText("Non-existent Text", timeout: 2)
// Error: "Element <XCUIElement> not found within 2 seconds"
```

## Integration with PageManager

The WaitPage is automatically available through the PageManager:

```swift
// In any test that inherits from BaseTest
pages.waitPage.waitMedium()
pages.waitPage.waitForButton("Some Button")
```

## Examples

See `WaitPageExampleTests.swift` for comprehensive usage examples including:
- Basic wait methods
- Element wait methods
- Custom timeouts
- Error handling
- Conditional waits 