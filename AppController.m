//
//  AppController.m
//  ImageCombine
//
//  Created by mitchell on 2/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


/* a simple C function that open an NSOpenPanel and return an array of selected filepath */
static NSArray *openFiles(BOOL withDirectory, BOOL withCreate, BOOL withFiles)
{ 
    NSOpenPanel *panel;
	
    panel = [NSOpenPanel openPanel];        
    [panel setFloatingPanel:YES];
    [panel setCanChooseDirectories:withDirectory];
	[panel setCanCreateDirectories:withCreate];
    [panel setCanChooseFiles:withFiles];
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
	//system("open ~/");
	NSArray * path = openFiles(NO,NO,YES);

	int i, n;
	n = [path count];
	for(i=0; i<n; i++){
		[fileName setStringValue:[[path objectAtIndex:i] lastPathComponent]];
		[baseFilePath initWithString:[path objectAtIndex:i]];
	}
	
}

-(IBAction)selectDirectory: (id)sender{
	NSArray * dPath = openFiles(YES,NO,YES);
	int i, n;
	n = [dPath count];
	for(i=0; i<n; i++){
		//do something with array 
	}
}

-(IBAction)selectOutputDir: (id)sender{
	NSArray * dPanel = openFiles(YES, YES,NO);
	int i, n;
	n = [dPanel count];
	for(i=0; i<n; i++){
		[outDirPath initWithString:[dPanel objectAtIndex:i]];
		NSLog(@"FILE IS %@",outDirPath);
		//[outputDir setStringValue: outDirPath];
	}
}

@end
