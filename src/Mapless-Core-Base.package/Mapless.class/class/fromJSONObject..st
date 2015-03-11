actions
fromJSONObject: aJsonObjectOrNilOrArray

	| modelClass | 
	aJsonObjectOrNilOrArray ifNil: [ ^ nil ].
	aJsonObjectOrNilOrArray isArray ifTrue: [ ^ self fromJSONObjects: aJsonObjectOrNilOrArray ].
	
	"returns Mapless instances if there is no modelClass" 
	modelClass := aJsonObjectOrNilOrArray at: 'modelClass' ifAbsent: [ 
		"Create instances of the Mapless type we want
		e.g. if there is no modelClass data, use the Mapless sublcass name"
		self name ].
	
	^ (Smalltalk at: modelClass asSymbol) basicNew 
		initializeOn: aJsonObjectOrNilOrArray asJsonObject;
		yourself 
