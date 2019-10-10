//
//  WFAccount.m
//  WFBEST
//
//  Created by 刘芳芳 on 15/2/26.
//  Copyright (c) 2015年 51fanxing. All rights reserved.
//

#import "WFAccount.h"

@implementation WFAccount

// 把对象归档进沙盒中
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.userId forKey:@"userId"];
    [encoder encodeObject:self.accessToken forKey:@"accessToken"];
    [encoder encodeObject:self.phoneCode forKey:@"phoneCode"];
    [encoder encodeObject:self.gender forKey:@"gender"];
    [encoder encodeObject:self.idcardImg  forKey:@"idcardImg"];
    [encoder encodeObject:self.birthday forKey:@"birthday"];
    [encoder encodeObject:self.drivingLicenceImg forKey:@"drivingLicenceImg"];
    [encoder encodeObject:self.fleetId forKey:@"fleetId"];
    [encoder encodeObject:self.status forKey:@"status"];
    [encoder encodeObject:self.hasCompany forKey:@"hasCompany"];
    [encoder encodeObject:self.isEffective forKey:@"isEffective"];
    [encoder encodeObject:self.lastADtime forKey:@"lastADtime"];
    [encoder encodeObject:self.pageType forKey:@"pageType"];
    [encoder encodeObject:self.rejectReason forKey:@"rejectReason"];
    [encoder encodeObject:self.userType forKey:@"userType"];
    [encoder encodeObject:self.isAdmin forKey:@"isAdmin"];
    [encoder encodeObject:self.globalToken forKey:@"globalToken"];
    [encoder encodeObject:self.insuranceFlag forKey:@"insuranceFlag"];
    [encoder encodeObject:self.auth forKey:@"auth"];

}

// 从沙盒中解档一个对象
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init]) {
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.userId = [decoder decodeObjectForKey:@"userId"];
        self.accessToken = [decoder decodeObjectForKey:@"accessToken"];
        self.phoneCode = [decoder decodeObjectForKey:@"phoneCode"];
        self.gender = [decoder decodeObjectForKey:@"gender"];
        self.idcardImg = [decoder decodeObjectForKey:@"idcardImg"];
        self.birthday = [decoder decodeObjectForKey:@"birthday"];
        self.drivingLicenceImg = [decoder decodeObjectForKey:@"drivingLicenceImg"];
        self.fleetId = [decoder decodeObjectForKey:@"fleetId"];
        self.status = [decoder decodeObjectForKey:@"status"];
        self.hasCompany = [decoder decodeObjectForKey:@"hasCompany"];
        self.isEffective = [decoder decodeObjectForKey:@"isEffective"];
        self.lastADtime = [decoder decodeObjectForKey:@"lastADtime"];
        self.pageType = [decoder decodeObjectForKey:@"pageType"];
        self.rejectReason = [decoder decodeObjectForKey:@"rejectReason"];
        self.userType = [decoder decodeObjectForKey:@"userType"];
        self.isAdmin = [decoder decodeObjectForKey:@"isAdmin"];
        self.globalToken = [decoder decodeObjectForKey:@"globalToken"];
        self.insuranceFlag = [decoder decodeObjectForKey:@"insuranceFlag"];
        self.auth = [decoder decodeObjectForKey:@"auth"];

    }
    return self;
}


@end
