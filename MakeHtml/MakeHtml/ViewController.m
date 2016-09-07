//
//  ViewController.m
//  MakeHtml
//
//  Created by Daniel Suarez on 12/27/15.
//  Copyright © 2015 Daniel Suarez. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.makeFileButtonOutlet.enabled = NO;
    self.resetButtonOutlet.enabled = NO;
    self.testButtonOutlet.enabled = YES;
    isProperName = NO;
    regularCheckBoxInteraction = NO;
    mcatCheckBoxInteraction = NO;
    
}

- (void)setRepresentedObject:(id)representedObject {
    
    [super setRepresentedObject:representedObject];
}


- (IBAction)makeFiles:(id)sender {
    
    
    if(makeHtml == YES && makeForMcat == YES && makeStylesheet == YES){
        [self makeMcatHtml];
        self.updateWithHtmlName.stringValue = htmlFileName;
        [self makeMcatStylesheet];
        self.updatedStyleSheetFileName.stringValue = stylesheetFileName;
        
    }else if(makeHtml == YES && makeStylesheet == NO && makeForMcat == YES){
        [self makeMcatHtml];
        self.updateWithHtmlName.stringValue = htmlFileName;
        self.updatedStyleSheetFileName.stringValue = @"Did not make stylesheet.";
    }else if(makeHtml == YES && makeStylesheet == YES && makeForMcat == NO){
        [self makeHtmlFile];
        self.updateWithHtmlName.stringValue = htmlFileName;
        [self makeStylesheet];
        self.updatedStyleSheetFileName.stringValue = stylesheetFileName;
    }else if (makeHtml == YES && makeForMcat == NO && makeStylesheet == NO){
        [self makeHtmlFile];
        self.updateWithHtmlName.stringValue = htmlFileName;
    }
    
    self.makeFileButtonOutlet.enabled = NO;
    
}

- (IBAction)resetFields:(id)sender {
    
    self.textField.stringValue = @"";
    htmlFileName = nil;
    stylesheetFileName = nil;
    self.updatedStyleSheetFileName.stringValue = @"****";
    self.updateWithHtmlName.stringValue = @"****";
    self.errorLabel.stringValue = @"";
    self.noButton.state = 0;
    self.yesButton.state = 0;
    makeHtml = NO;
    makeStylesheet = NO;
    self.makeFileButtonOutlet.enabled = NO;
    self.resetButtonOutlet.enabled = NO;
    self.testButtonOutlet.enabled = YES;
    isProperName = NO;
    regularCheckBoxInteraction = NO;
    mcatCheckBoxInteraction = NO;
    self.mcatYesCheckBox.state = 0;
    self.mcatNoCheckBox.state = 0;
    makeForMcat = NO;
}
-(IBAction)declareSytlesheetState:(id)sender{
    
    regularCheckBoxInteraction = YES;
    
    if(self.noButton.state == 0 && self.yesButton.state != 0 ){
        makeHtml = YES;
        makeStylesheet = YES;
    }else if(self.noButton.state != 0 && self.yesButton.state == 0 ){
        makeHtml = YES;
        makeStylesheet = NO;
        
    }else if(self.noButton.state == 0 && self.yesButton.state == 0 ){
        makeStylesheet = NO;
        makeHtml = NO;
    }else{
        
        makeStylesheet = NO;
        makeHtml = NO;
    }
    
}



-(void)makeStylesheet{
    

        
        
    urlForStylesheet = [NSString stringWithFormat:@"//Users//Danny//output//%@",stylesheetFileName];
    contentForStylesheet = [NSString stringWithFormat:@"body{\n\n}div{\n\n}p{\n\n}"];
    stylesheetFile = [contentForStylesheet dataUsingEncoding:NSUTF8StringEncoding];
    
    [[NSFileManager defaultManager] createFileAtPath:urlForStylesheet contents:stylesheetFile attributes:nil];
        
    

}

-(void)makeHtmlFile{
        
        url = [NSString stringWithFormat:@"//Users//Danny//output//%@", htmlFileName];
        content = [NSString stringWithFormat:@"<!DOCTYPE HTML>\n<head><link rel = \"stylesheet\" type = \"text/css\" href = \"%@\"></head>\n<title> %@ </title>\n<body>\n<div id = \"\">\n</div>\n</body>\n</html>", stylesheetFileName, titleOfDocument];
        
        file = [content dataUsingEncoding:NSUTF8StringEncoding];
        
        [[NSFileManager defaultManager] createFileAtPath:url contents:file attributes:nil];
    

}
-(void)makeMcatHtml{
    
    
    url = ([NSString stringWithFormat:@"/Users//Danny//output//%@", htmlFileName]);
    
    
    content = ([NSString stringWithFormat:@"<!DOCTYPE HTML>\n<head><link rel = \"stylesheet\" type = \"text/css\" href = \"%@\"></head>\n<title> *****  </title>\n<h1 class = \"mainTitle\">****</h1>\n<body>\n\n<div id = \"mainSection\" class = \"mainSection\">\n\n\t<div id = \"firstColumn\" class = \"firstColumn\">\n\n\t</div>\n\t<div id = \"secondColumn\" class = \"secondColumn\">\n\n\t</div>\n</div>\n</body>\n</html>",stylesheetFileName]);
    
    file = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    [[NSFileManager defaultManager]createFileAtPath:url contents:file attributes:nil];
    
    
}
-(void)makeMcatStylesheet{
    
    
    
    
    urlForStylesheet = ([NSString stringWithFormat:@"/Users//Danny//output//%@",stylesheetFileName]);
    
    NSString *partOne = [NSString stringWithFormat:@"body{\n\tfont-style: Apple Symbols;\n\tfont-size:11px;\n}\ndiv{\n\tborder-style:solid;\n\n}\ndiv.mainSection{\n\n\theight:1300px;\n\twidth:1050px;\n\tborder:none;\n}\ndiv.firstColumn{\n\n\tborder-right:solid;\n\tborder-style:groove;\n\twidth:519px;\nheight:1300px;\n\tfloat:left;\n}\n  div.secondColumn{\n\n\twidth:519px;\n  \theight:1300px;\n \tfloat:left;\n\tborder-style:groove;\n}\n  h1.mainTitle{\n\n  \tfont-family: Apple Symbols;\n  \tfont-size: 25px;\n  \ttext-decoration: underline;\n  \tpadding: 5px;\n  \ttext-align:center;\n}\n"];
    
    NSString *partTwo = [NSString stringWithFormat:@"  \nh2.columnTitle{\n\n\tfont-family: Apple Symbols;\n text-indent:10px;\n  \tfont-size:18px;\n}\nh3.subTitle{\n\n\tfont-family: Apple Symbols;\n\ttext-indent:15px;\n\tfont-size:12px;\n\tfont-weight:bold;\n} \nul.mainList{\n\n\twidth = 445px;\n\tmargin-left:0px;\n}ul.subList{\n\n\twidth: 350px;\n\tmargin-left:20px;\n}\nli{\n\n\tfont-family: Apple Symbols;\n\t word-wrap: normal;\n"];
    
    NSString *partThree = [NSString stringWithFormat:@"}\n\nol.mainList{\n\n\twidth:445px;\n\tmargin-left:0px;\n}\nol.subList{\n\n\twidth:350px;\n\tmargin-left:20px;\n}\ntable.mainList{\n\n\twidth: 445px;\n\tfont-family: Apple Symbols;\n}\n"];
    
    contentForStylesheet = [NSString stringWithFormat:@"%@%@%@",partOne,partTwo,partThree];
    
    
    
    
    
    stylesheetFile = [contentForStylesheet dataUsingEncoding:NSUTF8StringEncoding];
    
    [[NSFileManager defaultManager]createFileAtPath:urlForStylesheet contents:stylesheetFile attributes:nil];
    
    
    
    
    
    
}
-(IBAction)declareForMcat:(id)sender{
    
    mcatCheckBoxInteraction = YES;
    
    if(self.mcatYesCheckBox.state == 1){
        makeForMcat = YES;
        
    }else{
        makeForMcat = NO;
    }
}

- (IBAction)testAction:(id)sender {
    
    fileNameInput = [self.textField stringValue];
    titleOfDocument = fileNameInput;
    htmlFileName = [fileNameInput stringByAppendingString:@".html"];
    stylesheetFileName = [fileNameInput stringByAppendingString:@".css"];
    
    
    if([self.textField.stringValue isEqualToString:@""] || self.textField == nil){
        isProperName = NO;
    }else{
        isProperName = YES;
    }
    
    
    if(isProperName == YES && regularCheckBoxInteraction == YES && mcatCheckBoxInteraction == YES){
        
        self.makeFileButtonOutlet.enabled = YES;
        self.resetButtonOutlet.enabled = YES;
        
        
    }else{
        self.makeFileButtonOutlet.enabled = NO;
        self.resetButtonOutlet.enabled = NO;
    }
    
    
    

   
    
    

    
}


@end
