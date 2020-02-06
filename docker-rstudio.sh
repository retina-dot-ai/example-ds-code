#/bin/bash

echo "docker pull retina/example-docker-r-rstudio:latest"
docker pull retina/example-docker-r-rstudio:latest

# delete the RStudio Server files
# https://support.rstudio.com/hc/en-us/articles/218730228-Resetting-a-user-s-state-on-RStudio-Server
find . -name ".rstudio" | xargs rm -rf
find . -name ".Rdata" | xargs rm -rf
find . -name ".Rhistory" | xargs rm -rf
find . -name ".Rproj.user" | xargs rm -rf

bash run_clean.sh

echo "** access RStudio Server at http://localhost:8787/ with user: rstudio pass: rstudio"
docker run --rm -p 8787:8787 \
  -e PASSWORD=localuser \
  --memory="12g" --memory-swap="100g" \
  -v `pwd`:/home/rstudio \
  retina/example-docker-r-rstudio
