const express = require("express");
const { Client, Pool } = require("pg");
const app = express();
const port = 3000;

const pool = new Pool({
  user: "docker",
  host: "postgis",
  database: "tweets",
  password: "docker",
  port: 5432
});

app.use((req, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

app.get("/tweets/:lat/:lon", async (req, res) => {
  const client = await pool.connect();
  const tweets = await client.query(
    `SELECT id, ST_X(location) as Lat, ST_Y(location) as Lon, text FROM tweets WHERE ST_Distance_Sphere(location, ST_MakePoint(${
      req.params.lat
    },${req.params.lon})) <= 100000`
  );
  client.release();
  res.json(tweets.rows);
});

app.listen(port, () => console.log(`Expressjs listening on port ${port}!`));
