# Here we define our query as a multi-line string
import requests
import json
from datetime import datetime

query = '''
query($userName: String)
{
  Page(page: 1, perPage: 40) {
    mediaList(userName: $userName, status: CURRENT, type: ANIME) {
      media {
        status
        nextAiringEpisode {
          episode
          airingAt
        }
        title {
          english
        }
        
        id
      }
    }
  }
}
'''



# Define our query variables and values that will be used in the query request
variables = {
    'userName' : "Bracktus"
}

url = 'https://graphql.anilist.co'

# Make the HTTP Api request
response = requests.post(url, json={'query': query, 'variables': variables})

data = response.json()

with open ('/home/bracktus/bin/anime/anilist.json', 'w') as file:
	json.dump(data, file)
