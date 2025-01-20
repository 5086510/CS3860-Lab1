"Define the rolling function"
roll := [:lower :upper | (Random new between: lower and: upper)].
rollDie := [
    "Generates a random number between 1 and 6"
    roll value: 1 value: 6
].

"Initialize scores"
playerScore := 0.
computerScore := 0.
gameOver1 := 1.

('Your turn. Please <Enter> to roll or type "h" to hold: ') display.
guess := stdin nextLine.

"Player's Turn"
[   
    guess = 'h' ifTrue: [
        ('You decided to hold. Your total score is ', playerScore asString) displayNl.
        "Player holds their turn; switch to computer"
        ^[
            "Call the computers turn"
            'Computers turn...' displayNl.
            [gameOver1 = 1] whileTrue: [
                dieValue := rollDie value. "Roll the die"

                computerScore := computerScore + dieValue.

                (computerScore > 25) ifTrue: [
                    'The computer''s score exceeded 25. Human BEATS Computer.' displayNl.
                    ^self.
                ].

                (computerScore = 25) ifTrue: [
                    'The computer reached 25 points. WE HAVE A TIE!' displayNl.
                    ^self.
                ].

                (computerScore > playerScore) ifTrue: [
                    ('Computer rolled a ', dieValue asString, '. Computers total score is ', computerScore asString) display.
                    '. The computer beat your score! Computer BEATS Human.' displayNl.
                    ^self.
                ].

                dieValue = 1 ifTrue: [
                    'The computer rolled a 1! Human BEATS Computer.' displayNl.
                    ^self.
                ].

                ('Computer rolled a ', dieValue asString, '. Computers total score is ', computerScore asString) displayNl.
            ].
        ] value. "Execute computers turn"
    ].


    dieValue := rollDie value. "Roll the die"
    playerScore := playerScore + dieValue.

    (playerScore = 25) ifTrue: [
        'Congratulations! You reached 25 points. Computer will now play to try for a tie...' displayNl.
        "Player wins; switch to computer"
        ^[
            "Call the computers turn"
            'Computers turn...' displayNl.
            [gameOver1 = 1] whileTrue: [
                dieValue := rollDie value. "Roll the die"

                computerScore := computerScore + dieValue.

                (computerScore > 25) ifTrue: [
                    'The computer''s score exceeded 25. Human BEATS Computer.' displayNl.
                    ^self.
                ].

                (computerScore = 25) ifTrue: [
                    'The computer reached 25 points. WE HAVE A TIE!' displayNl.
                    ^self.
                ].

                (computerScore > playerScore) ifTrue: [
                    ('Computer rolled a ', dieValue asString, '. Computers total score is ', computerScore asString) display.
                    '. The computer beat your score! Computer BEATS Human.' displayNl.
                    ^self.
                ].

                dieValue = 1 ifTrue: [
                    'The computer rolled a 1! Human BEATS Computer.' displayNl.
                    ^self.
                ].

                ('Computer rolled a ', dieValue asString, '. Computers total score is ', computerScore asString) displayNl.
            ].
        ] value. "Execute computers turn"
    ].

    dieValue = 1 ifTrue: [
        'You rolled a 1! You lose the game. Computer BEATS Human.' displayNl.
        ^self. "End the game if player rolls a 1"
    ].

    (playerScore > 25) ifTrue: [
        ('You rolled a ', dieValue asString) display.
        '. Your score exceeded 25. You lose the game. Computer BEATS Human.' displayNl.
        ^self. "End the game if player exceeds 25"
    ].

    ('You rolled a ', dieValue asString, '. Your total score is ', playerScore asString) displayNl.
    ('Your turn. Please <Enter> to roll or type "h" to hold: ') display.
    guess := stdin nextLine.
] repeat.
