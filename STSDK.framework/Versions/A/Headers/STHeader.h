//
//  STHeader.h
//  STSDK
//
//  Created by Tommy-mac on 2019/12/31.
//

#ifndef STHeader_h
#define STHeader_h
/*
#ifdef DEBUG
# define STLog(format,...) NSLog((@"[%s][%s][%d]" format), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define STLog(...);
#endif
*/
//#import "YYModel.h"

#define IOS8 ([[UIDevice currentDevice].systemVersion intValue] >= 8 ? YES : NO)
#define IOS9 ([[UIDevice currentDevice].systemVersion intValue] >= 9 ? YES : NO)
#define IOS10 ([[UIDevice currentDevice].systemVersion intValue] >= 10 ? YES : NO)

#ifndef __OPTIMIZE__
#define STLog(FORMAT,...)   NSLog(@"%s [Line %d] %@", __func__, __LINE__, [NSString stringWithFormat:FORMAT, ##__VA_ARGS__])
//#define STLog(...) {}
#else
#define STLog(...) {}
#endif

#endif /* STHeader_h */
