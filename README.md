# Pigenger

Web based chat application: https://pigenger.herokuapp.com/

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

**1. Install rbenv and ruby-build**

```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```
After above steps confirm your installation with the following command:
```
type rbenv
```
Your terminal window should output the following:
```
rbenv is a function
rbenv () 
{ 
    local command;
    command="$1";
    if [ "$#" -gt 0 ]; then
        shift;
    fi;
    case "$command" in 
        rehash | shell)
            eval "$(rbenv "sh-$command" "$@")"
        ;;
        *)
            command rbenv "$command" "$@"
        ;;
    esac
}
```

**2. Install Ruby**

``` 
rbenv install 2.4.1
rbenv global 2.4.1
```
Verify that Ruby was properly installed by checking your version number:
```
ruby -v
```
Your output to the above command should look something like this:
```
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
```

**3. Install Bundler**

We will also install the bundler gem to manage application dependencies:
```
gem install bundler
```

**4. Install Node.js**

A few Rails features depend on a JavaScript Runtime.
```
sudo apt install nodejs
```
Rails requires 'node' package for running which is deprecated. We will create a symbolic link to direct nodejs to node
with the following command:
```
sudo ln -s "$(which nodejs)" /usr/bin/node
```
**5. Install PostgreSQL***

Install PostgreSQL with the below command:

```
sudo apt install postgresql
```

then configure:

```
sudo service postgresql restart
sudo su - postgres
psql
create role <username> with createdb login password '<password>';
create database pigenger;
\q
exit
sudo service postgresql restart
```

**6. Installing Gem Dependencies**

Install required gems via `bundler install` command. Just give it a while.

*Note: If the `bundler install` command behaves funny or crashes see if installing below packages works:*
```
sudo apt install libsqlite3-dev
sudo apt install libpq-dev
```

### Running

In the root of the project directory, execute the below command:
```
rails server
```
then the Pigenger will be running at localhost:3000
