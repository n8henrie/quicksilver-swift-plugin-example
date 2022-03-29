//
//  HomePlugin Plug-in
//  QSHomePluginSource.m
//
//  Created by Nathan Henrie
//

#import "QSHomePlugin.h"
#import "QSHomePluginSource.h"

@implementation QSHomePluginSource

#pragma mark Catalog Entry Methods

// Try to determine if the source data has changed.
// If so, index is invalid - return NO to have it rescanned.
// If not, return YES to skip an unneccessary rescan.
- (BOOL)indexIsValidFromDate:(NSDate *)indexDate forEntry:(NSDictionary *)theEntry
{
	return NO;
}

// create and return an array of QSObjects to add to the catalog
- (NSArray *) objectsForEntry:(NSDictionary *)theEntry
{
    NSLog(@"here sourcing stuff");
	NSMutableArray *objects=[NSMutableArray arrayWithCapacity:1];
	QSObject *newObject;
	
	newObject = [QSObject makeObjectWithIdentifier:@"QSHomePluginTest"];
	[newObject setName:@"Test HomePlugin Object"];
	[newObject setObject:@"data" forType:QSHomePluginType];
	[newObject setPrimaryType:QSHomePluginType];
	[objects addObject:newObject];

	return objects;
}

#pragma mark Object Handler Methods

/*
// an icon that is either already in memory or easy to load
- (void)setQuickIconForObject:(QSObject *)object
{
	[object setIcon:nil];
}

// a nicer or more "correct" icon that takes a while to create or obtain
- (BOOL)loadIconForObject:(QSObject *)object
{
	id data=[object objectForType:QSHomePluginType];
	[object setIcon:nil];
	return YES;
}
*/
@end
