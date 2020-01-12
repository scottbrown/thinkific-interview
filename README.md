# README

**Test Submission Document is located [here](README.submission.md).**

This is an example application to be used for DevOps technical challenges. It is
a simple REST api that implements the technical challenge found in this folder.

### TO RUN LOCALLY

1. This project has been tested on Ubuntu 19.04.
2. Ensure that you have Ruby 2.6.3 available on your system. [RVM](https://rvm.io/) can be helpful for this.
3. The project is currently configured to use a PostgreSQL v11.5 (although any version should work)
database and assumes that it is running on localhost on the default port.
It connects using the `postgres` user and assumes that you've configured PostgreSQL
to allow unauthenticated local connections. See [this link](https://www.postgresql.org/docs/11/auth-pg-hba-conf.html)
if you need help setting this up. __Alternatively__, you can change `config/database.yml` to use `SQLite3`. In production, however, PostgreSQL should be used. In the `Gemfile` both gems are installed.
4. From the root of this project, run `bundle install`. This will install all of the required gems.
5. From the root of this project, run `rails db:setup`. This will create the required databases and schema.
6. To run the application, run `rails s`. This should start the server and the application should be available at `http://localhost:3000`
7. To run the specs, you can run `rails spec`.

### TECHNICAL DESCRIPTION

1. Create a new user http://localhost:3000/users/create
  - requires the following parameters:
    - username (string, required)
    - password (string, required, min length of 6)
  - returns a JSON representation of the new user's API key
    ```
      {
        "data": {
          "id": "3",
          "type": "user",
          "attributes": {
            "api_key": "XwN5iq2RR4Aif4zUSTA1UBQc"
          }
      },
      "jsonapi": {
        "version": "1.0"
      }
    }
    ```

2. GET the user's current integer http://localhost:3000/api/v1/integer
   - requires that the user's API key be passed as a Bearer token in the Authorization header
   - returns JSON representing the user's current integer
     ```
     {
      "data": {
          "id": "3",
          "type": "user_integer",
          "attributes": {
              "value": 1
          }
      },
      "jsonapi": {
          "version": "1.0"
      }
    }
  ```

3. Increment the user's current integer by 1 (PUT) http://localhost:3000/api/v1/integer/increment
   - requires that the user's API key be passed as a Bearer token in the Authorization header
   - returns JSON representing the user's current integer after it's been incremented
     ```
     {
      "data": {
          "id": "3",
          "type": "user_integer",
          "attributes": {
              "value": 4
          }
      },
      "jsonapi": {
          "version": "1.0"
      }
    }
    ```

4. Update the user's current integer (PUT) http://localhost:3000/api/v1/integer
   - requires that the user's API key be passed as a Bearer token in the Authorization header
   - returns JSON representing the user's current integer after it's been updated
     ```
     {
      "data": {
          "id": "3",
          "type": "user_integer",
          "attributes": {
              "value": 10
          }
      },
      "jsonapi": {
          "version": "1.0"
      }
    }
    ```
