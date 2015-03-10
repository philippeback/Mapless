A MaplessAbstractPool provides the support for managing a pool of clients.

Concrete pools have to subclass me.

The key message is used like:

ConcretePool instance do: [ :client | client  doSomething ]

one can also use: 
ConcretePool instance withClientDo: [ :client | client doSomething ]

both methods are equivalent.

The client being passed is a dynamicVariable.

I am providing a client to the block and make sure that it is returned to the pool after the call.

I maintain a list of busy clients and idle clients.

I can be printedOn: the Transcript to see how many clients I am managing.

Once can reset me through:

ConcretePool instance reset 

There is no limit to how many clients I am creating at this point.

