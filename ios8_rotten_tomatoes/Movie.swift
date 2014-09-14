//
//  Movie.swift
//  ios8_rotten_tomatoes
//
//  Created by Stanley Ng on 9/12/14.
//  Copyright (c) 2014 Stanley Ng. All rights reserved.
//

import Foundation

class Movie: MTLModel, MTLJSONSerializing {
    //var title = "[title]"
    //var synopsis = "[synopsis]"
    //var posters = [String: String]()
    
    var id: NSNumber!
    var title: NSString!
    var synopsis: NSString!
    var posters: [String: String]!
    var rating: NSString!
    
    class func JSONKeyPathsByPropertyKey() -> [NSObject : AnyObject]! {
        return [
            "id": "id",
            "title": "title",
            "synopsis": "synopsis",
            "posters": "posters",
            "rating": "mpaa_rating"
        ]
    }
    
    class func parseMovie(response: [NSObject: AnyObject]!) -> AnyObject {
        return MTLJSONAdapter.modelOfClass(Movie.self, fromJSONDictionary: response, error: nil)
    }
    
    class func parseMovies(response: AnyObject!) -> [AnyObject] {
        let responseDict = response as NSDictionary
        
        var movies: [Movie] = Array()
        
        var items = responseDict["movies"] as [NSDictionary]
        for item in items {
            var movie = Movie.parseMovie(item) as Movie
            //dump(movie)
            movies.append(movie)
        }
        
        return movies
    }
}