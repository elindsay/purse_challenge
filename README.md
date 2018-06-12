# README

This is running at: https://immense-peak-13820.herokuapp.com/

You can add orders at root or /orders/new
You can see a list of json orders with a git request to /orders
You can get the json of a specific order from /orders/<order-number>
You can see what's saved in the db at /admin


You can access the API remotely. Here is an example of a curl request to add an order (note, the | separating Order Number and Estimated deliver, since passing a newline in is a pain)

curl --request POST --data "order[input_string]=Order Number: 232-7384712-9823599 | Estimated delivery by Dec. 20, 2016 - Dec. 30, 2020" https://immense-peak-13820.herokuapp.com/orders
