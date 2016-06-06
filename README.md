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

### Technologies

GuestbookAPI uses the follwowing technologies:

* [RubyOnRails] - Ruby - Web Framework!

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

License
----

This is free :)


   [RubyOnRails]: <http://rubyonrails.org/>
   [git-repo-url]: <https://github.com/rubenspg/challlenge_tc.git>
