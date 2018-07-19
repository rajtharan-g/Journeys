//
//  DistanceManager.h
//  MMIFramework
//
//  Created by Mohammad Akram on 29/09/15.
//  Copyright (c) 2015 mapmyindia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DistanceManager : NSObject

-(void)getDistance:(CLLocationCoordinate2D)startPoint  points:(NSArray*)arrViaPoints completion:(void (^)(NSDictionary *result,NSError* error))completionHandler __attribute__((nonnull(2)));
+(DistanceManager*)getInstance;
@property(assign)NSString* routeType;
@property(assign)NSString* vehicleType;
@property(assign)NSString* avoidRoadType;

@end
