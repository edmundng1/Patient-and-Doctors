//
//  HistoryEntry.h
//  PatientDoctors
//
//  Created by Enoch Ng on 2016-05-05.
//  Copyright © 2016 Enoch Ng. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Doctor;

@interface HistoryEntry : NSObject

@property (nonatomic) Doctor *doctorWhoPrescribed;
@property (nonatomic) NSString *prescription;

-(instancetype)initWithDoctor:(Doctor *)doctor andPrescription:(NSString *)prescription;


@end
