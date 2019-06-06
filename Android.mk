LOCAL_PATH := $(call my-dir)

ICUROOT := /Users/mlabbe/Documents/code/vendors/platform_external_icu4c

include $(CLEAR_VARS)

LOCAL_MODULE := corefoundationlite

# Support includes in format <CoreFoundation/CFBase.h>
LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/CoreFoundation

# removed files: 
# CFBundle.c -- also removed in Linux
# CFBundle_Resources.c  
# CFMachPort.c 
# CFMessagePort.c 
# CFPlugin.c
# CFPlugin_Factory.c
# CFPlugIn_Instance.c 
# CFPlugIn_PlugIn.c 
# CFRunloop.c
# CFSocket.c 
# CFUserNotification.c

LOCAL_SRC_FILES := \
CoreFoundation/CFApplicationPreferences.c \
CoreFoundation/CFArray.c \
CoreFoundation/CFBag.c \
CoreFoundation/CFBase.c \
CoreFoundation/CFBasicHash.c \
CoreFoundation/CFBigNumber.c \
CoreFoundation/CFBinaryHeap.c \
CoreFoundation/CFBinaryPList.c \
CoreFoundation/CFBitVector.c \
CoreFoundation/CFBuiltinConverters.c \
CoreFoundation/CFBurstTrie.c \
CoreFoundation/CFCalendar.c \
CoreFoundation/CFCharacterSet.c \
CoreFoundation/CFConcreteStreams.c \
CoreFoundation/CFData.c \
CoreFoundation/CFDate.c \
CoreFoundation/CFDateFormatter.c \
CoreFoundation/CFDictionary.c \
CoreFoundation/CFError.c \
CoreFoundation/CFFileUtilities.c \
CoreFoundation/CFICUConverters.c \
CoreFoundation/CFLocale.c \
CoreFoundation/CFLocaleIdentifier.c \
CoreFoundation/CFLocaleKeys.c \
CoreFoundation/CFNumber.c \
CoreFoundation/CFNumberFormatter.c \
CoreFoundation/CFOldStylePList.c \
CoreFoundation/CFPlatform.c \
CoreFoundation/CFPlatformConverters.c \
CoreFoundation/CFPreferences.c \
CoreFoundation/CFPropertyList.c \
CoreFoundation/CFRuntime.c \
CoreFoundation/CFSet.c \
CoreFoundation/CFSocketStream.c \
CoreFoundation/CFSortFunctions.c \
CoreFoundation/CFStorage.c \
CoreFoundation/CFStream.c \
CoreFoundation/CFString.c \
CoreFoundation/CFStringEncodingConverter.c \
CoreFoundation/CFStringEncodingDatabase.c \
CoreFoundation/CFStringEncodings.c \
CoreFoundation/CFStringScanner.c \
CoreFoundation/CFStringUtilities.c \
CoreFoundation/CFSystemDirectories.c \
CoreFoundation/CFTimeZone.c \
CoreFoundation/CFTree.c \
CoreFoundation/CFURL.c \
CoreFoundation/CFURLAccess.c \
CoreFoundation/CFUUID.c \
CoreFoundation/CFUniChar.c \
CoreFoundation/CFUnicodeDecomposition.c \
CoreFoundation/CFUnicodePrecomposition.c \
CoreFoundation/CFUtilities.c \
CoreFoundation/CFVersion.c \
CoreFoundation/CFWindowsUtilities.c \
CoreFoundation/CFXMLInputStream.c \
CoreFoundation/CFXMLNode.c \
CoreFoundation/CFXMLParser.c \
CoreFoundation/CFXMLPreferencesDomain.c \
CoreFoundation/CFXMLTree.c 

# todo: remove Linux case
LOCAL_EXPORT_CFLAGS := -DDEPLOYMENT_TARGET_LINUX -DDEPLOYMENT_TARGET_ANDROID

LOCAL_CFLAGS = -x c -fblocks -std=gnu99 -Wno-trigraphs -fexceptions -DCF_BUILDING_CF=1 -DDISABLE_GCD -include CoreFoundation_Prefix.h -nostdlibinc -I$(LOCAL_PATH)/../libBlocksRuntime  -I $(ICUROOT)/i18n -I $(ICUROOT)/common $(LOCAL_EXPORT_CFLAGS)

#note: not all flags from MakefileLinux have been ported over.
LOCAL_LDFLAGS = -fpic 

include $(BUILD_STATIC_LIBRARY)

$(call import-module,libBlocksRuntime)
