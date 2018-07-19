//
//  ReverseGeocodeManager.h
//  MMIFramework
//
//  Created by Mohammad Akram on 29/09/15.
//  Copyright (c) 2015 mapmyindia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
@interface ReverseGeocodeManager : NSObject
-(void)getPlace:(CLLocationCoordinate2D)locationPoint completion:(void (^)(NSDictionary *result,NSError* error))completionHandler __attribute__((nonnull(2)));

+(ReverseGeocodeManager*)getInstance;
@end
