//
//  ObjectAssociable.swift
//  Bridge
//
//  Created by John Clayton on 10/19/18.
//  Copyright © 2018 Impossible Flight, LLC. All rights reserved.
//

import Foundation

/**
A protocol that classes can adopt to easily implement strongly typed Objective-C object associations

Example:
	private struct AssociationKeys {
		static var bar = "bar"
	}

	extension Foo : ObjectAssociable {
		var bar: NSNumber {
			get {
				return get(associatedObjectForKey: &AssociationKeys.bar) ?? 0
			}
			set {
				set(associatedObject: newValue, forKey: &AssociationKeys.bar)
			}
		}
	}
*/
@objc public protocol ObjectAssociable: class {}

public extension ObjectAssociable {
	func  set<T>(associatedObject object: T, forKey key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
		objc_setAssociatedObject(self, key, object, policy)
	}

	func get<T>(associatedObjectForKey key: UnsafeRawPointer) -> T? {
		if let object = objc_getAssociatedObject(self, key) as? T {
			return object
		}
		return nil
	}
}
