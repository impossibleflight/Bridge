#  Bridge

Bridge helps make interacting with Objective-C and the Objective-C runtime in Swift more Swift-like.  

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Bridge into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "impossibleflight/Bridge" ~> 1.0.0
```

Run `carthage update` to build the framework and drag the built `Bridge.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate Bridge into your project manually.


## Usage

### Exceptions
#### Transforming Obj-C exceptions into Swift errors that you can catch

Let's say you have an Obj-C interface that includes a method like this:

```objc
@interface MyStore : NSObject
// Note: raises an exception if object can't be found
- (id) objectForIdentifier:(String)identifier {...}
@end
```
Using it from Swift looks like this in cases where there is no object for the passed identifier:

```swift
let identifierForMissingObject = "acb123" 
let object = myStore.object(forIdentifier: identifierForMissingObject) --> 💥
```
Your app crashes while trying to do that lookup—which is a bit unexpected based on the interface alone—and if you haven't read the docs you have no idea why. This is less than ideal; we would like to catch that situtation and be able to correct the underlying problem or at least let the user know what's happening. And we know Swift lets us catch errors of this sort, right?

Bridge to the rescue:

```swift
let identifierForMissingObject = "acb123" 
do {
	let object = try ObjC.throwing { myStore.object(forIdentifier: identifierForMissingObject) }
	// do something with your object 
} catch {
	// uh oh. let's handle this.
}
```

### Associated Objects
#### Strongly typed associations using the Obj-C runtime

Easily create strongly typed object associations:

```swift
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
```

## Authors

* **John Clayton** - *Initial work* - [John Clayton](https://github.com/johnclayton)

See also the list of [contributors](https://github.com/impossibleflight/Bridge/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

