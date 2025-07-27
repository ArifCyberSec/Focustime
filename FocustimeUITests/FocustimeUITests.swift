import XCTest

final class FocustimeUITests: XCTestCase {
  var app: XCUIApplication!

  override func setUpWithError() throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }

  override func tearDownWithError() throws {
    app.terminate()
    app = nil
  }

  func testNavigationThroughGames() throws {
    let startButton = app.buttons["Start"]
    XCTAssertTrue(startButton.exists, "Der Start-Button muss vorhanden sein")
    let highscoreButton = app.buttons["Highscore"]
    XCTAssertTrue(highscoreButton.exists)

    startButton.tap()
    let memoryButton = app.buttons["Memory"]
    XCTAssertTrue(memoryButton.waitForExistence(timeout: 1.0), "Memory-Button sollte angezeigt werden")

    
    memoryButton.tap()
    let backButton = app.navigationBars.buttons["Back"]
    XCTAssertTrue(backButton.waitForExistence(timeout: 1.0))
    backButton.tap()

    
    let reactionButton = app.buttons["Reaction Game"]
    XCTAssertTrue(reactionButton.exists)
    reactionButton.tap()
    XCTAssertTrue(backButton.waitForExistence(timeout: 1.0))
    backButton.tap()

   
    let patternButton = app.buttons["Number Pattern"]
    XCTAssertTrue(patternButton.exists)
    patternButton.tap()
    XCTAssertTrue(backButton.waitForExistence(timeout: 1.0))
    backButton.tap()

   
    let navBack = app.navigationBars.buttons["StartView"]
    XCTAssertTrue(navBack.exists)
  }
}
