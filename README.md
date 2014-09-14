ios8_rotten_tomatoes
====================

Rotten Tomatoes iOS App

This is an iOS application, which shows "Top Rentals" and "Box Office" movies using Rotten Tomatoes APIs.

[![image](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_rotten_tomatoes/assets/ios8_rotten_tomatoes.gif)](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_rotten_tomatoes/assets/ios8_rotten_tomatoes.gif)

## Overview

This week we'll build a Rotten Tomatoes client. The purpose of this project is to develop a basic MVC application and start playing with table views, one of the more complex, but important views in iOS. You can peruse their API and sign up for a free developer key at developer.rottentomatoes.com.

## User Stories

- [x] User can view a list of movies from Rotten Tomatoes. Poster images must be loading asynchronously.
- [x] User can view movie details by tapping on a cell
- [x] User sees loading state while waiting for movies API. You can use one of the 3rd party libraries here (Links to an external site.).
- [x] User sees error message when there's a networking error. You may not use UIAlertView to display the error. See this screenshot for what the error message should look like: network error screenshot (Links to an external site.).- [ ] User can pull to refresh the movie list.
- [x] Optional: All images fade in.
- [x] Optional: For the large poster, load the low-res image first, switch to high-res when complete.
- [ ] Optional: All images should be cached in memory and disk. In other words, images load immediately upon cold start.
- [x] Optional: Customize the highlight and selection effect of the cell.
- [x] Optional: Customize the navigation bar.
- [x] Optional: Add a tab bar for Box Office and DVD.
- [x] Optional: Add a search bar.

## Time spent
10 hours spent in total

## Libraries
```
platform :ios, '8.0'
pod 'AFNetworking', '~> 2.4.1'
pod 'AVHexColor', '~> 1.2.0'
pod 'GSProgressHUD', '~> 0.3'
pod 'Reveal-iOS-SDK', '~> 1.0.4'
pod 'Mantle', '~> 1.5'
```
