# README
## ENVIRONTMENT
Local url :
http://localhost:3000/

Local API reservation url :
http://localhost:3000/reservations

Heroku url :
https://reservation-api-test.herokuapp.com/

Heroku API reservation url :
https://reservation-api-test.herokuapp.com/reservations


## Prerequisites Installations

- Install ruby version 2.6.3 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Sqlite database engine
  ([more info here](https://sqlite.org/index.html)).

<p>If you want a copy of this project running on your machine you have to install:</p>

## Technology used

- Ruby
- Rails
- GitHub
- Sqlite

## Usage/Getting Started

Once you have installed the required package shown on the, proceed with the following steps

Clone the Repository,

```Shell
your@pc:~$ git clone https://github.com/bainur/reservation-api.git
```

Move into the cloned folder

```Shell
your@pc:~$ cd reservation-api
```

Get the dependencies needed for the app

```Shell
your@pc:~$ bundle install
```

Prepared for database creation

```Shell
your@pc:~$ bundle exec rake db:create && bundle exec rake db:migrate
```

Start server

```Shell
your@pc:~$ rails s
```

How to run rspec

```Shell
your@pc:~$ rspec .
```

### API request.
#### Postman collection.

**Postman File could be found on https://github.com/bainur/reservation-api/blob/master/public/reservation-api.postman_collection.json and import to your local Postman.**

API REQUEST are using json. 
API request should have reservation code and guest email parameters on the body as mandatory parameters
Here you can find the API Documentation

| API Endpoint                           | Functionality                                          | Status | Parameters On Body , JSON FORMAT|
| -------------------------------------- | ------------------------------------------------------ | ------ | -----------
| POST reservations                      | Create / Update guest or reservation from Airbnb       | OK     | https://github.com/bainur/reservation-api/blob/master/spec/support/params_airbnb.json      |
| POST reservations                      | Create / Update guest or reservation from booking.com  | OK     | https://github.com/bainur/reservation-api/blob/master/spec/support/params_booking_com.json |
