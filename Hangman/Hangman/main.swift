//
//  main.swift
//  Hangman
//
//  Created by Alex Paul on 10/15/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "booty", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

//required variables

var alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z"
var alphabetArray = Array(alphabet.components(separatedBy: " "))

let gallow = """
____
|   |
|
|
|
|
|___
"""


let head = """
____
|   |
|  🤨
|
|
|
|___
"""

let body = """
____
|   |
|  🤨
|  ||
|
|
|___
"""


let arm1 = """
____
|   |
|  🤨
| /||
|
|
|___
"""

let arm2 = """
____
|   |
|  🤨
| /||\
|
|
|___
"""

let leg1 = """
____
|   |
|  🤨
| /||)
|  /
|
|___
"""

let leg2 = """
____
|   |
|  🤨
| /||)
|  /\
|
|___
"""



//generates random word

func wordGenerator () -> [String] {
    let randomWord = allTheWords.randomElement()
    var hangArray = [String]()
    if let unboxed = randomWord {
        for i in unboxed {
            hangArray.append(String(i))
        }
    }
    return hangArray
}


// generates empty display

func emptyDisplay (_ int: Int) -> [String] {
    var visibleDisplay = [String]()
    for _ in  0..<int {
        visibleDisplay.append("_")
    }
    return visibleDisplay
}


//gets the user's input

func getInput() -> String? {
    print("Enter a letter! " , terminator: "")
    let lineIn = readLine()
    return lineIn
}


// determines if the user won or lost then asks them if they want to play again

func gameOver(_ userDisplay: [String], _ hangWord: [String], _ totalGuesses: Int) -> Bool {
    var anotherGame: Bool = false
    var userResponse: Bool = false
    var word = String()
    
    for i in hangWord {
        word += i
    }
    
    if userDisplay == hangWord {
        print("Congratulations! You won in \(totalGuesses) guesses! Would you like to play again? y: yes  or  n: no")
    } else {
        print("Game over! The word was: '\(word)'. Would you like to play again? y: yes  or  n: no")
    }
    
    while userResponse == false {
        let playAgain = getInput()?.lowercased()
        if let playAgain = playAgain {
            if playAgain == "y" {
                anotherGame = true
                userResponse = true
                print("\n")
            } else if playAgain == "n" {
                anotherGame = false
                userResponse = true
            } else {
                print("Sorry, \(playAgain) is not a valid response. Enter either 'y' to play again or 'n' to stop the game.")
            }
        }
    }
    return anotherGame
}



//core game loop

func gameLoop() {
    var totalGuesses = 0
    var wrongGuesses = 0
    var previousGuesses = [String]()
    var tries = 6
    let hangWord = wordGenerator()
    var userDisplay = emptyDisplay(hangWord.count)
    print(gallow)
    print(userDisplay)
    
    
    while userDisplay != hangWord && tries != 0 {
        if let userInput = getInput() {
            if userInput == "" || userInput == " " {
                print("Type a letter please!")
                continue
            }
            
            if userInput.count != 1 {
                print("One letter at a time please. And no special characters!")
                continue
            }
            if previousGuesses.contains(userInput.lowercased()) {
                print("You already guessed that letter! Please choose a different one. Previous guesses: \(previousGuesses)" )
                continue
            }
            if alphabetArray.contains(userInput.lowercased()) {
                
                totalGuesses += 1
                previousGuesses.append(userInput.lowercased())
                
                if hangWord.contains(userInput.lowercased()) == true {
                    for (i,v) in hangWord.enumerated() {
                        if userInput.lowercased() == v {
                            userDisplay[i] = v
                        }
                    }
                    print("You guessed a letter!")
                    print("")
                    print("Previous guesses: \(previousGuesses)")
                    print("")
                    print(userDisplay)
                } else {
                    wrongGuesses += 1
                    switch wrongGuesses {
                    case 1: print(head)
                    case 2: print(body)
                    case 3: print(arm1)
                    case 4: print(arm2)
                    case 5: print(leg1)
                    case 6: print(leg2)
                    default: continue
                    }
                    tries -= 1
                    if previousGuesses.contains(userInput.lowercased()) == false {
                        previousGuesses += [userInput.lowercased()]
                    }
                    if tries == 1 {
                        print("Sorry, try again! You have \(tries) try remaining.")
                        
                    }
                    if tries > 1 {
                        print("Sorry, try again! You have \(tries) tries remaining.")
                        
                    }
                    print("")
                    print("Previous guesses: \(previousGuesses)")
                    print("")
                    print(userDisplay)
                }
            } else {
                print("\(userInput) is not a letter. Letters only please!")
            }
        }
        
    }
    if gameOver(userDisplay, hangWord, totalGuesses) {
        gameLoop()
    }
    
}

gameLoop()

