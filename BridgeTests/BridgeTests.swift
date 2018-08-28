//
//  BridgeTests.swift
//  BridgeTests
//
//  Created by John Clayton on 8/27/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

import XCTest

@testable import Bridge

class BridgeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThrowingThrowsWhenExceptionRaised() {
		let objector = Objector()

		var e: Error?
		do {
			try ObjC.throwing { objector.doSomething(true) }
		} catch {
			e = error
		}
		XCTAssertNotNil(e)
	}

	func testThrowingDoesNotThrowWhenNoExceptionRaised() {
		let objector = Objector()

		var e: Error?
		do {
			try ObjC.throwing { objector.doSomething(false) }
		} catch {
			e = error
		}
		XCTAssertNil(e)
	}

	func testThrowingReturnThrowsWhenExceptionRaised() {
		let objector = Objector()

		var e: Error?
		var o: Any?
		do {
			o = try ObjC.throwingReturn { objector.findSomething(true) }
		} catch {
			e = error
		}
		XCTAssertNotNil(e)
		XCTAssertNil(o)

	}

	func testThrowingReturnDoesNotThrowWhenNoExceptionRaised() {
		let objector = Objector()

		var e: Error?
		var o: Any?
		do {
			o = try ObjC.throwingReturn { objector.findSomething(false) }
		} catch {
			e = error
		}
		XCTAssertNil(e)
		XCTAssertNotNil(o)

	}
}
