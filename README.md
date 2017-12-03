# ruby async

the endpoint `'/testasync'` is no blocking

## start the apps

start front door
```
  bundle exec ruby my_frontdoor_app.rb
```

start backend
```
  bundle exec ruby ruby-async-example-backend/my_backend_app.rb
```

## run it

run multiple request against the async endpoint
```
for request in {1..10000}; do curl -iv http://localhost:8088/testasync; done
```
