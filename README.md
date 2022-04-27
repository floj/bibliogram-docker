# bibliogram-docker
Run [Bibliogram](https://git.sr.ht/~cadence/bibliogram/) as a docker container.

# Usage
```sh
docker run \
  --name bibliogram \
  -p 8080:10407 \
  ghcr.io/floj/bibliogram
```
then visit [http://localhost:8080](http://localhost:8080).

# Configuration options
It's desirable to change some of [Bibliograms configuration options](https://git.sr.ht/~cadence/bibliogram-docs/tree/master/item/docs/Configuring.md) 
in the `config.js`. The easiest way to do this is to mount it from a local path into the container.

Additionally Bibliogram stores it's data in `/app/db`. If you want to preserve it, you'll have to mount a volume in this location.

```sh
docker run \
  --name bibliogram \
  -p 8080:10407 \
  -v "$(pwd)/config.js:/app/config.js:ro" \
  -v bibliogram-data:/app/db \
  ghcr.io/floj/bibliogram
```
