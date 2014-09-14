//
//  RottenTomatoesClient.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/13/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import Foundation


// Top Rentals
// http://developer.rottentomatoes.com/docs/read/json/v10/Top_Rentals
// http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=[your_api_key]&limit=1

class RottenTomatoesClient: AFHTTPRequestOperationManager {

    class var sharedInstance: RottenTomatoesClient {
        struct Static {
            static let instance = RottenTomatoesClient()
        }
        return Static.instance
    }

    func getApiKey() -> String {
        return "dagqdghwaq3e3mxyrp7kmmj5"
    }
    
    // GET Box Office
    // http://developer.rottentomatoes.com/docs/read/json/v10/Box_Office_Movies
    // http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=[your_api_key]
    func boxOfficeWithParams(
        params: [String: String]!,
        success: ((operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void)!,
        failure: ((operation: AFHTTPRequestOperation!, error: NSError!) -> Void)!) -> AFHTTPRequestOperation {
        println("boxOffice")

        var p = params;
        p["apikey"] = getApiKey()
        dump(p)
        
        return self.GET("http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json",
            parameters: p,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                //println(response)
                //println(Movie.parseMovies(response))
                success(operation: operation, response: Movie.parseMovies(response))
            },
            failure: failure)
    }
    
}
