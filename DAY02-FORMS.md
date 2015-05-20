# Forms!

This iteration of Fwitter focuses on creating forms. The forms in this lesson are designed to allow a user to create a tweet and then diplay it in a feed. This process of input-output drives the web and understanding how it works is vital to web development.

+ `tweet.erb`:
  * This file contains a form to create a tweet, using HTML `form` tags.
  * The form tag has two important attributes `action` and method`
    * `action`: the controller route that processes the request
    * `method`: the type of HTTP request
  * Forms are always submitted via an HTTP POST request - a user is posting information to be processed by an applications server
  * `input` tags create the space for the user to enter information. 
    * the `name` attribute is how information from the form gets sent to the user attribute

+ `application_controller.rb`:
  * We have to create a `post` request in here that is the same route defined in the `action` attribute.
  * This controller action receives the information from the user via the `params` hash. The value of the `name` attribute becomes the key of the hash, and what the user entered becomes the value.
  * we can use the params hash to create new instances of our tweet class