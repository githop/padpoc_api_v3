
#Padded Pockets
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
