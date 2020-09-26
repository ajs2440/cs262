CS 262 - Lab 02

This lab is based on https://cs.calvin.edu/courses/cs/262/kvlinden/02management/lab.html

I had to make a text input which takes in a user's name and create a "Birthdays" button which updates the user's age everytime it is pressed.

Answers to the lab questions:

  App.js is a simple application that allows for user text input of their name, and increments their age by
  one using a "Birthdays" button. The button is also responsible for updating a text message which shows the
  user's inputted name and their age, depending on how many times the "Birthdays" button was pressed.


  What is the name of the component in this application?
  The App component is the main, parent component of this application, which has a bunch of child components
  used to define how it functions and how it looks like.


  Name one prop and one state element in the code.
  A prop in this program would be "style" and its value since props get passed to the component.
  A state element would be "age" and its value since it is able to change/update itself depending on events
  it must look out for and it is managed within the component.


  How are curly braces ({}) used in the JSX code.
  Curly braces are used to get the value of that variable and render that value as opposed to using the word that
  defines the variable itself.


  Identify one anonymous function in the code.
  const clickHandler = () => {
      console.log(age);
      setAge(age + 1);
      setBirthdays(
        birthdays.concat({ key: (age + 1).toString() })
      );
      console.log(age);
    }

  The clickHandler function above receives an anonymous function to operate correctly.


  Does the application, when run on either Android or iOS, use HTML and/or CSS?
  It doesn't look like it uses any HTML and CSS when running on Android or iOS. React Native uses JSX
  (which is similar to HTML) and it provides styling that is similar to CSS, but they are not HTML and
  CSS themselves.