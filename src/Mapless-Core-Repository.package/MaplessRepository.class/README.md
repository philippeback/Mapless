A MaplessRepository is an abstraction for all the repository supported by Mapless.

Subclasses are concrete strategies for having Mapless supported by each repository.

Each MaplessRepository is connected to a single database.

e.g.

repo := ConcreteMaplessRepository onDatabaseName: 'db'.

from there, one can use the MaplessRepository features.

Of importance we find:

repo 
	hasCollectionNamed: 'searchForMeCollection';
	addCollection: 'someCollection';
	ensureCollectionNamed: 'anotherCollection';
	idOf: aMapless; "asks aMapless idAttribute"
	delete: aMapless;
	save: aMapless. "This one must be provided by concrete subclasses"

There are a couple of  hooks that will be triggered on Mapless objects (one may want to override these in Mapless subclasses)

onBeforeDelete			onAfterDelete
onBeforeDestroy 		onAfterDestroy
onBeforeInsert			onAfterInsert
onBeforeSave 			onAfterSave

onAfterRead

Look for the subclasses for concrete additional features.

Concrete subclasses have to implement a couple of things like save: aMapless
