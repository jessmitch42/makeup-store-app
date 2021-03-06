# Ruby Makeup: Your One Stop Shop for Real Makeup from a Not-Real Store

## Usage
To use this app, just clone, run `rake db:migrate`, `rake db:seed` for some products and then `shotgun` to get her running.

## Description
The requirements of this app were to:
- make a Sinatra app using ActiveRecord (check)
- have multiple models (check)
- have at least one has_many relationship (the order has many products)
- have users (sure do!)
- ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (read, update, delete in the CartItems and create Orders)

## Check It Out
Ruby Makeup is currently deployed at https://ruby-makeup-85046.herokuapp.com/products

# Extra info you might be interested in

## Landing Page
The landing page is viewable logged in or out. If a user is not logged in, the "Add to Cart" buttons don't render and the header says "Sign In / Login". If the user is logged in, the header will have a log out option and a link to their cart. The header behaves this way on every page to avoid users accessing the cart before signing in. If the user tries to access routes that are not directly accessible through the page and for which they don't have access rights, they will be redirected to the main page again. The main product page can also be sorted by product category. This is to make browsing more enjoyable and faster, of course!
<img src="./public/img/Ruby Makeup Landing Page.png" />


## Authentication
User's must provide a first name, email, and password to sign up. The password is stored encrypted. All fields on the sign up and log in page are required and the page will display an error if they are submitted empty. If the password is incorrect while logging in, an error message will display on the login page. The page will redirect to the main products page after logging in and logging it. If you try to logout while not logged it, you'll be redirected to the login page (and stop trying to break my app because there's no logout button if you're not logged in.)
<img src="./public/img/Ruby-Makeup-Error.png" />


## Individual Products
Products can only be viewed individually when the user has logged in. The product description is included in this view. Products can be added to the user's cart from this view or the main product page view.
<img src="./public/img/Ruby Makeup Product.png" />


## Cart (a.k.a. CartItem)
A user can view their cart but, in terms of the database, I am using a CartItem model as a join for products and users prior to an order. Once an order is created, the rows in the cart_items table that are associated to that user are deleted so that anytime a user is viewing their cart, the database is retrieving only products being currently shopped for by the user. This also means the cart data persists for the user even if they leave the store before making a purchase and then come back. Deleting a product from the cart deletes the associated row from the "cart_items" table. Updating the product quantity will edit the quantity value in the associated cart item row. In terms of security, the users can only access their own cart, of which there is only ever one. Prior to showing the cart, I check that the session user id matches the cart user id and reject any discrepancies.
<img src="./public/img/Ruby-Makeup-Cart.png" />


# Orders
Currently the cart goes directly to the order page and just let's the user know the order was received. There's room to expand this to show an order history and to maintain order details that were available in the cart (a line item view of the order) but let's save that for another day.
<img src="./public/img/Ruby Makeup Order.png" />

# Styling
I could spend a LOT of time on this but I decided to keep it simple and not get too distracted by buttons and alignments. Most of the alignment is done with CSS Grid. It still needs a little responsiveness love too. <3

