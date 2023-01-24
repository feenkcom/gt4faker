Extension { #name : #FakerOpenAIImage }

{ #category : #'*GToolkit4Faker' }
FakerOpenAIImage >> gtJsonFor: aView context: aContext [
	<gtView>
	aContext at: #gtTreeExpansionLevel ifAbsentPut: [ 1 ].

	^ aView forward
		title: 'JSON';
		priority: 20;
		object: [ self json ];
		view: #gtTreeFor:context:
]

{ #category : #'*GToolkit4Faker' }
FakerOpenAIImage >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 10;
		stencil: [ BrAsyncFileWidget new
				padding: (BlInsets all: 10);
				url: self url asZnUrl;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical matchParent ] ]
]
