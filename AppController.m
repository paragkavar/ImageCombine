//
//  AppController.m
//  ImageCombine
//
//  Created by mitchell on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


/* a simple C function that open an NSOpenPanel and return an array of selected filepath */
static NSArray *openFiles(BOOL withDirectory)
{ 
    NSOpenPanel *panel;
	
    panel = [NSOpenPanel openPanel];        
    [panel setFloatingPanel:YES];
    [panel setCanChooseDirectories:withDirectory];
    [panel setCanChooseFiles:YES];
	[panel setPrompt:(@"Choose")];
	[panel setTitle:(@"File Selection Browser")];
	int i = [panel runModalForTypes:nil];
	if(i == NSOKButton){
		return [panel filenames];
    }
    
    return nil;
}    


@implementation AppController

-(id)init{
	[super init];
	return self;

}




-(IBAction)selectFile: (id)sender{
	NSArray * path = openFiles(NO);

	int i, n;
	n = [path count];
	for(i=0; i<n; i++){
		[fileName setStringValue:[path objectAtIndex:i]];
	}
	
}

-(IBAction)selectDirectory: (id)sender{
	NSArray * path = openFiles(YES);	
	
	
}

@end
