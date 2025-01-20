'Please <Enter> to roll' display.
guess := stdin nextLine. "Wait for user input"
roll := [:lower :upper | (Random new between: lower and: upper)].
total := 0.


rollDie := [
    "Generates a random number between 1 and 6"
    roll value: 1 value: 6
].


"Game loop starts here"
dieValue := rollDie value. "Get the first roll"
[dieValue = 1] whileFalse: [
    'You rolled a ' display. dieValue displayNl.
    total := total + dieValue.
    'Please <Enter> to roll' display.
    guess := stdin nextLine. "Wait for user input"
    dieValue := rollDie value. "Generate the next roll"
].


('You rolled a total of ', total asString) display.
' before rolling a 1. ' displayNl.

