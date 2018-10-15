var fs = require("fs");
const { Pool } = require("pg");

const pool = new Pool({
  user: "docker",
  password: "docker",
  host: "postgis",
  database: "tweets",
  port: 5432
});

const storeTweet = async (client, tweet) => {
  console.log(`Storing tweet with ID ${tweet.id}`);
  const location = `ST_GeomFromText('POINT(${tweet.geo.coordinates[0]} ${
    tweet.geo.coordinates[1]
  })', 4326)`;
  await client.query(
    `INSERT INTO tweets(id, location, text, username, image_url) VALUES (DEFAULT, ${location}, '${
      tweet.text
    }', '${tweet.user.screen_name}', '${tweet.user.profile_image_url_https}');`
  );
  console.log(`Adding tweet ${tweet.id}`);
};

module.exports = async tweets => {
  const client = await pool.connect();
  await Promise.all(tweets.map(async tweet => await storeTweet(client, tweet)));
  client.release();
};
