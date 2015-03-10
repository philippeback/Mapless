tests
testDestroy

	| people |
	
	self do: [ 
	people := OrderedCollection new.

	Character alphabet do: [ :char |
		people add: (DummyPerson new
						firstName: char asString;
						yourself)].
	
	self assert: ( people allSatisfy: [ :guy | guy isUnsaved ] ).	

	people do:[ :guy | guy save ] .
	


	self assert: ( people allSatisfy: [ :guy | guy isUnsaved not ] ).	
	self assert: ( people allSatisfy: [ :guy | guy isDeleted not ] ).	
	
	people do:[ :guy | guy destroy ] .

	Transcript nextPutAll: 'TEST';cr.
	self assert: ( people allSatisfy: [ :guy | 
		| notExists |
		self halt.
		notExists := ( DummyPerson existsId: guy id ) not.
		Transcript 
			nextPutAll: 'test - ';
			nextPutAll: guy firstName; 
			nextPutAll: ' ?Not exists:';
			nextPutAll: notExists asString; 
			cr;
			flush.
		notExists
		] ).
	
	
	]
