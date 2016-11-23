import XCTest
@testable import VaporSimplePagination

class VaporSimplePaginationTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(VaporSimplePagination().text, "Hello, World!")
    }


    static var allTests : [(String, (VaporSimplePaginationTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
