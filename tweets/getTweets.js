const Twitter = require("twitter");
const storeTweets = require("./storeTweets");

// docker run --network=eoapps_default --rm -w /app -v $HOME/Projects/eoapps/tweets:/app --entrypoint "bash" eoapps_expressjs getTweets.sh
const client = new Twitter({
  consumer_key: process.env.TWITTER_CONSUMER_KEY,
  consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
  access_token_key: process.env.TWITTER_ACCESS_TOKEN_KEY,
  access_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET
});
const getTweetsByLatLon = (lat, lon) => {
  client.get(
    "search/tweets",
    { q: "rain", geocode: `${lat},${lon},1km` },
    function(error, tweets, response) {
      console.log(error, tweets);
      const tweetsGeo = tweets.statuses.filter(
        tweet => !!tweet.coordinates || !!tweet.geo
      );
      storeTweets(tweetsGeo);
    }
  );
};
const coordinates = [
  [-37.814, 144.96332],
  [-34.92866, 138.59863],
  [-33.865143, 151.2099]
];
coordinates.forEach(latlon => getTweetsByLatLon(latlon[0], latlon[1]));
