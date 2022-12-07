# [Operation Queue vs Dispatch Queue](https://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
**OperationQueue** internally uses **Grand Central Dispatch** and on iOS.

**OperationQueue** gives you a lot more control over how your operations are executed. You can define dependencies between individual operations for example, which isn't possible with plain **GCD queues**. It is also possible to cancel operations that have been enqueued in an **OperationQueue** (as far as the operations support it). When you enqueue a block in a **GCD dispatch queue**, it will definitely be executed at some point.

To sum it up, **OperationQueue** can be more suitable for long-running operations that may need to be cancelled or have complex dependencies. **GCD dispatch queues** are better for short tasks that should have minimum performance and memory overhead.

*P.S. With **OperationQueue** it is also possible to make a barrier, but very confusing.*
