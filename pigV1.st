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
    total := total + dieValue.
    'You rolled a ' display. dieValue display.
    (' and your total is ', total asString) displayNl.
    'Please <Enter> to roll, or q to stop ' display.
    guess := stdin nextLine. "Wait for user input"
    guess = 'q' ifTrue: [^this].
    dieValue := rollDie value. "Generate the next roll"
].

(dieValue = 1) ifTrue: [

    ('You rolled a total of ', total asString) display.
    ' before rolling a 1. ' displayNl.
].

(dieValue = 1) ifFalse: [
    ('You rolled a total of ', total asString) displayNl.
].
