# Tic Tac Toe

* [GitHub Repo](https://github.com/afg419/tic_tac_toe)  
* [Production Link](https://tic-tac-to-challenge.herokuapp.com/)  

## Overview
  * A two player implementation of Tic Tac Toe
  * Choose to play as 'X' or 'O' and compete against another online player
  * Auto-updating means you never have to refresh to have current game-state

![](http://i.imgur.com/Rr7Qpyp.png)  
![](http://i.imgur.com/N9OaEEY.png)  


## Tools
  * Rails + Postgresql
  * ReactJS
  * Capybara + Selenium for testing

## To install and setup locally
  With current versions of Ruby and Rails:  
  `$ git clone: https://github.com/afg419/tic_tac_toe`  
  `$ bundle`  
  `$ rake db:create && rake db:migrate`  
  `$ rails s`

Now visit `localhost:3000` in the browser

## To run test suite  
  `$ rspec`
