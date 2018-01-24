//
//  RWTScaryBugDoc.m
//  ScaryBugs
//
//  Created by Mike Laursen on 1/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

#import "RWTScaryBugDoc.h"

@implementation RWTScaryBugDoc

@synthesize title = _title;
@synthesize rating = _rating;
@synthesize thumbImage = _thumbImage;
@synthesize fullImage = _fullImage;

- (id) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.rating = 0;
        self.title = title;
        self.thumbImage = [UIImage imageNamed:@"Metoecus_paradoxus_thumb.png"];
        self.fullImage = [UIImage imageNamed:@"Metoecus_paradoxus.png"];
    }
    return self;
}

@end
