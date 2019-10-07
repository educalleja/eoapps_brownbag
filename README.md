# An introduction to Earth Observation Applications

Source code used to process satellite imagery and provision web services for demonstration purposes during [MYOB Brownbag](https://www.youtube.com/watch?v=9SZQCY93iGw).

## Image processing

```bash
$ bash 01_download_files.sh
```

Requires seadas and its processing tools (l3mapgen)

## Running web services

The following command runs Nginx, Expressjs REST API, geoserver and a postgis database on docker containers

```bash
$ docker-compose up
```
