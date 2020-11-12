/**
 *
 *  Phase I: Callbacks

Write a function titleize that takes an array of names and a function (callback). 
titleize should use Array.prototype.map to create a new array full of titleized versions of each name - 
titleize meaning "Roger" should be made to read "Mx. Roger Jingleheimer Schmidt". 
Then pass this new array of names to the callback, which should use Array.prototype.forEach to print out each titleized name.

> titleize(["Mary", "Brian", "Leo"], printCallback);
Mx. Mary Jingleheimer Schmidt
Mx. Brian Jingleheimer Schmidt
Mx. Leo Jingleheimer Schmidt
undefined

Make sure it works before moving on!
 */

let printCallback = titleArr => {
    titleArr.forEach( titleNames => console.log(titleNames))
}

 let titleize = (names, printCallback) => {
    let titleArr = names.map(name => `Mx. ${name} Jingleheimer Schmidt`)
    printCallback(titleArr)
}

// titleize(["Mary", "Brian", "Leo"], printCallback);

/**
 * 
 * Phase II: Constructors, Prototypes, and this

First write a constructor function for an elephant. 
Each elephant should have a name, height (in inches), and array of tricks 
in gerund form (e.g. "painting a picture" rather than "paint a picture").

Next write a few prototype functions that will be shared among all elephants:

    Elephant.prototype.trumpet: should print "(name) the elephant goes 'phrRRRRRRRRRRR!!!!!!!'"
    Elephant.prototype.grow: should increase the elephant's height by 12 inches
    Elephant.prototype.addTrick(trick): add a new trick to their existing repertoire
    Elephant.prototype.play: print out a random trick, e.g. "(name) is (trick)!"
        Hint: look up some JS Math methods!

Make sure to create an elephant and test all of these functions out on them method style!
 */

function Elephant(name, height, tricks){
    this.name = name;
    this.height = height;
    this.tricks = tricks; // array 
}

Elephant.prototype.trumpet = function(){
    console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!`)
}
Elephant.prototype.grow = function(){
    this.height += 12
}

Elephant.prototype.addTrick = function(trick){
    this.tricks.push(trick)
}

Elephant.prototype.play = function(){
    let randTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)]
    console.log(`${this.name} is ${randTrick}`)
}

// dumbo = new Elephant("Dumbo", 60, ["sing", "dance", "splash water"])
// dumbo.trumpet()
// dumbo.grow()
// console.log(dumbo.height)
// dumbo.addTrick("fly")
// console.log(dumbo.tricks)
// dumbo.play()

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephantObj){
    console.log(`${elephant.name} is trotting by!`);

}

/**
 * Phase IV: Closures

Let's make a function dinerBreakfast. Ultimately, we want it to return an anonymous closure, 
which we will be able to use to keep adding breakfast foods to our initial order.

> let bfastOrder = dinerBreakfast();
"I'd like cheesy scrambled eggs please"
> bfastOrder("chocolate chip pancakes");
"I'd like cheesy scrambled eggs and chocolate chip pancakes please."
> bfastOrder("grits");
"I'd like cheesy scrambled eggs and chocolate chip pancakes and grits please."

Hints:

    order should be initialized to a starting order (e.g. scrambled eggs and bacon) before the anonymous function can do its work.
    The closure should capture/close over order
    What should the return value of dinerBreakfast be?
    Which function should take in the additional food as an argument?

Make sure you can call it multiple times and keep chaining on more breakfast foods!
 */

 let dinerBreakfast = () => {
     let menu = ["cheesy scrambled eggs"]
     console.log(`I'd like ${menu[0]}.`)
     return function(food){
        menu.push(food)
        console.log(`I'd like ${menu.join(' and ')}.`)
    }
 }

 let bfastOrder = dinerBreakfast();
bfastOrder("champorado")