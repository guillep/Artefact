# Artefact

Artefact is a framework to generate PDF documents. It is fully written in Smalltalk and doesn't require any native library. Artefact is light, platform independant and offer to users a high level of abstraction in order to easily creating PDF documents.

- completely written in Smalltalk (and only Smalltalk),
- complete freedom about the order of creation for pages, elements... (no need to follow the document order)
- multi format and orientation for pages
- page composition based on reusables PDF elements,
- extensibility by offering a composition standard to create your own high level elements
- styleSheet that can be reused in many documents and avoid wasting time and place with duplication
- image support with JPEG and PNG formats
- pre-defined high level elements like datagrid
- support PDF compression to produce compact files

# How to Load

### Latest version (1.7.0) for Pharo7

```smalltalk
Metacello new
	baseline: 'Artefact';
	repository: 'github://pharo-contributions/Artefact:v1.7.0';
	load.
```

### Development version

```smalltalk
Metacello new
	baseline: 'Artefact';
	repository: 'github://pharo-contributions/Artefact';
	load.
```

# Documentation and others

You can check artefact's website [here](https://sites.google.com/site/artefactpdf/)

# ChangesLog

### Version 1.7.0

- adapted to Pharo7.0, changes in streams
 
