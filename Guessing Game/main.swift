//
//  main.swift
//  Guessing Game
//
//  Created by Miranda Jessie on 8/20/18.
//  Copyright © 2018 Miranda Jessie. All rights reserved.
//

import Foundation

//Variable that determines whether or not we're still playing the game.
var playingGame = true

//This loop will run while we are playing the game
repeat {
    //This is the random number that we have generated. We cast it from a UInt32 to an Int.
    let randomNumber = Int(arc4random_uniform(101))
    
    print("Random number: \(randomNumber)")
    
    //This is the number of guesses a user has to get it right.
    var numberOfGuesses = 5
    
    //Welcome the user and prompt them for input
    print("Welcome to the guessing game!")
    print("Please guess a number between 0 and 100.")
    var userGuess = Int(readLine()!)
    
    //If the user enters a value that can't be converted to an interger, userGuess will equal nil.
    
    //Input Validation
    while userGuess == nil {
        //Prompt the user to enter a valid number
        print("Wrong.Try using a number.")
        //Get user input again
        userGuess = Int(readLine()!)
    }
    
    //make another if statement that says if the user's guess is not equal to the random number, print out whether the guess is too high or too low.
    
    if userGuess! != randomNumber {
        //While the user hasn't guessed the random number and still has guesses remaining.
        while userGuess! != randomNumber && numberOfGuesses > 1 {
            //Remove a guess
            numberOfGuesses -= 1
            //Tell the user how many tries they have remaining
            print("You have  \(numberOfGuesses) tries remaining.")
            if userGuess! < randomNumber {
                print("Try picking a hgher number.")
            } else if userGuess! > randomNumber {
                print("Try picking a lower number.")
            }
            userGuess = Int(readLine()!)
            
            while userGuess == nil {
                //Prompt the user to enter a valid number
                print("How about you try using a number this time.")
                //Get user input again
                userGuess = Int(readLine()!)
            }
        }
    }
    //Check to see if the user is out of guesses and hasn't guessed the correct number.
    if numberOfGuesses == 1 && userGuess != randomNumber {
        //Tell the user they are out of tries, and prompt them on if they want to play again.
        print("You ran out of tries. The correct answer was \(randomNumber).")
        print("Do you want to play again? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Would you like to play agian? Y/N")
            stillPlaying = readLine()!
        }
        if stillPlaying == "N" {
            playingGame = false
        }
    }
    
        
    
        //Check to see if the user guess is equal to the random number.
    if userGuess == randomNumber {
            print("You guessed the number!")
            print("Would you like to play again? Y/N")
            
            var stillPlaying = readLine()!.uppercased()
            while stillPlaying != "Y" && stillPlaying != "N" {
                print("Would you like to play again?")
                stillPlaying = readLine()!.uppercased()
                
            }
            if stillPlaying == "N" {
                playingGame = false
            }
        }
    } while playingGame == true
