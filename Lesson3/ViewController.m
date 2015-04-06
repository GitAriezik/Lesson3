//
//  ViewController.m
//  Lesson3
//
//  Created by Vasily on 05.04.15.
//  Copyright (c) 2015 Vasily. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray * arrayPrices;
@property(nonatomic, strong) NSArray * arrayValues;
@property(nonatomic, strong) NSMutableArray * arrayM;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * stringPrices = @"100000,150000,1500000";
    NSString * stringValues = @"Fiat,WW,MercedecBenz";
    self.arrayM = [NSMutableArray array];

    
    self.arrayPrices = [stringPrices componentsSeparatedByString:@","];
    self.arrayValues = [stringValues componentsSeparatedByString:@","];
    
    
    for (int i = 0; i < self.arrayPrices.count; i++) {
        
        NSDictionary * dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                               [self.arrayPrices objectAtIndex:i], @"price",
                               [self.arrayValues objectAtIndex:i], @"value", nil];
     
        [self.arrayM addObject:dict];
        NSLog(@" %@", dict);
    
    }
   
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can de recreated.
    
}

//=======================================================================

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.arrayM.count;
    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[self.arrayM objectAtIndex: indexPath.row]objectForKey:@"values"];
    cell.detailTextLabel.text = [[self.arrayM objectAtIndex:indexPath.row]objectForKey:@"price"];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


@end
