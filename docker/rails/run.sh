docker run --rm ruby:2.5.0 ruby -v
echo 'curl -sL https://deb.nodesource.com/setup_12.x | bash -'
echo 'apt-get install -y nodejs'
echo 'node --version'
echo 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -'
echo 'echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list'
echo 'apt update && apt install yarn'
echo 'yarn -v'
echo 'gem install rails'
echo 'rails --version'
echo 'rails new my-super-awesome-blog'
echo 'docker ps --all'
echo 'MY_CONTAINER_ID=546f6480d345'
echo 'docker commit ${MY_CONTAINER_ID} my-bundled-rails-image'

docker run -it --rm --name rails-gen -v $(pwd):/work -w /work ruby:2.5.0 bash
