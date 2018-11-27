import http.client
import urllib.request as ur
import requests


conn = http.client.HTTPSConnection("api.abiosgaming.com")
#conn = ur.urlopen("api.abiosgaming.com")
payload = "grant_type=client_credentials&client_id=casey-kwatkosky&client_secret=894eddb1b51d56a63141523342c7b2451cb7e613ca877974e5"

headers = {
    'content-type': "application/x-www-form-urlencoded"
    }

conn.request("POST", "/v2/oauth/access_token", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))

response = requests.get('https://api.abiosgaming.com/v2/games?q=league',auth=('casey-kwatkosky','894eddb1b51d56a63141523342c7b2451cb7e613ca877974e5'))
print(response)

import requests

data = {
  'grant_type': 'client_credentials',
  'client_id': 'casey-kwatkosky',
  'client_secret': '894eddb1b51d56a63141523342c7b2451cb7e613ca877974e5"'
}

response = requests.post('https://api.abiosgaming.com/v2/oauth/access_token%0A%0Acurl', data=data)
