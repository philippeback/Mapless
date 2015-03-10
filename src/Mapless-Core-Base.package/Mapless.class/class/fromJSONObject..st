actions
fromJSONObject: aJsonObjectOrNilOrArray

	| modelClass | 
	aJsonObjectOrNilOrArray ifNil: [ ^ nil ].
	aJsonObjectOrNilOrArray isArray ifTrue: [ ^ self fromJSONObjects: aJsonObjectOrNilOrArray ].
	
	"returns Mapless instances if there is no modelClass" 
	modelClass := aJsonObjectOrNilOrArray at: 'modelClass' ifAbsent: [ 'Mapless' ].
	
	^ (Smalltalk at: modelClass asSymbol) basicNew 
		initializeOn: aJsonObjectOrNilOrArray asJsonObject;
		yourself 
