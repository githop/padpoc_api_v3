
#Padded Pockets
see it [live on heroku](https://floating-springs-6532.herokuapp.com/)
##Rails API Backend

###Dependencies
gems:
rails-api gem
active_model_serializers gem
rack-cors gem
httparty

###The App
This half of padded pockets is responsible for the following:
* fetching data from Sunlight Foundation API
* creating records of the API response for each call
* serializing objects into json
* serving json

API clients can be found in the models directory as POROs. The Politician model and controller
contain the meat of the project.

###JSON
Here is a raw json feed of a search result
  ...
    [
  {
    "id": 238,
    "full_name": "Sheila Jackson Lee",
    "title": "Rep",
    "party": "dem",
    "state": "TX",
    "drive_id": "0B9oZ9Poh4Y5NNUtmTzRhSUZUTjg"
  },
  {
    "id": 461,
    "full_name": "Jackie Speier",
    "title": "Rep",
    "party": "dem",
    "state": "CA",
    "drive_id": "0B9oZ9Poh4Y5NTWdReFhRSjktT0k"
  }
  ...

Here is a single politician object with it's contributions
    
{
  "id": 12,
  "full_name": "John Boehner",
  "title": "Rep",
  "party": "R",
  "state": "OH",
  "drive_id": "0B9oZ9Poh4Y5NbE9ReWxtWXI5WXM",
  "contribution": {
    "id": 17,
    "politician_id": 12,
    "out_state": 8265224.0,
    "in_state": 22976962.0,
    "pac": 31249911.0,
    "individual": 15805498.0,
    "organizations": [
      {
        "id": 174,
        "name": "SLM Corp",
        "total": 118125.0,
        "employee_total": 118125.0,
        "direct_total": 0.0
      },
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...}
    ],
    "industries": [
      {
        "id": 170,
        "name": "LOBBYISTS",
        "total": 1112966.0
      },
      {...}
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...}
    ],
    "word_counts": [
      {
        "id": 320,
        "tfidf": 0.000210633511371,
        "count": 7,
        "word": "one-stop"
      },
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...},
      {...}
    ]
  }
}
