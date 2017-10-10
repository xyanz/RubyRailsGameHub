# GAMEHUB 

## What is GAMEHUB?
GAMEHUB is a videogame information repository that shows the timeline history of videogames with detailed information about
the games, characters, consoles using the *igdb.com* API. Explore the earliest iterations of the most iconic consoles, get
ratings for the latest and greatest titles of any system and save it all for later viewing. Users will be to like their 
favorite video games and create a wishlist. Integrated Amazon API will allow users to link their wishlist items to products
purchasable on the web.

## Technologies Used
Rails
Ruby
IGDB API
React
JS: EJS
Postgres
AXIOS
Ruby gem (igdb_api)
Semiotics
D3

##Possible Problems
Due to Cross-origin resource sharing restrictions, front-end javascript cannot utilise the API. You will need to 
create a back-end proxy that will not only shield your API key but also allow you to cache responses and reduce 
requests to the API.

## API Info

#### Installation 
```
$ gem install igdb_api
```

#### Usage
```
$ Igdb.connect('api_key')
```
```
$ Igdb::Game.find(1971)
```
```
$ Igdb::Game.search(query: 'batman')
```

## User Stories
> - Be on landing page looking for videogame histories and/or info
> - When landing page loads, I want to be able to see a login/signup link based on my authentication status
> - If I click on Sign Up link, I expect a User Sign Up page to render and provide form to input new user parameters.
> - Sign Up form should save user and allow to log in, log out and view user Account Page with newly provided credentials.
> - If I click Login link, I expect a User LogIn page to render and provide form to input exisiting user parameters.
> - When I successfully login, I expect to have access to User Account Page and be able to favorite videogames.
> - As a basic user, I want to be able to view timeline history of videogames separated by console/company.
> - As a basic user, I want to be able to view a child element of the console tree, which is used to represent individual
    videogame titles.
> - As a basic user, I want to able to view details about videogame child nodes, such as name, year, genre, title, ratings.
> - As a basic user, I want to be able to view details about videogame's child nodes such as characters, expansions, developers,
    reviews.
> - As a logged in user, I want to be able to favorite videogames and add them to wishlist.
> - As a logged in user, I want to be able to share for favorites list with other users.
> - As a logged in user, I want to be able to share wishlist with other users.


