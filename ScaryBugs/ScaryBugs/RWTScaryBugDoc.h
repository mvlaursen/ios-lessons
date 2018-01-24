//
//  RWTScaryBugDoc.h
//  ScaryBugs
//
//  Created by Mike Laursen on 1/23/18.
//  Copyright © 2018 Laursen.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RWTScaryBugData;

@interface RWTScaryBugDoc : NSObject

@property (strong) RWTScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id)initWithTitle:(NSString *)title;

//- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;

@end
