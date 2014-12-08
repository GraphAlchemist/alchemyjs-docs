---
position: 2
title: Search
---

# Search

<p></p>

##### alchemySelection.search()
<!-- -->
`alchemy.get.nodes(nodeIDs...).search(query)`
`alchemy.get.edges(edgeIDs...).search(query)`

Performs a search on the current selection.
The query argument is a string and it searches through the 'caption' keys of any elements in the current selection.
Depending on whether the configuration option `searchMethod` is set to "contains" or "begins", the search can either find elements whose caption contains a substring of `query` or begins with the substring `query`.

##### alchemy.api.search.nodes()
<!-- -->
`alchemy.api.search.nodes(query)`

Performs a search on all node captions.
Depending on whether the configuration option `searchMethod` is set to "contains" or "begins", the search can either find elements whose caption contains a substring of `query` or begins with the substring `query`.


##### alchemy.api.search.edges()
<!-- -->
`alchemy.api.search.edges(query)`

Performs a search on all edge captions.
Depending on whether the configuration option `searchMethod` is set to "contains" or "begins", the search can either find elements whose caption contains a substring of `query` or begins with the substring `query`.



