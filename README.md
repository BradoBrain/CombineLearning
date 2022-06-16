# CombineLearning

Repo for adding materials of learning Combine framework. Status in process.



**Publishers**

@Published - property wrapper with ObservableObject to notify any view that @Published has been changed. We use it with @StateObject.

Empty - publisher that publishes nothing. Immediately or fail immediately (or keep pipeline open without complete).

Fail - publisher that published a failure (with an error). If input is valid, return a publisher, else return a Fail publisher.

Future - publisher that publishes only one value and close pipeline (ONLY ONE TIME). It can be publish immedietely, delay or wait for a user response etc. 

Deferred - publisher that give us not execute Future immediately (other publisdhers not execute immediately)

Just - publisher that makes from any variable a publisher. Send it to pipeline one time and stop the pipeline.

PassthroughSubject - publisher (like  the CurrentValueSubject) that doesn't hold on to a value. It allows us to create a pipeline to send value through.

Sequence - publisher that sends elements of a collection through a pipeline one at a time. Once all items have been sent, the pipeline finishes. No more items even if we add more it to the collection later.

**Operators**

.map - simple operator to do logic operations.

.tryMap - has an option to throw an error

.delay - operator that give us to specify time and thread for long operations.

**Subscribers**

.assign(to:) - simple subscriber to write value from operators to property.

.store(in:) - uses instead assign(to:) when we need to add cancel() funcrion to more than one property (multiCancellable pipline). 

.sink - subscriber returns us AnyCancellable class which has one function in its protocol Cancellable - cancel(). We can stop pipeline manualy.
