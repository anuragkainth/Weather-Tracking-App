# Weather Tracking App

This project is a weather app made using Flutter. The app identifies the user's live location with the help of the geolocator package and uses the OpenWeatherMap API to fetch live weather conditions for that location. The app also allows users to manually enter a location and get weather information for that location.

## Features

● Live weather conditions for the user's current location.

● Ability to manually enter a location and get weather information.

● Cross-platform.

● Intiutive & user friendly.

## Installation

To use this app, follow these steps:

1. Clone this repository using git clone https://github.com/anuragkainth/Weather-Tracking-App.git.
2. Install the necessary dependencies by running flutter pub get in the project directory.
2. Run the app on an emulator or physical device


## Usage

● When the app is launched, it will attempt to determine your current location using the geolocator package. If successful, it will display the current weather conditions for that location.

● To manually enter a location, click on the City icon in the top right corner of the screen. Enter the name of the location and click on the Get Weather button. The app will display the weather conditions for that location.

● To refetch current location weather data tap on top left icon on main weather screen. Remember to keep your location enabled on your phone.

## Screenshots

<p align="left">
  <img src="https://github.com/anuragkainth/Weather-Tracking-App/blob/main/Screenshots/location_access.png?raw=true" width="260" />
  <img src="https://github.com/anuragkainth/Weather-Tracking-App/blob/main/Screenshots/live_location.png?raw=true" width="260" />
  <img src="https://github.com/anuragkainth/Weather-Tracking-App/blob/main/Screenshots/city_name_screen.png?raw=true" width="260"  />
</p>

## Credits

This project was made possible thanks to the following packages:

● geolocator: Used to determine the user's current location.

● http: Used to make API requests to openweathermap.

● flutter_spinkit: Used to display a loading spinner while fetching weather data.
