import XCTest

class AdBlockerUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testToggleAdBlocker() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Navigate to the extension UI
        app.toolbars["Toolbar"].buttons["YourExtensionButton"].click()
        
        // Locate the toggle button
        let toggle = app.switches["Enable AdBlocker"]
        
        // Verify initial state
        XCTAssertFalse(toggle.value as! Bool, "AdBlocker should be initially disabled")
        
        // Toggle the button to enable
        toggle.click()
        XCTAssertTrue(toggle.value as! Bool, "AdBlocker should be enabled")
        
        // Toggle the button to disable
        toggle.click()
        XCTAssertFalse(toggle.value as! Bool, "AdBlocker should be disabled")
    }
}

