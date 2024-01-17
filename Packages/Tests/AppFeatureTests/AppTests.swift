import AppFeature
import TestExtensions
import XCTest

final class MainTests: XCTestCase {
    func testExample() throws {
        let first = Item.random(id: UUID())
        var second = first
        second.tags.append("Added")

        XCTAssertEqual(first, second)
        XCTAssertNoDifference(first, second)
    }
}
