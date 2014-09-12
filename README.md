ios8_rotten_tomatoes
====================

Rotten Tomatoes iOS App

This is an iOS application, which shows "Top Rentals" and "Box Office" movies using Rotten Tomatoes APIs.

[![image](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_rotten_tomatoes/assets/ios8_rotten_tomatoes.gif)](https://raw.githubusercontent.com/wiki/stanleyhlng/ios8_rotten_tomatoes/assets/ios8_rotten_tomatoes.gif)

## Overview

This week we'll build a Rotten Tomatoes client. The purpose of this project is to develop a basic MVC application and start playing with table views, one of the more complex, but important views in iOS. You can peruse their API and sign up for a free developer key at developer.rottentomatoes.com.

## User Stories

- [ ] User can view a list of movies from Rotten Tomatoes. Poster images must be loading asynchronously.
- [ ] User can view movie details by tapping on a cell
- [ ] User sees loading state while waiting for movies API. You can use one of the 3rd party libraries here (Links to an external site.).
- [ ] User sees error message when there's a networking error. You may not use UIAlertView to display the error. See this screenshot for what the error message should look like: network error screenshot (Links to an external site.).
- [ ] User can pull to refresh the movie list.
- [ ] Optional: All images fade in.
- [ ] Optional: For the large poster, load the low-res image first, switch to high-res when complete.
- [ ] Optional: All images should be cached in memory and disk. In other words, images load immediately upon cold start.
- [ ] Optional: Customize the highlight and selection effect of the cell.
- [ ] Optional: Customize the navigation bar.
- [ ] Optional: Add a tab bar for Box Office and DVD.
- [ ] Optional: Add a search bar.

## Time spent
10 hours spent in total

## Libraries
```
platform :ios, '8.0'
pod 'AFNetworking', '~> 2.4.1'
pod 'AVHexColor', '~> 1.2.0'
pod 'GSProgressHUD', '~> 0.3'
pod 'Reveal-iOS-SDK', '~> 1.0.4'
pod 'SDWebImage', '~> 3.7.1'
pod 'UIActivityIndicator-for-SDWebImage', '~> 1.2'
```
