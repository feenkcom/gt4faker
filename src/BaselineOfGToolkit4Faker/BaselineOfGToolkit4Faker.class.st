Class {
	#name : #BaselineOfGToolkit4Faker,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4Faker
}

{ #category : #baseline }
BaselineOfGToolkit4Faker >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'Faker'
				with: [ spec repository: 'github://feenkcom/faker:main/src' ].
			spec package: 'GToolkit4Faker' ]
]
