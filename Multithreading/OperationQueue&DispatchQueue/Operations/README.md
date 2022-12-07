# [Operations](https://www.avanderlee.com/swift/operations/)
**Operations** in Swift are a powerful way to separate responsibilities over several classes while keeping track of progress and dependencies. They’re formally known as **NSOperations** and used in combination with the **OperationQueue**.

- OperationQueue.main – main UI queue.
- OperationQueue.current – current queue.

*Quality of Service:*
- **userInteractive** = 33
- **userInitiated** = 25
- **utility** = 17
- **background** = 9
- **default** = -1

## Concurrenct Queues (Default)
<img src="./Diagram1.png" />

## Serial Queues (Count = 1)
<img src="./Diagram2.png" />

## Life Сycle
<img src="./Diagram3.png" />

## Async Task
<img src="./Diagram4.png" />

## Cancel
<img src="./Diagram5.png" />

## Deadlock Dependencies
<img src="./Diagram6.png" />
