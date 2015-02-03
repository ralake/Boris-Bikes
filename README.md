Boris Bikes
===========
[![Code Climate](https://codeclimate.com/github/ralake/Boris-Bikes/badges/gpa.svg)](https://codeclimate.com/github/ralake/Boris-Bikes)
Makers Academy Week 1 Exercise

An introduction to OOP and OOD, Boris bikes is a program that mimics the london bike rental service. The first step towards building a domain model and deciding which classes were needed was to describe the problem in plain english...

'We need to build a system that manages **bikes** that can be rented from and returned to **docking stations** by **users**. The bikes can break while being used, in which case they will not be available for rental after they are returned. There is a **garage** that can fix broken bikes. A **van** is used to move broken bikes from the stations to the garage. It can also be used to take fixed bikes back to the station(s). The van, all stations and the garage have fixed capacity.'

From this my team identified five classes. Within these classes, three shared some responsibilities so a module was created that could be included in each to avoid duplicating code. This module is called **bike container**.

1. Bike
-------

|Responsibilities | Collaborators|
|-----------------|--------------|
| It can break | User |
| | Docking Station |
| | Van|
| | Garage |

2. Docking Station
------------------

|Responsibilities | Collaborators|
|-----------------|--------------|
| It holds, accepts and releases fixed and broken bikes | User |
| It should know when it is full & empty | Bike |
| It knows how many available and unavailable bikes it has | Van|
| It gives broken bikes to and receives fixed bikes from the Van | Garage |

3. User
-------

|Responsibilities | Collaborators|
|-----------------|--------------|
| It can have and not have a bike | Bike |
| It can lose and break a bike | Docking Station |
| It can rent and return a bike from a Docking Station| |

4. Garage
-------

|Responsibilities | Collaborators|
|-----------------|--------------|
| It can hold, receive and release fixed and broken bikes | Bike |
| It can fix broken bikes | Van |
| It should know when it is full & empty | |
| It knows how many fixed and broken bikes it has | |
| It gives fixed bikes to and receives broken bikes from the Van | |

5. Van
-------

|Responsibilities | Collaborators|
|-----------------|--------------|
| It can hold, receive and release fixed and broken bikes | Bike |
| It should know when it is full & empty | Docking Station |
| It knows how many fixed and broken bikes it has | Garage |
| It gives fixed bikes to and receives broken bikes from the Docking Station | |

Skills Learned
--------------
Boris bikes was an excellent project in helping me to understand how and why responsibilities should be separated and how classes should interact. Most importantly I learned how to use doubles for unit testing, how to mock behaviour and also discovered the power of designing class behaviour through testing. Using the bike container module meant that I could test using shared examples. I have also included a number of custom error handlers by creating classes that inherit from the Exception class.

How to use
----------
```shell
irb
require './boris_bikes'
```
