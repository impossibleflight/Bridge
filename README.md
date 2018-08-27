#  Bridge
## Swift-y interfaces to Obj-C

Bridge helps make using Objective-C code in Swift more Swift-like.  

### Transforming Obj-C exceptions into Swift errors that you can catch

Let's say you have an Objective-C interface that includes a method like this:

```
@interface MyStore : NSObject
// Note: throws an exception if object can't be found
+ (id) objectForIdentifier:(String)identifier {...}
@end
```
Using it from Swift looks like this in cases where there is no object for the passed identifier:

```
let identifier = "acb123" 
let object = MyStore.object(forIdentifier: identifier) --> 💥
```
Your app crashes while trying to do that lookup—which is a bit unexpected based on the interface alone—and if you haven't read the docs you have no idea why. This is less than ideal; we would like to catch that situtation and be able to correct the underlying problem or at least let the user know what's happening. And we know Swift lets us catch errors of this sort, right?

Bridge to the rescue:

```
let identifier = "acb123" 
do {
	let object = try ObjC.throwing { MyStore.object(forIdentifier: identifier) }
	// do something with your object 
} catch {
	// uh oh. let's handle this.
}
```

