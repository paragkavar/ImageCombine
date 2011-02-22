//
//  AppController.h
//  ImageCombine
//
//  Created by mitchell on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {

	IBOutlet NSTextField * fileName;
	IBOutlet NSTextField * directoryName;
	
}


-(IBAction)selectFile: (id)sender;
-(IBAction)selectDirectory: (id)sender;

@end
