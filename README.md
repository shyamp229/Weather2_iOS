# Weather2_iOS
Created basic version of weather app.

## To build this on your device:
1.) Must have Apple laptop or desktop.
2.) Must have CocoaPods installed. 
  -- To install CococaPods --> open Terminal and run "sudo gem install cocoapods"
3.) Download the Repo.
4.) Use Xcode to run it onto a simulatator


## Description
A basic version of an iOS Weather app that a user can use know the current weather of their location. 
This weather app uses Dark Sky API to pull the weather data by using longitude and latitude as parameters. 
After retrievingthe weather data from the Dark Sky API, the data is stored onto cloud firebase database of that
user. The UI provides location, description, temperature, and an icon based on the weather data.
