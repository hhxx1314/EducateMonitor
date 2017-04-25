#!/usr/bin/env python
# -*- coding:utf-8 -*-

#./autobuild.py -p youproject.xcodeproj -t youproject -o ~/Desktop/youproject.ipa
#./autobuild.py -w youproject.xcworkspace -s youproject -o ~/Desktop/youproject.ipa

from optparse import OptionParser
import subprocess

# 需要改动的地方 (根据自己的项目信息改动改动)
PROJECT_NAME = "EducateMonitor" 			#项目名称
VERSION = "1.0.0"  						#打包版本号 会根据不同的版本创建文件夹（与项目本身的版本号无关）

CONFIGURATION = "Debug" 				#Release 环境  Debug 环境
PROFILE = "development" 				#配置文件分为四种 "app-store", "ad-hoc", "development", "package", "enterprise", "developer-id"

TAGREAT_NAME = "%s" %(PROJECT_NAME) 	#就是对应的target
IPA_NAME = "监测"
OUTPUT = "/Users/West/Desktop/产品打包/%s/%s/%s" %(IPA_NAME,CONFIGURATION,VERSION) 


#蒲公英上传
OPEN_PYUPLOAD = False  	#是否开启蒲公英上传功能  True  False
#fir.im 上传
OPEN_FIR_UPLOAD = False  	#是否开启fir.im上传功能  True  False
#AppStore上传
OPEN_APPSTORE_UPLOAD = False  #是否开启AppStore上传上传功能  True  False

#启动打印函数
def printStart():
	print "*****************************************************************"
	print "*****************************************************************"
	print "                       开始打包                             "
	print "  项目名称：%s" %(PROJECT_NAME)
	print "  Target：%s" %(TAGREAT_NAME)
	print "  版 本 号：%s" %(VERSION)
	print "  编译环境：%s" %(CONFIGURATION)
	print "  证书配置：%s" %(PROFILE)
	print "  是否上传蒲公英：%s" %(OPEN_PYUPLOAD)
	print "  是否上传FIR.IM：%s" %(OPEN_FIR_UPLOAD)
	print "  是否上传AppStore：%s\n" %(OPEN_APPSTORE_UPLOAD)
	print "*****************************************************************"
	print "*****************************************************************"

#结束打印函数
def printEnd():
	print "*****************************************************************"
	print "*****************************************************************"
	print "                       结束打包                             "
	print "  项目名称：%s" %(PROJECT_NAME)
	print "  Target：%s" %(TAGREAT_NAME)
	print "  版 本 号：%s" %(VERSION)
	print "  编译环境：%s" %(CONFIGURATION)
	print "  证书配置：%s" %(PROFILE)
	print "  是否上传蒲公英：%s" %(OPEN_PYUPLOAD)
	print "  是否上传FIR.IM：%s" %(OPEN_FIR_UPLOAD)
	print "  是否上传AppStore：%s\n" %(OPEN_APPSTORE_UPLOAD)
	print "*****************************************************************"
	print "*****************************************************************"


def main():
	printStart()

	createCmd = "fastlane build target:%s version:%s config:%s profile:%s output:%s ipa_name:%s upload_pgyer:%s upload_appstore:%s" %(TAGREAT_NAME,VERSION,CONFIGURATION,PROFILE,OUTPUT,IPA_NAME,OPEN_PYUPLOAD,OPEN_APPSTORE_UPLOAD)
	process = subprocess.Popen(createCmd, shell = True)
	process.wait()

	printEnd()

if __name__ == '__main__':
	main()
