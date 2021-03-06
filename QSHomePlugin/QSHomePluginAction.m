//
//  HomePlugin Plug-in
//  QSHomePluginAction.m
//
//  Created by Nathan Henrie
//

#import "QSHomePlugin.h"
#import "QSHomePluginAction.h"
#import <QSHomePlugin-Swift.h>

@implementation QSHomePluginAction

#pragma mark Action Methods

// do something with the selected object(s) from the first pane
- (QSObject *)performActionOnObject:(QSObject *)dObject
{
    Class providerClass = NSClassFromString(@"QSHomePlugin.QSHomePluginSwiftAction");
    NSLog(@"Calling some stuff from ObjC: %@", providerClass);
    QSHomePluginSwiftAction* plugin = [[QSHomePluginSwiftAction alloc]init];
    return [plugin performSwiftActionFromObjC:dObject];
}

// do something with the selected object(s) from the first and third panes
- (QSObject *)performActionOnObject:(QSObject *)dObject using:(QSObject *)iObject
{
	return nil;
}

#pragma mark Quicksilver Validation

// return an array of objects that are allowed in the third pane
- (NSArray *)validIndirectObjectsForAction:(NSString *)action directObject:(QSObject *)dObject
{
    NSString *myString = [[dObject arrayForType:QSHomePluginType ] lastObject];
    NSMutableArray *newActions = [NSMutableArray arrayWithCapacity:1];
    if ([myString length] < 10) {
        [newActions addObject:@"FirstAction"];
        [newActions addObject:@"SecondAction"];
    }
    return newActions;
//	return nil;
}

// do some checking on the objects in the first pane
// if an action has `validatesObjects` enabled in Info.plist, this method must return the action's name or it will never appear
- (NSArray *)validActionsForDirectObject:(QSObject *)dObject indirectObject:(QSObject *)iObject
{
	return nil;
}

@end
