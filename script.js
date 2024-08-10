var client_id = 'e19c1c80f47c41fab9f3b3bb2c524a95';
var client_secret = 'fd99be5e358d4135ab5e0fa5de80a274';

var authOptions = {
    url: 'https://accounts.spotify.com/api/token',
    headers: {
      'Authorization': 'Basic ' + btoa(client_id + ':' + client_secret)
    },
    body: new URLSearchParams({
      grant_type: 'client_credentials'
    }),
    method: 'POST'
  };
  
  fetch(authOptions.url, {
    method: authOptions.method,
    headers: authOptions.headers,
    body: authOptions.body
  })
  .then(response => response.json())
  .then(data => {
    var token = data.access_token;
    console.log(token);
  })
  .catch(error => console.error('Error:', error));
