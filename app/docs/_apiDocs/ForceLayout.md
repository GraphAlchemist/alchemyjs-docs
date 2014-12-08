---
position: 2
title: Force Layout
---

# ForceLayout

<p></p>

##### alchemy.forceLayout.start()
<!-- -->
`alchemy.forceLayout.start()`<br>
This method starts up the force layout.  Any fixed nodes, such as root nodes or nodes that have been fixed by clicking/dragging will remain fixed.
Any other node can and will be adjusted by the force layout.  Because it recalculates position of all nodes from the beginning of the algorithm,
non-fixed nodes may end up in positions far from where you left them.  For a more consistent and less radical change, use `alchemy.forceLayout.toggle()`
which resumes the current force layout instead of starting a new one.

##### alchemy.forceLayout.stop()
<!-- -->
`alchemy.forceLayout.stop()`<br>
This method stops the force layout.  All nodes and edges will remain in the position that they are in when the method is called until either
`alchemy.forceLayout.start()` or `alchemy.forceLayout.toggle()` is called.

##### alchemy.forceLayout.toggle()
<!-- -->
`alchemy.forceLayout.toggle()`<br>
If the force layout is currently running, this method will cause it to stop and freeze all nodes/edges in their position until `alchemy.forceLayout.start()`
is called, or `alchemy.forceLayout.toggle()` is called again.  If the force layout is currently stopped, calling it will resume the current layout.  In most
cases this is what you should use for starting and stopping the layout, as `alchemy.forceLayout.start()` will generate a new layout and may change positions of
nodes more freely.
