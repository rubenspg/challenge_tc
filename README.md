# GuestbookAPI

Welcome to the GuestbookAPI project. This project is a challenge proposed by Try-Catch.
GuestbookAPI exposes a Rest API enabling users to create events and its guests.
The following features are available:

  - Create users and assign roles like Admin or Guest
    - **Guests** can read an event guestbook information.
    - **Admin** can create, edit and remove events and its guestbook.
  - Create, edit and remove events and assing guests to its guestbook.

### Version
The current version of the API is **v1**.
All calls should be pointing to *<hostname>/api/v1/<resource>*

### API Documentation
### User
Below is described the documentation to interact with User entity. 

#### List
Following you can see the details on how to list of Users.

- **Who can call:** User admin
- **URL:** http://api.<server>:3000/v1/users
- **Method:** GET 
- **Header:** Content-Type: application/json X-Token: USER_TOKEN
- **Payload:**

#### Create
Following you can see the details on how to create a new User. 
Note that you will receive the token when you create your user.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** Content-Type: application/json X-Token: USER_TOKEN
- **Payload:** {"user": {"name": "User_AAA", "email": "rubens@github.com", "password": "sss", "admin": true}}

#### Update
Following you can see the details on how to update a User.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Show
Following you can see the details on how to show a User.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Destroy
Following you can see the details on how to destroy a User.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

### Event
Below is described the documentation to interact with Event entity. 

#### List
Following you can see the details on how to list of Events.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Create
Following you can see the details on how to create a new Event.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Update
Following you can see the details on how to create a Event.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Show
Following you can see the details on how to create a Event.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Destroy
Following you can see the details on how to create a Event.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

### Guest
Below is described the documentation to interact with Guest entity. 

#### List
Following you can see the details on how to create of Guests.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Create
Following you can see the details on how to create a new Guest.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Update
Following you can see the details on how to create a Guest.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Show
Following you can see the details on how to create a Guest.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

#### Destroy
Following you can see the details on how to create a Guest.

- **Who can call:** *Everyone*
- **URL:** http://api.<server>:3000/v1/users
- **Method:** POST 
- **Header:** 
- **Payload:**

### Technologies

GuestbookAPI uses the follwowing technologies:

* [RubyOnRails] - Ruby - Web Framework!
* [Pundit] - Pundit - Authorization System

### Installation

GuestbookAPI requires [Ruby On Rails] v4.1.8 to run.

You need Gulp installed globally:

```sh
$ git clone [git-repo-url] challlenge_tc
$ cd challlenge_tc
$ rails s
```

### ToDo

 - Deploy using Docker containers
 - Add a CI/CD pipeline
 - Hide the api_token from logs
 - Create API documentation
 - API to set User as Admin
 - API to regenerate api_tokens

License
----

This is free :)


   [RubyOnRails]: <http://rubyonrails.org/>
   [Pundit]: <https://github.com/elabs/pundit>
   [git-repo-url]: <https://github.com/rubenspg/challlenge_tc.git>
