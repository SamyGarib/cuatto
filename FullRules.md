# Basic Rules

![Diagrama Tablas Partida][dostablas]
The field is composed of 12 to 24 four-checkers-sized positions.
Each team has 6 checkers.

The goal of the game is to move all of your checkers from the start position to the end position. The first team that gets all of its checkers out of the board wins.

In the basic form, the starting position of the team is just outside the board (position 0, where everybody is).

On each turn, a player throws 2 dice, and has two movements to make, for each die face value. 

The checker can move if the position where it lands is not full, and is not blocked (owned) by another team.
 1. A position is full if it has four checkers on it.
 2. A position is blocked (owned) by a team, if it has two or more of it checkers in it.

If a checker is in a position that becomes blocked by another team, that checker is hit and must start over from the beginning of the board. In other words: if that team place a second checker in a position, all other checkers in that position that are not his teams are hit.


![Hit and Block][hitandblock]


That's it!.

As far as I have tested this rules, they are very simple to follow and produce a fun game that can be enjoyed by kids.

# Special Rules

You can use special rules to spice up the game mechanics, and create a game that is super fun and more complex.

These special rules are (as of now) special structures and classes of checkers. Each, with their own behavior.

## Checker Classes:

I developed 2 kinds, but many more could be added.

### Pin
- This checker pins other teams checkers on the position it currently stands. 
- If a team's pin is in the same position of other team's checkers, those checkers can not move, until the pin is removed, or hit. 
- Pin do not pin pins. If you have a pin in a position, along with another's team pin, both can move.

### Strong
- This checker is stronger than the others, and hits every other checker that is not in his team.
- If a strong checker lands in a position where another team's pin is (alone), that pin is hit and has to go back.
- If a pin lands in a position where a strong checker is (alone), that pin pins the strong checker.
- If a strong checker lands in a position where another team's strong checker is (alone), that strong checker is hit and has to go back.


## Board Structures:

### The Bridges. 
- The bridge is an special part of the board, fist concieved (and only tested) as the starting position, but it maybe usable on middle field. 
- On a bridge there are 6 (or less), 1-checker-sized positions, and each checker on it blocks the path of those who are behind. They can not pass it.
- As a starting position, you put each team on its own bridge, an they start playing from that given position following the above rule until they reach the middle field.
- If a checker is hit, it must come back to the first free position of that bridge.
- You can skip bridges entirely when playing with kids if you like, and use a free start position for each team member.
- I guess you can use the bridge as a ending point too. I have not figure it out a rule that makes sense for that yet (without making an horrorifically luck oriented ending).

  
[sampleboard]: https://github.com/SamyGarib/cuatto/raw/master/images/gameplay/playing.jpeg "Board and Team Showcase"
[elements1]: https://github.com/SamyGarib/cuatto/raw/master/images/render/elements2.png "Board and Team Showcase"
[collage1]: https://github.com/SamyGarib/cuatto/raw/master/images/gameplay/collage1.png "Pictures"
[dostablas]: https://github.com/SamyGarib/cuatto/raw/master/images/tutorial/dostablas.png "Pictures"
[hitandblock]: https://github.com/SamyGarib/cuatto/raw/master/images/tutorial/hitandblock.png "Pictures"
