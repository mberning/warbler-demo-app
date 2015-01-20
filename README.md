# warbler-demo-app #

This is a simple Sinatra app that I wrote to demonstrate using JRuby and Java JARs in a application deployed as a WAR file on Tomcat

# Setup #
You need to have a recent version of JRuby installed as well as Bundler

After you clone the repository run
```
bundle install
```

You will also need Bower to install client side dependencies
```
bower install
```

# Running #
You can run the app directly by running
```
rackup
```

# Building the WAR #
From the command line run
```
warble
```

Then deploy your WAR file in your preferred container