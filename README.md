# SwiftUI-RIB
Bringing RIB architecture to SwiftUI

### RIB
This is an adaptation of RIB architecture to make it work with SwiftUI. To learn more about the fundamentals of RIB, please take a look at [Uber's official documentation](https://github.com/uber/RIBs). 

### Simplifying things
Even though I like the core ideas of RIB, there are a few things in the original RIB (for UIKit) that I don't like. For example, it adds lifecycle to some of the elements, which creates blackbox code that we have to read more code to find out when a callback is triggered, hence, introducing some learning curve. Or the use of `Component` as a dependency container. It does help reduce some boilerplate code, but on the flip side, it creates ambiguity and some occasional naming collisions. I like to make things as explicit as possible.

To solve those things. Here are the changes:
  - No more super classes. No more lifecycle. If you want to hook up some event with the view lifecycle, do it manually, it doesn't take much time and now a new developer who has never used RIB before only need to look at 2 files to find out when something is triggered.
  - No `Component`, dependency container is a simple struct that contains all the dependencies. You collect all the dependencies, put them in that struct and give it to the builder, no more meddling with naming, type matching of 1 big `Component`.
  - Parent of UIKit RIB communicates with the RIB using streams (Parent -> RIB) and `Listener` delegate (RIB -> Parent). Because SwiftUI is set up to work nicely with `Combine`, I decided to remove the delegate and use streams for communication in both directions. With this change, you'll have to dispose the subscription at the time of RIB detaching.
  - Internal interactions within UIKit RIB is also done with delegates. That is gone as well, `StateContainer` and `ViewContainer` are introduced to replace the delegates.
  
  ### RIB Interaction
  What each component does and the interactions among them are described as the following:<br/>
  ![Interaction](/Images/SwiftUI-RIB-Interaction.png "Interaction") <br/>
   - (1) `View` events (appear, tap, scrolling, gestures, etc.) are sent to the `Interactor` using the `Interactor` protocol's methods.
   - (2) `Interactor` processes logic, it then updates the state if needed. `StateContainer` is where the state is stored. `StateContainer` is an `ObservableObject` and its properties are wrapped with `@Published` so that `View` can listen to those.
   - (3) If there is something happens that this RIB needs to inform its parent, the `Interactor` will publish the events through `PublisherContainer`. `PublisherContainer` contains `AnyPublisher`s. You can either create `Subject`s in the `Interactor` and expose the publisher, or if possible, you can even reuse properties of `StateContainer` thanks to the little trick of adding `$` in front of the property name to get its `Publisher`. Like so `stateContainer.$isLoading`.
   - (4) `Interactor` can also call `Router` to ask it to attach or detach other RIBs. After attaching the new RIB, `Router` will return the `Output` of that RIB to the `Interactor`, the `Interactor` can now use the `PublisherContainer` inside the `Output` to listen to the newly attached RIB and handle as required.
   - (5) `Router` updates the `ViewContainer` when attach or detach is called. `ViewContainer` is similar to `StateContainer` except that it contains the children's `View`s and some other View-related properties if applicable. 
   - (6) (7) Because `StateContainer` and `ViewContainer` are `ObservableObject`s, changes to these 2 will be propagated to `View` so that the UI can be updated.
   - (8) Events from this RIB are propagated to its parent via the publishers of `PublisherContainer`.
   
A few notes here:
  - View holds the reference to `Interactor`, `StateContainer`, and `ViewContainer`; `Interactor` holds the reference to `Router` and `StateContainer`; `Router` holds the reference to `ViewContainer`. Because of this, `View` is the holder of everything; when the `View` is deallocated, the entire RIB will be deallocated. This is different from UIKit RIB, where `Router` is the holder. 
  - All relationships are one-way, therefore, there is no need for weak references.
  - When detaching a RIB, remember to remove the view references in `ViewContainer` and dispose the subscriptions of streams in `Interactor`.
  - Properties of `ViewContainer` and `StateContainer` should be `fileprivate(set)` to ensure that other components cannot modify them. This is to ensure the rigidity of the RIB.
  
### Tooling
In this repo, you can find a template for Xcode new file. This is to help you create a new RIB quickly. The template for writing tests is to be added later.

### Sample project
To be added
