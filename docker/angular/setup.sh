npm config get prefix
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
npm install -g @angular/cli
cd ./web
ng new app
cd ./app

echo 'open safari http://localhost:4200'

ng serve
