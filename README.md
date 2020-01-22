# Weather2_iOS
## Description
A basic version of an iOS Weather app that a user can use know the current weather of their location. 
This weather app uses Dark Sky API to pull the weather data by using longitude and latitude as parameters. 
After retrievingthe weather data from the Dark Sky API, the data is stored onto cloud firebase database of that
user. The UI provides location, description, temperature, and an icon based on the weather data.


<figure class="video_container">
    <source src="https://github.com/shyamp229/Weather2_iOS/blob/master/Weather2.mov" type="video/mp4">
  </video>
</figure>

<img src="https://github.com/shyamp229/Weather2_iOS/blob/master/Screen%20Shot%202020-01-22%20at%2010.05.53%20AM.png?raw=true" alt="Change location via Xcode to test" height="200" width="200">

## To build this on your device
1. Must have Apple laptop or desktop.
2. Must have CocoaPods installed. 
  - To install CococaPods --> open Terminal and run `sudo gem install cocoapods`
3. Download the Repo.
4. Double click on **Weather2.xcworkspace** file and it will open the project on Xcode.
5. Connect your firebase app to your app.
  - Use this link to get started: https://firebase.google.com/docs/ios/setup
6. Must connect cloud firebase database to your application.
7. Run the app from Xcode.

## To connect your own cloud firebase database
1. Watch this tutorial video: https://www.youtube.com/watch?v=rvxYRm6n_NM
2. Create cloud database and connect it to your application
3. Make adjustments to **WeatherViewController.swift** file and on your cloud database settings to store weather data properly. 
  - Re-watch the tutorial video if you're having issues.
