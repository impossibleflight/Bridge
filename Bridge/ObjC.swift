//
//  ObjC.swift
//  StoryKit
//
//  Created by John Clayton on 8/21/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

import Foundation

public class ObjC {
	/// Runs the supplied block, catching any raised Objective-C exceptions and transforming them into errors that can be caught in Swift.
	///
	/// - Parameter closure: a block that can raise Objective-C exceptions
	/// - Throws: an error that wraps the underlying exception
	public static func throwing(_ closure:@escaping (()throws->Void)) throws {
		var e: Error?
		try _ObjC._performThrowingErrorsForExceptions {
			// objc blocks can't throw swift errors
			do {
				try closure()
			} catch {
				e = error
			}
		}
		if let error = e { throw error }
	}

	/// Runs the supplied block, catching any raised Objective-C exceptions and transforming them into errors that can be caught in Swift, and returns the result.
	///
	/// - Parameter closure: a block that can raise Objective-C exceptions
	/// - Returns: the return value from closure
	/// - Throws: an error that wraps the underlying exception
	public static func throwingReturn<T>(_ closure:@escaping (()throws->T)) throws -> T {
		var result: T!
		var e: Error?
		try _ObjC._performThrowingErrorsForExceptions {
			// objc blocks can't throw swift errors
			do {
				result = try closure()
			} catch {
				e = error
			}
		}
		if let error = e { throw error }
		return result
	}
}

