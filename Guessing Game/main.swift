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
    
  
    
    //This is the number of guesses a user has to get it right.
    var numberOfGuesses = 5
    
    //Welcome the user and prompt them for input
    print("Welcome to the guessing game! You must be really bored if you are playing this. Anyways, have fun.")
    print("Go ahead and guess a number between 0 and 100. Try to be smart about it.")
    var userGuess = Int(readLine()!)
    
    //If the user enters a value that can't be converted to an interger, userGuess will equal nil.
    
    //Input Validation
    while userGuess == nil {
        //Prompt the user to enter a valid number
        print("How about using a number this time since this is a guessing game based around numbers...")
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
            print("You have  \(numberOfGuesses) tries remaining. Try to make them count.")
            if userGuess! < randomNumber {
                print("Try picking a higher number this time but not too high ;).")
            } else if userGuess! > randomNumber { 
                print("Try picking a lower number but not too low ;).")
            }
            userGuess = Int(readLine()!)
            
            while userGuess == nil {
                //Prompt the user to enter a valid number
                print("How about using a number this time since this is a guessing game based around numbers...")
                //Get user input again
                userGuess = Int(readLine()!)
            }
        }
    }
    //Check to see if the user is out of guesses and hasn't guessed the correct number.
    if numberOfGuesses == 1 && userGuess != randomNumber {
        //Tell the user they are out of tries, and prompt them on if they want to play again.
        print("You ran out of tries. I told you to use them wisely.. The correct answer was \(randomNumber). Better luck next time.")
        print("Do you want to try and redeem yourself or are you going to just give up? Y/N")
        var stillPlaying = readLine()!.uppercased()
        while stillPlaying != "Y" && stillPlaying != "N" {
            print("Do you want to try and redeem yourself or are you going to just give up? Y/N")
            stillPlaying = readLine()!.uppercased()
        }
        if stillPlaying == "N" {
            playingGame = false
        }
    }
    
        
    
        //Check to see if the user guess is equal to the random number.
    if userGuess == randomNumber {
            print("You guessed the number! I guess you do have what it takes. Look at you..")
            print("Would you like to play again and waste more of your time? Y/N")
            
            var stillPlaying = readLine()!.uppercased()
            while stillPlaying != "Y" && stillPlaying != "N" {
                print("Would you like to play again and waste more of your time? Y/N?")
                stillPlaying = readLine()!.uppercased()
                
            }
            if stillPlaying == "N" {
                playingGame = false
            }
        }
    } while playingGame == true


