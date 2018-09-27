Class {
	#name : #BaselineOfArtefact,
	#superclass : #BaselineOf,
	#category : #BaselineOfArtefact
}

{ #category : #baselines }
BaselineOfArtefact >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec 
			project: 'Units' with: [
				spec
					className: #ConfigurationOfUnits;
					versionString: '1.1-baseline';
					repository: 'http://smalltalkhub.com/mc/MarcusDenker/Units/main' ];
			project: 'Stylesheet' with: [
				spec
					className: #ConfigurationOfStylesheet;
					versionString: '0.2-baseline';
					repository: 'http://smalltalkhub.com/mc/RMoD/Stylesheet/main/' ].
		spec 
			package: 'Artefact-Core' with: [
				spec requires: #('Units' 'Stylesheet' ). ];
			package: 'Artefact-Examples' with: [
				spec requires: #('Artefact-Core' ). ];
			package: 'Artefact-Tests' with: [
				spec requires: #('Artefact-Core' 'Artefact-Examples' ). ].
		spec 
			group: 'default' with: #('core' 'tests' 'examples' );
			group: 'core' with: #('Artefact-Core' );
			group: 'tests' with: #('Artefact-Tests' );
			group: 'examples' with: #('Artefact-Examples' ). ].

]
