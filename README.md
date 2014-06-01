Getting started...
==================

```
git clone https://github.com/BpCodingDojo/MineFieldKata.git
```

### ...and finished

At the end of the session, please commit your work to the directory of your team.

```
git add .
git commit -a -m "Fokakrem"
git fetch
git push
```

## MineFieldKata
A field of N x M squares is represented by N lines of exactly M characters each. The character '*' represents a mine and the character '.' represents no-mine.

###Example input 1
*(a 4 x 3 mine-field of 12 squares, 2 of
which are mines)*

```
*...
..*.
....
```

Your task is to write a program to accept this input and produce as output a hint-field of identical dimensions where each square is a * for a mine or the number of adjacent mine-squares if the square does not contain a mine.

###Example output 1
*(for the above input)*

```
*211
12*1
0111
```

## User choice
Extend your program to display the output of an actual game step. It takes a new input which is the selected field from the user. The program has to produce the new state which can be displayed for the user after his selection.

###Example input 2
1. The minefield input from the first example
2. The user chose the 0x1 coordinate (the first row, second column)

###Example output 2

```
.2..
....
....
```

###Example input 3
1. The input from the first example
2. The user chose the mine (0x0 coordinate)

###Example output 3

```
Congratulation, You just LOST the game! :)
```

## User shoots bingo
If the user choose a 0-field, the program has to reveal all of the adjacent 0-fields which are connected to each other and the fields in the boundaries.   


###Example input 3
1. The minefield input from the first example
2. The user chose the 2x0 coordinate (the last row, first column)


###Example output 3
```
....
12..
01..
```

## The game process
The program has to be able to handle the process of a whole game:

1. The user can choose fields until all of the fields without a mine are revealed
2. If all numbered fields are revealed it has to end with a message: `You just survived the nightmare! :(`
3. If the user chose a mine-field then the game is over and he cannot choose another field.