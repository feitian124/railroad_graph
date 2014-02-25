# RailroadGraph
this gem resolve below problem.

**Problem:**
   The local commuter railroad services a number of towns in Kiwiland.
   Because of monetary concerns, all of the tracks are 'one-way'.
   That is, a route from Kaitaia to Invercargill does not imply the existence of
   a route from Invercargill to Kaitaia.  In fact, even if both of these routes
   do happen to exist, they are distinct and are not necessarily the same distance!

   The purpose of this problem is to help the railroad provide its customers with
   information about the routes. In particular, you will compute the distance along
   a certain route, the number of different routes between two towns, and the shortest
   route between two towns.

 **Input:**
   A directed graph where a node represents a town and an edge represents a route
   between two towns.  The weighting of the edge represents the distance between
   the two towns.  A given route will never appear more than once, and for a given route,
   the starting and ending town willnot be the same town.

 **Output:**
   For test input 1 through 5, if no such route exists, output 'NO SUCH ROUTE'.
   Otherwise, follow the route as given; do not make any extra stops!
   For example, the first problem means to start at city A, then travel directly
   to city B (a distance of 5), then directly to city C (a distance of 4).

 1. The distance of the route A-B-C.
 2. The distance of the route A-D.
 3. The distance of the route A-D-C.
 4. The distance of the route A-E-B-C-D.
 5. The distance of the route A-E-D.
 6. The number of trips starting at C and ending at C with a maximum of 3 stops.
    In the sample data below, there are two such trips: C-D-C (2 stops). and C-E-B-C (3 stops).
 7. The number of trips starting at A and ending at C with exactly 4 stops.
    In the sample data below, there are three such trips: A to C (via B,C,D); A to C (via D,C,D);
    and A to C (via D,E,B).
 8. The length of the shortest route (in terms of distance to travel) from A to C.
 9. The length of the shortest route (in terms of distance to travel) from B to B.
 10. The number of different routes from C to C with a distance of less than 30.
     In the sample data, the trips are: CDC, CEBC, CEBCDC, CDCEBC, CDEBC, CEBCEBC, CEBCEBCEBC.

 **Test Input:**
   For the test input, the towns are named using the first few letters of the alphabet from A to E.
   A route between two towns (A to B) with a distance of 5 is represented as AB5.

   Graph: AB5, BC4, CD8, DC8, DE6, AD5, CE2, EB3, AE7

 **Expected Output:**

         Output #1: 9
         Output #2: 5
         Output #3: 13
         Output #4: 22
         Output #5: NO SUCH ROUTE
         Output #6: 2
         Output #7: 3
         Output #8: 9
         Output #9: 9
         Output #10: 7

## solution
This is a directed and weighted graph problem. The two most common ways to implement this would be an adjacency matrix and an adjacency list. As this problem isn’t very complex, the the adjacency matrix would be iterating over a lot of empty cells at O(|V|^2)  time. So for a sparse graph like this one, an adjacency list is better in terms of both, space and lookup/traversal times. Traversal in the adjacency list could be done at O(|V| + |E|) time, where V = # of Vertices, and E = # of edges.

---------------------------------------

## Installation

Add this line to your application's Gemfile:

    gem 'railroad_graph'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install railroad_graph

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
