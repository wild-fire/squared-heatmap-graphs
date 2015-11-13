This repo contains code to create a special kind of heatmaps that highlights the importance of a cell in the context of a column. This means that, the closer to black is a cell, the higher it's value in comparison with the values on the same column.

We are using it to compare kshell, controllability and pageranks measures so we can answer the following questions:

- Given a shell number, which controllability is more usual?
- Given a shell number, which pagerank is more usual?
- Given a controllability range, in which shell there are more nodes with that controllability?
- Given a PageRank range, in which shell there are more nodes with that PageRank?

Right now we create the following graphs:

- heatmaps/shell-controllability-by-controllability.jpg

  * Rows: Controllability range, from 0 (left) to 1 (right) in increments of 0.01 .
  * Columns: Shell number, from 2 (down) to 9 (up).

So, in each column the darkest pixels show the shell that has more nodes with a controllability in that controllability range.

- heatmaps/shell-controllability-by-shell.jpg

  * Rows: Shell number, from 2 (left) to 9 (right).
  * Columns: Controllability range, from 0 (down) to 1 (up) in increments of 0.01 .

So, in each column the darkest pixels show the more common controllability range for that shell.

- heatmaps/shell-pagerank-by-pagerank.jpg

  * Rows: PageRank range, from 0 (left) to 1 (right) in increments of 0.01 .
  * Columns: Shell number, from 2 (down) to 9 (up).

So, in each column the darkest pixels show the shell that has more nodes with a PageRank in that PageRank range.

- heatmaps/shell-pagerank-by-shell.jpg

  * Rows: Shell number, from 2 (left) to 9 (right).
  * Columns: PageRank range, from 0 (down) to 1 (up) in increments of 0.01 .

So, in each column the darkest pixels show the more common PageRank range for that shell.

- heatmaps/controllability-pagerank-by-controllability.jpg

  * Rows: Controllability range, from 0 (left) to 1 (right) in increments of 0.01 .
  * Columns: PageRank range, from 0 (down) to 1 (up) in increments of 0.01 .

So, in each column the darkest pixels show the PageRank range that has more nodes with a Controllability in that Controllability range.

- heatmaps/controllability-pagerank-by-pagerank.jpg

  * Rows: PageRank range, from 0 (left) to 1 (right) in increments of 0.01 .
  * Columns: Controllability range, from 0 (down) to 1 (up) in increments of 0.01 .

So, in each column the darkest pixels show the Controllability range that has more nodes with a PageRank in that PageRank range.
