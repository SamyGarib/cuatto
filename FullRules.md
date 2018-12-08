# Basic Rules

The field is composed of 12 to 24 four-checkers-sized positions.
Each team has 6 checkers (or more, or less).

The goal of the game is to move all of your checkers from the start position to the end position. The first team that gets all of its checkers out of the board wins.

On each turn, a player throws 2 dice, and has two movements to make, for each die face value.

The checker can move if the position where it lands is not full, and is not blocked by another team.
 1. A position is full if it has four checkers on it.
 2. A position is blocked for a team, if it has two or more checkers of another team (at least two of that same team).

If a checker is in a position that becomes blocked by another team, that checker is hit and must start over from the beginning of the board. In other words: if that team place a second checker in a position. All other checkers in that position that are not his teams are hit.

As a conclusion bonus: Note that Two, three, and four different teams share the same position at once. In this, it differs from many games.

# Special Rules
As far as I have tested this rules, they are very simple to follow and produce a fun game that can be enjoyed by kids, yet, you can use special rules to spice up the game mechanics, and create a game that is very, very intresting.

These special rules are (as of now) structures or classes of checkers. Each with special behaviors.

## Checker Classes:

I have developed 2 kinds, but many more could be added.

### Pin
- This checker pins other teams checkers on the position it currently stands. 
- If a team's pin is in the same position of other team's checkers, those checkers can not move, until the pin is removed, or hit. 
- Pin do not pin pins. Or, if you have a pin in a position, along with another's team pin, both can move.
### Strong
- This checker is stronger than the others, and hits every other checker that is not in his team.
- If a strong checker lands in a position where another team's pin is (alone), that pin is hit and has to go back.
- If a pin lands in a position where a strong checker is (alone), that pin pins the strong checker.
- If a strong checker lands in a position where another team's strong checker is (alone), that strong checker is hit and has to go back.
