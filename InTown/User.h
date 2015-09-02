//
//  User.h
//  InTown
//
//  Created by Ronald Hernandez on 9/2/15.
//  Copyright (c) 2015 inTown. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject <NSCoding>


@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *currentCity;

@end
