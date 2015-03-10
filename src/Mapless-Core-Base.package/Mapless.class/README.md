I am the key model class.

One can set and get values from my instances without having to declare instVars (as I am using the DNU mechanism to build my own internal data dictionary).

I can provide a collection of concrete subclasses when you send me #modelClasses.

I can give my name with #singularName and #pluralName

Conversions

	Instances can be manipulated very easily.

	One can get nicely formatted data: 

		aMapless
			asBSON
			asDictionary;
			asJSONString.
	
		aMapless onBeforeJSON is a hook to be invoked during asJSONString
	
	Or write to streams:

		aMapless jsonWriteOn: aStream (this is used by asJSONString)


CRUD operations

There are a number of CRUD operations available for a Mapless:

Create

	Instances can be created from a JsonObject.

	e.g. aMapless := Mapless  
					fromReified: (Json readFrom: '{"key":"value"}' readStream).

Retrieve

	There are a couple of available methods for retrieval:
	
	Mapless
		find:
		find:limit:offset:
		findAll 
		findAllSortedBy:
		findId:
		findOne:
		first

	Instances of my subclasses are where it comes handy as collections will be named after them.
	
	Mapless subclass #Person

	persons := Person findAll.

	topOne := Person first.


	aMapless fresh - if not saved yet, no action. Otherwise, reload from underlying repository.

	fresh - if not saved yet, no action. Otherwise, reload from underlying repository.

Update

	A Mapless instance maintains an internal dictionary.
	
	One can access it: 

		aMapless data

	Fields can be filled in without having to define accessors: 

		aMapless startDate: DateAndTime now.

	This will create a #startDate entry in the data dictionary.

	One can retrieve it with: 

		aMapless startDate.

	Be careful to now use field names that are already existing (name comes to mind...)
	There, the best way is to use 

		aMapless at: #name put: 'value'
		aMapless at: #name

	There is no facility for at: ifAbsentPut: at this time. One has to do it through aMapless data

	One can create subclass Mapless and create actual accessors that will put information in the data dictionary.

	ensureId is useful to put a default Id on a Mapless.
	
	When wanting to persist a Mapless instance, one does:
	
		aMapless save.
		
	The semantic is that this will insert or/and update as appropriate. The underlying repository has to implement this properly.
	
	It is possible to insert only.
	
		aMapless insert.
		
	Or to update only.
	
		aMapless update.

Delete

	delete - mark as deleted. There is a isDeleted marker in the record. The record stays in the repository.
	destroy - remove from the repository.

Merging 

	There is special support for (deep) merging Mapless instances together.
	
	aMapless merge: anotherMapless	

Sanitizing

	There is support if one wants specific fields to be removed from aMapless:
	
	aMapless sanitize: #(#unwantedKey, #anotherUnwantedKey)
	
	


Still to explain:


createdOn 
ensureId


Submodels
----------------

aMapless setSubmodelsAndReferences
aMapless undereferenced

@TODO
	
Notes:
					
Mapless are meant to be treated as aggregates.

We don't care here about identity.

Why?

Because the idea is that you keep these objects small and uncomplicated enough to be more efficienty serialized/deserialized in JSON for using it is some sort of noSQL persistence support.

