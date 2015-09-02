//
//  User.m
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import "User.h"

@implementation User
@dynamic username;
@dynamic name;
@dynamic currentCity;

-(void)encodeWithCoder:(NSCoder *)encoder{

    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.currentCity forKey:@"currentCity"];
    

}

-(id)initWithCoder:(NSCoder *)decoder{

    if (self = [super init]) {
        self.username = [decoder decodeObjectForKey:@"username"];
        self.name = [decoder decodeObjectForKey:@"name"];
        self.currentCity = [decoder decodeObjectForKey:@"currentCity"];

    }

    return self;
}





@end
