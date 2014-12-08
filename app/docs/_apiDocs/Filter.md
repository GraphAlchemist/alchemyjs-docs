---
position: 2
title: Filter
---

# Filter
<p></p>

Filtering in alchemy refers to the hiding and showing of particular nodes and edges.

Filtering via the API can work in two ways.
First, it can be called on the top level with `alchemy.filter.nodes()` and `alchemy.filter.edges()` if you want to filter from all nodes and all edges.

If you want to filter based on a subset of those elements, `filter()` can also be called on an alchemy selection. eg: `alchemy.get.nodes(...).filter()`.

##### alchemy.filter.nodes()
<!-- -->
`alchemy.filter.nodes(type)`<br>
This will filter all nodes of the passed in type.  Doing this requires that you have set the `nodeTypes` key in your configuration.

##### alchemy.filter.edges()
<!-- -->
`alchemy.filter.edges(type)`<br>
This will filter all edges of the passed in type.  Doing this requires that you have set the `edgeTypes` key in your configuration.

##### alchemySelection.filter()
<!-- -->
`alchemy.get.nodes(nodeIDs).filter(type)`<br>
`alchemy.get.edges(edgeIDs).filter(type)`<br>
This will filter the elements in the current selection based on the type passed in.  Doing this requires that you have set `nodeTypes` and `edgeTypes` keys in your configuration.
`filter()` can be called on any selection, including those returned by the `search()` API endpoint.
