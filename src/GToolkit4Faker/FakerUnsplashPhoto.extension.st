Extension { #name : #FakerUnsplashPhoto }

{ #category : #'*GToolkit4Faker' }
FakerUnsplashPhoto >> gtJsonFor: aView context: aContext [
	<gtView>
	aContext at: #gtTreeExpansionLevel ifAbsentPut: [ 1 ].

	^ aView forward
		title: 'JSON';
		priority: 20;
		object: [ self json ];
		view: #gtTreeFor:context:
]

{ #category : #'*GToolkit4Faker' }
FakerUnsplashPhoto >> gtPreviewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Preview';
		priority: 10;
		stencil: [ BrVerticalPane new
				padding: (BlInsets all: 10);
				matchParent;
				alignCenter;
				in: [ :aPane | 
					aPane
						addChild: (BrAsyncFileWidget new
								url: self smallUrl asZnUrl;
								constraintsDo: [ :c | 
									c horizontal matchParent.
									c vertical matchParent ]) ];
				in: [ :aPane | 
					| aText |
					aText := (self description ifNil: [ '' ]) asRopedText.
					self userName
						ifNotNil: [ :aName | 
							aText
								append: ' by ' asRopedText;
								append: aName asRopedText ].

					aPane
						addChild: (BrEditor new
								hFitContentLimited;
								fitContent;
								text: aText;
								aptitude: (BrGlamorousRegularEditorAptitude new
										foreground: BrGlamorousColors disabledButtonTextColor)) ];
				yourself ]
]
