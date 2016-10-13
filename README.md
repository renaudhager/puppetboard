#  renaudhager/pupppetboard

## Usage

- Clone this repo
- Build the container

```
make
```

- Start the container

```
docker run -d renaudhager/pupppetboard:1.0.0
```


## Available ENV variables
- `PUPPETDB_HOST` : FQDN to puppetdb. / OPTIONAL
- `PUPPETDB_PORT` : Port used by puppetdb. / OPTIONAL
- `LISTEN_PORT` : Port used by nginx. / OPTIONAL
## Limitation
- HTTP only for now.
