# CombineLearning

Repo for adding materials of learning Combine framework. 
In Combine we have a three main topics: Publishers, Operators and Subscribers.

Status of the repo: 

The main part of publishers - done

Operators in process ...



- [x] **Publishers**

@Published - property wrapper with ObservableObject to notify any view that @Published has been changed. We use it with @StateObject.

Empty - publisher that publishes nothing. Immediately or fail immediately (or keep pipeline open without complete).

Fail - publisher that published a failure (with an error). If input is valid, return a publisher, else return a Fail publisher.

Future - publisher that publishes only one value and close pipeline (ONLY ONE TIME). It can be publish immedietely, delay or wait for a user response etc. 

Deferred - publisher that give us not execute Future immediately (other publisdhers not execute immediately)

Just - publisher that makes from any variable a publisher. Send it to pipeline one time and stop the pipeline.

PassthroughSubject - publisher (like  the CurrentValueSubject) that doesn't hold on to a value. It allows us to create a pipeline to send value through.

Sequence - publisher that sends elements of a collection through a pipeline one at a time. Once all items have been sent, the pipeline finishes. No more items even if we add more it to the collection later.

Timer - publisher repeatedly publish current date and time with interval that you set up. You also could attach operators to run some code at an interval.

DataTaskPublisher - publisher for URLSession (it can send a results of a URL API down a pipeline and assign results to a property).

**Operators**

// Operators to check matching criteria

.allSatisfy - operator to test all items that are coming through pipeline and check the criteria. As soon as on of the items does not match it, false will be published. If all items match criteria then true is published.

.tryAllSatisfy - operator that work like the .allSatisfy and can publish an error

.contains - operator that signal if an item coming through pipeline matches criteria. It publishes the true and finishes pipeline when match is found. Others data will not go through the pipeline flow. If there is no value that match our criteria it publishes the false and closes pipeline.

.contains(where:) - operator gives us an additional clouser to specify our criteria. Very useful when the item aren't simple type like String and Int. Item that don't match criteria not published and when first item is match, true is published and pipeline is closed. If there are no matches at the end of items, false will be published and pipeline will be finished.

.tryContains(where: ) - operator that have an option publish true for your items with criteria you specify or publish an error. This suscriber ultimately receive a true, false or error and finish.

// Mathematical operations

.count - operator that publishes count of items it receives.

.max - operator republishes just maximum value from upstream (it do that only when publisher has finished with all of items).

.max(by: ) - operator that republishes max value it receive from upstream using criteria you specify. We can get and weigh value against each other. With this operator pipeline knows how to sort item and it's able to publish min value.

.tryMax(by: ) - operator that works like .max(by: ) and able to throw an error

.min - does exactly the opposite from what .max does.

.min(by: ) - does exactly the opposite from what .max(by: ) does.

.tryMin(by: ) - does exactly the opposite from what .tryMax(by: ) does.

// Sequence operations

.append - operator that publishes the data after the publisher has sent out all of its items. It add items to the end.

.drop(untilOutputFrom: ) - operator that does not publishes or send items down to the pipeline until it receives items from second pipeline that will give a signal to accept the publishing.

.dropFirst - operator that able to prevent a certain number of items from initially being published.

.dropFirst(count: ) - operator can specify number of dropping data

.prefix - operator that republished only specify by prefix number of items. After prefix number is hit the pipeline finishes.

.prefix(untilOutputFrom:) - operator will let items continue to be passed through a pipeline until it receives a value from another pipeline. This is the opposite of .drop(untilOutputFrom:) operator. The second pipeline is like a switch that closes the first pipeline.

.prepend - operator that publishes data first befor publisher will send out its first data.

//Timing control

.debounce - operator like a pause.

.delay - operator that give us to specify time and thread for long operations.

.delay(for: ) - operator pauses items from the data flow. This works only once for all items and allows them through.

.measureInterval - operator that tell us how much time was between one item and another one. It won't republish item values.

.throttle - operator that set an interval and republishes just one value out of many we received during this interval. We have a choise to republish recent value or first.

.timeout - operator with we can finish the pipeline when task process is too long

// Filtering

.compactMap - operator that give us a way to drop all nils that come through pipeline.

.tryCompactMap - operator like .compactMap but with option to throw an error

.filter - operator that give us to republish data based on our criteria.

.tryFilter - operator works like .filter with option to throw an error

.removeDuplicates - operator that just remove duplicates of data that are one after another (!). If the data being sent through the pipeline conforms to the Equatable protocol then this operator will do all the work of removing duplicates for you.

.removeDuplicates(by:) operator works like the removeDuplicates operator but for objects that do not conform to the Equatable protocol. Since removeDuplicates won’t be able to tell if the previous item is the same as the current item, you can specify what makes the two items equal inside this closure.

.tryRemoveDuplicates(by: ) - operator like .removeDuplicates(by: ) but allow to throw an error

.replaceEmpty operator that we can use when we want to show or set some value in the case that nothing came down your pipeline. This could be useful in situations where you want to set some default data or notify the user that there was no data.

// Mapping

.map - simple operator to do logic operations.

.tryMap - has an option to throw an error



// Reducing


// Selecting

// Specifying shedulers


**Subscribers**

.assign(to:) - simple subscriber to write value from operators to property.

.store(in:) - uses instead assign(to:) when we need to add cancel() funcrion to more than one property (multiCancellable pipline). 

.sink - subscriber returns us AnyCancellable class which has one function in its protocol Cancellable - cancel(). We can stop pipeline manualy.
