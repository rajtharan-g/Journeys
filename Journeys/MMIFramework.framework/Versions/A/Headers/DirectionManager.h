//
//  DirectionManager.h
//  MMIFramework
//
//  Created by Mohammad Akram on 29/09/15.
//  Copyright (c) 2015 mapmyindia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface DirectionManager : NSObject

-(void)getDirections:(CLLocationCoordinate2D)startPoint endPoint:(CLLocationCoordinate2D)destinationPoint viaPoints:(NSArray*)arrViaPoints completion:(void (^)(NSDictionary *result,NSError* error))completionHandler;
+(DirectionManager*)getInstance;

@property(assign)NSString* routeType;
@property(assign)NSString* vehicleType;
@property(assign)NSString* avoidRoadType;
@property(assign)NSString* with_advices;
@property(assign)NSString* optimize;
@property(assign)NSString* alternatives;
@property(assign)NSString* callback;

@end
