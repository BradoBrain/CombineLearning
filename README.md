# CombineLearning

Repo for adding materials of learning Combine framework. 
In Combine we have a three main topics: Publishers, Operators and Subscribers.

Status of the repo: 

The main part of publishers - done

Operators in process ...



**Publishers**

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

.allStisfy - operator to test all items that are coming through pipeline and check the criteria. As soon as on of the items does not match it, false will be published. If all items match criteria then true is published.

.tryAllSatisfy - operator that work like the .allSatisfy and can publish an error

.contains - operator that signal if an item coming through pipeline matches criteria. It publishes the true and finishes pipeline when match is found. Others data will not go through the pipeline flow. If there is no value that match our criteria it publishes the false and closes pipeline.

.contains(where:) - operator gives us an additional clouser to specify our criteria. Very useful when the item aren't simple type like String and Int. Item that don't match criteria not published and when first item is match, true is published and pipeline is closed. If there are no matches at the end of items, false will be published and pipeline will be finished.


// Mathematical operations



// Sequence operations


//Timing control
.delay - operator that give us to specify time and thread for long operations.
// Filtering

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
