# CombineLearning

Repo for adding materials of learning Combine framework. Status in process.



**Publishers**

@Published - property wrapper with ObservableObject to notify any view that @Published has been changed. We use it with @StateObject.

Empty - publisher that publishes nothing. Immediately or fail immediately (or keep pipeline open without complete).

Fail - publisher that published a failure (with an error). If input is valid, return a publisher, else return a Fail publisher.

**Operators**

.map - simple operator to do logic operations.

.tryMap - has an option to throw an error

.delay - operator that give us to specify time and thread for long operations.


**Subscribers**

.assign(to:) - simple subscriber to write value from operators to property.

.store(in:) - uses instead assign(to:) when we need to add cancel() funcrion to more than one property (multiCancellable pipline). 

.sink - subscriber returns us AnyCancellable class which has one function in its protocol Cancellable - cancel(). We can stop pipeline manualy.
