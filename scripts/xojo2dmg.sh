#!/bin/sh
#

# **************************************************************
# How to use Xojo2DMG.sh
# **************************************************************
# It's all being set up in the Xojo Post Build Script.
# You should not need to modify this Shell Script (unless you're
# going to extend it for more advanced applications of yours).
#
# And that's why you'll find all the infos and hints you need
# in the comments of the Xojo Post Build Script.
# **************************************************************


# **************************************************************
# Keychain: Notarization
# **************************************************************
# https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution/customizing_the_notarization_workflow?language=objc
# **************************************************************
# 1st: You need to create an application specific password for your AppleID.
# 2nd: The asc-provider flag for the notarization is needed if the AppleID is associated with multiple teams.
# You need to indicate the 'provider short name' for the appropriate team.
# We do this anyway (even with no multiple teams). You can get the required value 'ProviderShortname'
# like this in Terminal: (provide AppleID and your application-specific-password for Notarization)
# xcrun altool --list-providers -u "my-apple-id@icloud.com"
#
# Now that you have all you need:
# Add that AppleID, asc-provider and password to your keychain:
# security add-generic-password -s Xojo2DMGAppNotarization -a my-apple-id@icloud.com -j my-provider-shortname -w App-Specific-PaSSW0rd
# **************************************************************


# get input
echo "Xojo2DMG: reading input variables..."
PROJECT_PATH=$1
BUILD_LOCATION=$2
BUILD_APPNAME=$3

BUILD_TYPE=$4
DEBUGBUILD_CODESIGN=$5

DMG_VOLUME_FILENAME=$6
DMG_VOLUME_TITLE=$7
DMG_VOLUME_ICON=$8
DMG_BACKGROUND_IMG1=$9
DMG_BACKGROUND_IMG2=${10}
DMG_ALIAS_CAPTION=${11}

DMG_WINDOW_BOUNDS=${12}
DMG_ICON_SIZE=${13}
DMG_TEXT_SIZE=${14}
DMG_ICON_POSITION_APP=${15}
DMG_ICON_POSITION_ALIAS=${16}
DMG_FILE_ICON=${17}

BUILD_TARGET_BITS=${18}
CODESIGN_IDENT=${19}
CODESIGN_ENTITLEMENTS=${20}

NOTARIZATION_ENABLED=${21}
KEYCHAIN_APP_NOTARIZATION=Xojo2DMGAppNotarization


# check input
echo ""
echo "Xojo2DMG: checking input variables..."
if [ -z "$PROJECT_PATH" ]; then
	echo "Xojo2DMG ERROR: \$PROJECT_PATH is empty."
	exit 9
fi
if [ ! -d "${PROJECT_PATH}" ]; then
	echo "Xojo2DMG ERROR: \${PROJECT_PATH} = ${PROJECT_PATH} directory doesn't exist."
	exit 8
fi
if [ -z "$BUILD_LOCATION" ]; then
	echo "Xojo2DMG ERROR: \$BUILD_LOCATION is empty."
	exit 9
fi
if [ ! -d "${BUILD_LOCATION}" ]; then
	echo "Xojo2DMG ERROR: \${BUILD_LOCATION} = ${BUILD_LOCATION} directory doesn't exist."
	exit 8
fi
if [ -z "$BUILD_APPNAME" ]; then
	echo "Xojo2DMG ERROR: \$BUILD_APPNAME is empty."
	exit 9
fi
if [ -z "$BUILD_TYPE" ]; then
	echo "Xojo2DMG ERROR: \$BUILD_TYPE is empty."
	exit 9
fi
if [ -z "$DEBUGBUILD_CODESIGN" ]; then
	echo "Xojo2DMG ERROR: \$DEBUGBUILD_CODESIGN is empty."
	exit 9
fi
if [ -z "$DMG_VOLUME_FILENAME" ]; then
	echo "Xojo2DMG ERROR: \$DMG_VOLUME_FILENAME is empty."
	exit 9
fi
if [ -z "$DMG_VOLUME_TITLE" ]; then
	echo "Xojo2DMG ERROR: \$DMG_VOLUME_TITLE is empty."
	exit 9
fi
if [ -z "$DMG_VOLUME_ICON" ]; then
	echo "Xojo2DMG ERROR: \$DMG_VOLUME_ICON is empty."
	exit 9
fi
if [ -z "$DMG_BACKGROUND_IMG1" ]; then
	echo "Xojo2DMG ERROR: \$DMG_BACKGROUND_IMG1 is empty."
	exit 9
fi
if [ -z "$DMG_BACKGROUND_IMG2" ]; then
	echo "Xojo2DMG ERROR: \$DMG_BACKGROUND_IMG2 is empty."
	exit 9
fi
if [ -z "$DMG_ALIAS_CAPTION" ]; then
	DMG_ALIAS_CAPTION="Applications"
fi

if [ -z "$DMG_WINDOW_BOUNDS" ]; then
	DMG_WINDOW_BOUNDS="200, 100, 845, 585"
fi
if [ -z "$DMG_ICON_SIZE" ]; then
	DMG_ICON_SIZE="128"
fi
if [ -z "$DMG_TEXT_SIZE" ]; then
	DMG_TEXT_SIZE="16"
fi
if [ -z "$DMG_ICON_POSITION_APP" ]; then
	DMG_ICON_POSITION_APP="160, 340"
fi
if [ -z "$DMG_ICON_POSITION_ALIAS" ]; then
	DMG_ICON_POSITION_ALIAS="500, 340"
fi

if [ -z "$NOTARIZATION_ENABLED" ]; then
	echo "Xojo2DMG ERROR: \$NOTARIZATION_ENABLED is empty."
	exit 9
fi

# set up a couple of things
echo ""
echo "Xojo2DMG: setting up a couple of things..."

OLDIFS=$IFS

# helper to check version of OS
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

# get OS Version
echo "Xojo2DMG: checking OS Version"
OS_VERSION=$(sw_vers -productVersion)

vercomp ${OS_VERSION} 10.12.0
case $? in
		0) OS_PRODUCTNAME='macOS';;
		1) OS_PRODUCTNAME='macOS';;
		2) op='OS X';;
esac
echo "Xojo2DMG: ${OS_PRODUCTNAME} ${OS_VERSION}"


# do we need to CodeSign, create DMG with or without Notarization
XOJO2DMG_PERFORM=0
if [ "${BUILD_TYPE}" = "release" ]; then
	XOJO2DMG_PERFORM=1
else
	if [ "${DEBUGBUILD_CODESIGN}" = "yes" ]; then
		XOJO2DMG_PERFORM=1
	fi
fi

if [ $XOJO2DMG_PERFORM -eq 0 ]; then
	echo ""
	echo "Xojo2DMG: no actions required..."
	exit 2
fi

# we should not need to change these
APP_FROM_FILENAME="${BUILD_APPNAME}.app"
APP_FROM="${BUILD_LOCATION}/${APP_FROM_FILENAME}"
APP_NAME="$BUILD_APPNAME"
APP_FROM_FILENAME="${BUILD_APPNAME}.app"
APP_ZIP_FILENAME="${BUILD_APPNAME}.zip"

DMG_TMP="${BUILD_LOCATION}/${DMG_VOLUME_FILENAME}-temp.dmg"
DMG_FINAL="${BUILD_LOCATION}/${DMG_VOLUME_FILENAME}.dmg"
STAGING_DIR="${BUILD_LOCATION}/DMG_Template"
APP_TO="${STAGING_DIR}/${BUILD_APPNAME}.app"

#Keychain: Notarization
NOTARIZATION_PERFORM=0
SEC_NOTARIZATION=""
APPLEID=""
ASCPROVIDER=""
NOTARIZATION_PASSWORD=""

if [ "${NOTARIZATION_ENABLED}" = "yes" ]; then
	NOTARIZATION_PERFORM=1
fi

#Notarization requires CodeSigning
if [ -z "${CODESIGN_IDENT}" ]; then
	NOTARIZATION_PERFORM=0
fi
#only perform Notarization in release builds, and not in DebugBuilds
if [ "${BUILD_TYPE}" = "release" ]; then
	if [ $NOTARIZATION_PERFORM -eq 1 ]; then
		SEC_NOTARIZATION=`security find-generic-password -s ${KEYCHAIN_APP_NOTARIZATION} -g 2>&1`
		APPLEID=`echo "${SEC_NOTARIZATION}" | grep --text "acct" | cut -d \" -f 4`
		ASCPROVIDER=`echo "${SEC_NOTARIZATION}" | grep --text "icmt" | cut -d \" -f 4`
		NOTARIZATION_PASSWORD=`echo "$SEC_NOTARIZATION" | grep --text "password" | cut -d \" -f 2`

		if [ -z "$APPLEID" ]; then
			echo "Xojo2DMG: APPLEID is not defined for Notarization in Keychain Item '${KEYCHAIN_APP_NOTARIZATION}'."
			NOTARIZATION_PERFORM=0
		fi

		if [ -z "$NOTARIZATION_PASSWORD" ]; then
			echo "Xojo2DMG: NOTARIZATION_PASSWORD is not defined for Notarization in Keychain Item '${KEYCHAIN_APP_NOTARIZATION}'."
			NOTARIZATION_PERFORM=0
		fi

		if [ -z "$ASCPROVIDER" ]; then
			echo "Xojo2DMG: ASCPROVIDER is not defined for Notarization in Keychain Item '${KEYCHAIN_APP_NOTARIZATION}'."
			NOTARIZATION_PERFORM=0
		fi
	fi
else
	NOTARIZATION_PERFORM=0
fi

# change to our working directory
echo ""
echo "Xojo2DMG: change to our working directory"
if [ ! -d "${BUILD_LOCATION}" ]; then
	echo "Xojo2DMG ERROR: \${BUILD_LOCATION} = ${BUILD_LOCATION} doesn't exist."
	exit 8
fi
cd "${BUILD_LOCATION}"

echo ""
echo "Xojo2DMG: looking for the built .app"
if [ ! -d "${APP_FROM}" ]; then
	echo "Xojo2DMG ERROR: \${APP_FROM} = ${APP_FROM} doesn't exist."
	exit 8
fi

# clear out any old data
echo ""
echo "Xojo2DMG: clear out any old data"
rm -rf "${STAGING_DIR}" "${DMG_TMP}" "${DMG_FINAL}"

sync

# Cleanup and CodeSign
# ********************

# strip out i386 code in Frameworks
STRIP_I386_FRAMEWORKS=0
if [ "${BUILD_TARGET_BITS}" = "64Bit" ]; then
	#only in 64Bit Builds
	STRIP_I386_FRAMEWORKS=1
fi
if [ -z "${CODESIGN_IDENT}" ]; then
	#without CodeSigning we also don't strip Frameworks
	STRIP_I386_FRAMEWORKS=0
fi

if [ $STRIP_I386_FRAMEWORKS -eq 1 ]; then
	echo "Xojo2DMG: Find and Cleanup Frameworks (strip out i386)"
	sleep 1

	IFS=$'\n' frameworkFolderArray=( $(find "${APP_FROM}/Contents/Frameworks" -type d -name "*.framework") )

	for currentframeworkFolder in "${frameworkFolderArray[@]}"
	do
		IFS='/' read -r -a pathItemsArray <<< "${currentframeworkFolder}"
		currentFrameworkName="${pathItemsArray[@]: -1:1}"
		useLength=$(expr ${#currentFrameworkName} - 10)
		currentFrameworkName=${currentFrameworkName: 0:$useLength}

		if [ -d "${currentframeworkFolder}" ]; then
			if [ -d "${currentframeworkFolder}/Versions/A" ]; then
				echo "Xojo2DMG: Cleanup Framework: ${currentFrameworkName}"
				cd "${currentframeworkFolder}/Versions/A"
				#remove i386 parts
				lipo -archs "./${currentFrameworkName}" | grep "i386" && lipo "./${currentFrameworkName}" -remove i386 -output "./${currentFrameworkName}" && echo " -> " && lipo -archs "./${currentFrameworkName}"
			fi
		fi
	done
	sync
	sleep 1
fi
IFS=$OLDIFS
cd "${BUILD_LOCATION}"

if [ -n "${CODESIGN_IDENT}" ]; then
	echo ""
	echo "Xojo2DMG: Begin CodeSigning"
	# Removing extended Attributes (otherwise Xcode 8 and newer won't sign)
	echo ""
	echo "Xojo2DMG: Remove extended Attributes"
	xattr -rc "${APP_FROM}"

	CODESIGN_PARAM_TIMESTAMP=
	CODESIGN_HARDENED_RUNTIME=0
	# Hardened Runtime requires 10.13.6 or later
	vercomp ${OS_VERSION} 10.13.6
	case $? in
		0) op='=';;
		1) op='>';;
		2) op='<';;
	esac
	if [[ $op = '<' ]]
	then
		echo "Xojo2DMG: will CodeSign without Hardened Runtime which requires macOS 10.13.6 (or later)"
	else
		echo "Xojo2DMG: perform CodeSign with Hardened Runtime"
		#Prepare Entitlements
		if [ ! -f "${CODESIGN_ENTITLEMENTS}" ]; then
			echo "Xojo2DMG ERROR: \$CODESIGN_ENTITLEMENTS plist file not found."
			exit 11
		fi

		echo "Xojo2DMG: Make a copy of Entitlements.plist"
		CODESIGN_ENTITLEMENTS_APPLY="${BUILD_LOCATION}/CodeSign_Entitlements.plist"
		if [ -f "${CODESIGN_ENTITLEMENTS_APPLY}" ]; then
			rm -f "${CODESIGN_ENTITLEMENTS_APPLY}"
		fi
		ditto "${CODESIGN_ENTITLEMENTS}" "${CODESIGN_ENTITLEMENTS_APPLY}"
		sync
		if [ ! -f "${CODESIGN_ENTITLEMENTS_APPLY}" ]; then
			echo "Xojo2DMG ERROR: \$CODESIGN_ENTITLEMENTS plist file not found."
			exit 11
		fi
		if [ "${BUILD_TYPE}" = "release" ]; then
			echo "Xojo2DMG: Entitlements: Disable com.apple.security.cs.debugger"
			sed -i '' '/<key>com.apple.security.cs.debugger</{n;s/true/false/;}' "${CODESIGN_ENTITLEMENTS_APPLY}"
		else
			echo "Xojo2DMG: Entitlements: Enable com.apple.security.cs.debugger"
			sed -i '' '/<key>com.apple.security.cs.debugger</{n;s/false/true/;}' "${CODESIGN_ENTITLEMENTS_APPLY}"
		fi

		CODESIGN_PARAM_TIMESTAMP="--timestamp"
		CODESIGN_HARDENED_RUNTIME=1
	fi

	# Sign the app

	echo ""
	echo "Xojo2DMG: Sign the app..."
	echo ""
	echo "Xojo2DMG: Sign the app... (Contents/MacOS)"
	codesign $CODESIGN_PARAM_TIMESTAMP -f -s "${CODESIGN_IDENT}" "${APP_FROM}/Contents/MacOS/"*.dylib
	echo ""
	echo "Xojo2DMG: Sign the app... (Contents/Frameworks, Part 1)"
	codesign $CODESIGN_PARAM_TIMESTAMP -f -s "${CODESIGN_IDENT}" "${APP_FROM}/Contents/Frameworks/"*
	echo ""
	echo "Xojo2DMG: Sign the app... (Contents/Frameworks, Part 2)"
	codesign $CODESIGN_PARAM_TIMESTAMP -f -s "${CODESIGN_IDENT}" "${APP_FROM}/Contents/Frameworks/"*.framework
	echo ""
	echo "Xojo2DMG: Sign the app... (.app)"
	if [ $CODESIGN_HARDENED_RUNTIME -eq 1 ]; then
		codesign $CODESIGN_PARAM_TIMESTAMP -f --options runtime --entitlements "${CODESIGN_ENTITLEMENTS_APPLY}" --deep -s "${CODESIGN_IDENT}" "${APP_FROM}"
	else
		codesign $CODESIGN_PARAM_TIMESTAMP -f --deep -s "${CODESIGN_IDENT}" "${APP_FROM}"
	fi

	echo ""
	echo "Xojo2DMG: waiting for App to finish signing..."
	sleep 3

	if [ -f "${CODESIGN_ENTITLEMENTS_APPLY}" ]; then
		rm -f "${CODESIGN_ENTITLEMENTS_APPLY}"
	fi

	# Check CodeSign
	echo ""
	echo "Xojo2DMG: checking CodeSign... (Verifying Part 1)"
	codesign -d -vvvv "${APP_FROM}"
	if [ $? -gt 0 ]; then
		echo "Xojo2DMG ERROR: codesign -d -vvvv \"${APP_FROM}\" failed."
		exit 11
	fi
	echo ""
	echo "Xojo2DMG: checking CodeSign... (Verifying Part 2)"
	codesign --verify --verbose=3 "${APP_FROM}"
	if [ $? -gt 0 ]; then
		echo "Xojo2DMG ERROR: codesign --verify --verbose=3 \"${APP_FROM}\" failed."
		exit 11
	fi

	#only perform spctl assess for release builds, not for debug builds
	if [ "${BUILD_TYPE}" = "release" ]; then
		#spctl assess might fail with: source=Unnotarized Developer ID
		#so we only do that after the Notarization step on machines that require notarization
		vercomp ${OS_VERSION} 10.13.6
		case $? in
			0) op='=';;
			1) op='>';;
			2) op='<';;
		esac
		if [[ $op = '<' ]]
		then
			echo ""
			echo "Xojo2DMG: checking CodeSign... (spctl assess)"
			spctl --assess -vvvv --type exec "${APP_FROM}"
			if [ $? -gt 0 ]; then
				echo "Xojo2DMG ERROR: spctl --assess -vvvv --type exec \"${APP_FROM}\" failed."
				exit 11
			fi
		else
			echo ""
			echo "Xojo2DMG: checking CodeSign is not performing 'spctl assess' before"
			echo "          the notarization step (if enabled)"
		fi
	fi
	echo ""
	echo "Xojo2DMG: finished checking CodeSign"
	sleep 1
else
	#Without CodeSigning, Notarization is not possible.
	NOTARIZATION_PERFORM=0
fi



# Prepare Environment to build the DMG
# ************************************
if [ ! "${BUILD_TYPE}" = "release" ]; then
	echo "Xojo2DMG: DMG and Notarization are only active in ReleaseBuilds"
	echo "Xojo2DMG: For a DebugBuild, all work is done"
	exit 2
fi

# create our staging directory
echo ""
echo "Xojo2DMG: create our staging directory to build the DMG"
cd "${BUILD_LOCATION}"
mkdir -p "${STAGING_DIR}"
if [ ! -d "${STAGING_DIR}" ]; then
	echo "Xojo2DMG ERROR: \${STAGING_DIR} = ${STAGING_DIR} doesn't exist."
	exit 8
fi

# copy over the stuff we want in the final disk image to our staging directory
echo ""
echo "Xojo2DMG: copy all we need in the final disk image to our staging directory"
ditto "${APP_FROM}" "${APP_TO}"
if [ $? -gt 0 ]; then
	echo "Xojo2DMG ERROR: ditto \"${APP_FROM}\" \"${APP_TO}\" failed."
	exit 8
fi

echo ""
echo "Xojo2DMG: waiting for App to finish copying to staging directory..."


# figure out how big our DMG needs to be
echo ""
echo "Xojo2DMG: figure out how big the .dmg needs to be"
IFS=$OLDIFS
DMG_SIZE=(`du -m $temp | tail -1`)
DMG_SIZE=$(( $DMG_SIZE + 50 ))
echo "Xojo2DMG: size required for temporary DMG: ${DMG_SIZE}M"

# create the temp DMG file
echo ""
echo "Xojo2DMG: create temporary .dmg"
hdiutil create -srcfolder "${STAGING_DIR}" -volname "${DMG_VOLUME_TITLE}" -fs HFS+ -fsargs "-c c=64,a=16,e=16" -format UDRW -size ${DMG_SIZE}M "${DMG_TMP}"
echo ""
echo "Xojo2DMG: created temporary DMG: ${DMG_TMP}"

# mount it and save the device
echo ""
echo "Xojo2DMG: mount the temporary .dmg"
DEVICE=$(hdiutil attach -readwrite -noverify "${DMG_TMP}" | egrep '^/dev/' | sed 1q | awk '{print $1}')
if [ $? -gt 0 ]; then
	echo "Xojo2DMG ERROR: hdiutil attach -readwrite -noverify \"${DMG_TMP}\" failed."
	exit 8
fi

if [ -z "$DEVICE" ]; then
	echo "Xojo2DMG ERROR: \$DEVICE of temporary DMG is empty."
	exit 9
fi

echo ""
echo "Xojo2DMG: DMG Device: ${DEVICE}"

echo ""
echo "Xojo2DMG: waiting for temporary DMG to become ready..."
sleep 8

# add a link to the Applications dir
echo ""
echo "Xojo2DMG: Adding a link to /Applications"
pushd /Volumes/"${DMG_VOLUME_TITLE}"
ln -s /Applications "./${DMG_ALIAS_CAPTION}"
popd

# add background image
echo ""
echo "Xojo2DMG: creating hidden folder for background"
mkdir /Volumes/"${DMG_VOLUME_TITLE}"/.background

echo ""
echo "Xojo2DMG: combining the two background images into a multiresolution .tiff"
tiffutil -cathidpicheck "${DMG_BACKGROUND_IMG1}" "${DMG_BACKGROUND_IMG2}" -out /Volumes/"${DMG_VOLUME_TITLE}"/.background/backgroundImage.tiff

# tell the Finder to resize the window, set the background,
# change the icon size, place the icons in the right position, etc.
echo ""
echo "Xojo2DMG: running an AppleScript to set up view properties of the .dmg"
echo '
   tell application "Finder"
     tell disk "'${DMG_VOLUME_TITLE}'"
           open
           delay 2
		   activate
		   delay 1
           set current view of container window to icon view
           set toolbar visible of container window to false
           set statusbar visible of container window to false
           set viewOptions to the icon view options of container window
           delay 1
           set the bounds of container window to {'${DMG_WINDOW_BOUNDS}'}
           delay 1
           set arrangement of viewOptions to not arranged
           set icon size of viewOptions to '${DMG_ICON_SIZE}'
           set text size of viewOptions to '${DMG_TEXT_SIZE}'
           set background picture of viewOptions to file ".background:backgroundImage.tiff"
           delay 1
           set position of item "'${APP_NAME}'.app" of container window to {'${DMG_ICON_POSITION_APP}'}
           set position of item "'${DMG_ALIAS_CAPTION}'" of container window to {'${DMG_ICON_POSITION_ALIAS}'}
           delay 1
           close
           open
           update without registering applications
           delay 4
     end tell
   end tell
' | osascript

sync
sleep 2

# add volume icon
echo ""
echo "Xojo2DMG: adding volume icon file"
ditto "${DMG_VOLUME_ICON}" /Volumes/"${DMG_VOLUME_TITLE}"/.VolumeIcon.icns
xcrun SetFile -a V /Volumes/"${DMG_VOLUME_TITLE}"/.background
xcrun SetFile -a C /Volumes/"${DMG_VOLUME_TITLE}"/

sync
sleep 2

# unmount it
echo ""
echo "Xojo2DMG: unmount the temporary .dmg"
hdiutil detach "${DEVICE}"

# now make the final image a compressed disk image
echo ""
echo "Xojo2DMG: create the final compressed .dmg"
hdiutil convert -format UDBZ -o "${DMG_FINAL}" "${DMG_TMP}"
if [ $? -gt 0 ]; then
	echo "Xojo2DMG ERROR: hdiutil convert -format UDBZ -o \"${DMG_FINAL}\" \"${DMG_TMP}\" failed."
	exit 8
fi

# hdiutil internet-enable has been removed in macOS 10.15
vercomp ${OS_VERSION} 10.15.0
case $? in
	0) op='=';;
	1) op='>';;
	2) op='<';;
esac
if [[ $op = '<' ]]
then
	hdiutil internet-enable -yes "${DMG_FINAL}"
fi
sync

if [ -n "${DMG_FILE_ICON}" ]; then
echo ""
echo "Xojo2DMG: adding the VolumeIcon to the final .dmg file using a Python Script"
python << END_PYTHON
import Cocoa
import sys

Cocoa.NSWorkspace.sharedWorkspace().setIcon_forFile_options_(Cocoa.NSImage.alloc().initWithContentsOfFile_("${DMG_FILE_ICON}"), "${DMG_FINAL}", 0)
END_PYTHON
fi


# CodeSign the final .dmg
if [ -n "${CODESIGN_IDENT}" ]; then
	echo ""
	echo "Xojo2DMG: CodeSign the final .dmg (requires OS X 10.11.5 or later)"
	# this requires 10.11.5 or later
	vercomp ${OS_VERSION} 10.11.5
	case $? in
		0) op='=';;
		1) op='>';;
		2) op='<';;
	esac
	if [[ $op = '<' ]]
	then
		echo ""
		echo "Xojo2DMG: Can't CodeSign the final .dmg, as this requires OS X 10.11.5 (or later)"
	else
		echo ""
		echo "Xojo2DMG: CodeSign the final .dmg"
		codesign $CODESIGN_PARAM_TIMESTAMP --force --sign "${CODESIGN_IDENT}" "${DMG_FINAL}"
		if [ $? -gt 0 ]; then
			echo "Xojo2DMG ERROR: codesign $CODESIGN_PARAM_TIMESTAMP --force --sign \"${CODESIGN_IDENT}\" \"${DMG_FINAL}\" failed."
			exit 11
		fi
	fi
fi

# clean up
echo ""
echo "Xojo2DMG: cleaning up..."
rm -rf "${DMG_TMP}"
rm -rf "${STAGING_DIR}"


#*******************
# Notarize by Apple
#*******************
NOTARIZATION_COMPLETED=0
NOTARIZATION_RESULT=0
NOTARIZATION_STATUS=""
NOTARIZATION_ERROR=""
APP_BUNDLE_IDENTIFIER=(`/usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' "${APP_FROM}/Contents/Info.plist"`)


#Notarization requires macOS 10.13.6 or later
if [ $NOTARIZATION_PERFORM -eq 1 ]; then
		echo ""
		echo "Xojo2DMG: checking Notarization (requires macOS 10.13.6 or later)"
		vercomp ${OS_VERSION} 10.13.6
		case $? in
			0) op='=';;
			1) op='>';;
			2) op='<';;
		esac
		if [[ $op = '<' ]]
		then
			echo ""
			echo "Xojo2DMG: Can't Notarize, as this requires macOS 10.13.6 (or later)"
			NOTARIZATION_PERFORM=0
		fi
fi

if [ $NOTARIZATION_PERFORM -eq 1 ]; then
	echo "Xojo2DMG: Notarize by Apple"
	sync
	NOTARIZATION_COMPLETED=0
	echo "Xojo2DMG: Uploading disk image for Notarization... This can take a while..."
	APP_NOTARIZATION_OUTPUT="${BUILD_LOCATION}/notarization_output.txt"
	xcrun altool --notarize-app --type osx --file "${DMG_FINAL}" --primary-bundle-id "${APP_BUNDLE_IDENTIFIER}" --username "${APPLEID}" --password @keychain:"${KEYCHAIN_APP_NOTARIZATION}" --asc-provider "${ASCPROVIDER}" > "${APP_NOTARIZATION_OUTPUT}" 2>&1
	NOTARIZATION_RESULT=$?
	sync

	REQUESTUUID=""
	TERMINAL_GET_REQUEST_INFO=""
	if [ $NOTARIZATION_RESULT -eq 0 ]; then
		REQUESTUUID=$(sed -n 's/RequestUUID = \(.*\)/\1/p' "${APP_NOTARIZATION_OUTPUT}")
	fi
	if [ ! -z $REQUESTUUID ]; then
		TERMINAL_GET_REQUEST_INFO="See 'xcrun altool --notarization-info \"${REQUESTUUID}\" --username \"${APPLEID}\" --password @keychain:\"${KEYCHAIN_APP_NOTARIZATION}\" --asc-provider \"${ASCPROVIDER}\"'"
		echo "Xojo2DMG: Notarization: Upload complete"
		sync
		echo "Xojo2DMG: Disk image has been uploaded. Request UUID is ${REQUESTUUID}."
		echo "Xojo2DMG: Waiting 1 minute..."
		sleep 60
		echo "Xojo2DMG: Checking status every 25 seconds..."
		NOTARIZATION_STATUS="in progress"
		while [ "${NOTARIZATION_STATUS}" = "in progress" ]; do
			sleep 25
			echo "Checking status..."
			xcrun altool --notarization-info "${REQUESTUUID}" --username "${APPLEID}" --password @keychain:"${KEYCHAIN_APP_NOTARIZATION}" --asc-provider "${ASCPROVIDER}" > "${APP_NOTARIZATION_OUTPUT}" 2>&1
			NOTARIZATION_RESULT=$?
			if [ $NOTARIZATION_RESULT -eq 0 ]; then
				NOTARIZATION_COMPLETED=1
				NOTARIZATION_STATUS=$(sed -ne 's/^[[:space:]]*Status: \(.*\)$/\1/p' "${APP_NOTARIZATION_OUTPUT}")
				echo "Xojo2DMG: Status is ${NOTARIZATION_STATUS}"
			else
				NOTARIZATION_COMPLETED=0
				NOTARIZATION_STATUS="failed"
			    NOTARIZATION_ERROR="Failed to check on notarization status."
			fi
		done
	else
		NOTARIZATION_COMPLETED=0
		NOTARIZATION_STATUS="not uploaded, no UUID received"
	    NOTARIZATION_ERROR="Error trying to upload for Notarization. No Request UUID received."
	fi
	
	#cleanup output
	rm -f "${APP_NOTARIZATION_OUTPUT}"
	sync

	if [ "${NOTARIZATION_STATUS}" = "success" ]; then
		echo "Xojo2DMG: Notarization: Staple to Disk Image..."
		sync
		NOTARIZATION_STATUS="stapling to disk image"
		xcrun stapler staple -v "${DMG_FINAL}"
		NOTARIZATION_RESULT=$?
		if [ $NOTARIZATION_RESULT -eq 0 ]; then
			echo "Notarization: Staple to Disk Image successfully completed"
			NOTARIZATION_STATUS="stapled"
			NOTARIZATION_COMPLETED=2
		else
			NOTARIZATION_ERROR="Staple to Disk Image was not successful."
			echo "Xojo2DMG ERROR: Notarization Error - ${NOTARIZATION_ERROR}"
			exit 12
		fi
	else
		echo "Xojo2DMG: Disk image was not notarized, status is ${NOTARIZATION_STATUS}."
		NOTARIZATION_ERROR="Disk image was not notarized. Status is ${NOTARIZATION_STATUS}.\n${TERMINAL_GET_REQUEST_INFO}"
		echo "Xojo2DMG ERROR: Notarization Error - ${NOTARIZATION_ERROR}"
		exit 12
	fi

	sync

	if [ $NOTARIZATION_COMPLETED -eq 2 ]; then
		echo "Xojo2DMG: Notarization: Staple to Application..."
		sync
		NOTARIZATION_STATUS="stapling to application"
		xcrun stapler staple -v "${APP_FROM}"
		NOTARIZATION_RESULT=$?
		if [ $NOTARIZATION_RESULT -eq 0 ]; then
			echo "Xojo2DMG: Notarization: Staple to Application successfully completed"
			NOTARIZATION_STATUS="stapled"
			NOTARIZATION_COMPLETED=3
		else
			NOTARIZATION_ERROR="Staple to Application was not successful."
			echo "Xojo2DMG ERROR: Notarization Error - ${NOTARIZATION_ERROR}"
			exit 12
		fi
	fi

	sync


	if [ $NOTARIZATION_COMPLETED -eq 3 ]; then
		echo "Xojo2DMG: Notarization by Apple has completed successfully."
	else
		echo "Xojo2DMG ERROR: Notarization could not be completed.\nNOTARIZATION_STATUS: ${NOTARIZATION_STATUS}:\nNOTARIZATION_ERROR: ${NOTARIZATION_ERROR}"
		exit 12
	fi
	sync
fi

sync
sleep 2

	
#checking CodeSign of .dmg
# this requires 10.12.0 or later
echo ""
vercomp ${OS_VERSION} 10.12.0
case $? in
	0) op='=';;
	1) op='>';;
	2) op='<';;
esac
if [[ $op = '<' ]]
then
	echo "Xojo2DMG: Can't check CodeSign of the final .dmg, as this requires macOS 10.12.0 (or later)"
else
	if [ $NOTARIZATION_PERFORM -eq 1 ]; then
		echo "Xojo2DMG: checking CodeSign of the notarized .dmg"
		spctl -a -t open --context context:primary-signature -v "${DMG_FINAL}"
		if [ $? -gt 0 ]; then
			echo "Xojo2DMG ERROR: spctl -a -t open --context context:primary-signature -v \"${DMG_FINAL}\" failed."
			exit 12
		fi

		echo ""
		echo "Xojo2DMG: checking CodeSign... (spctl assess)"
		echo "          this should now work since the .app has been notarized"
		spctl --assess -vvvv --type exec "${APP_FROM}"
		if [ $? -gt 0 ]; then
			echo "Xojo2DMG ERROR: spctl --assess -vvvv --type exec \"${APP_FROM}\" failed."
			exit 12
		fi
	else
		echo "Xojo2DMG: checking CodeSign of the .dmg (requires macOS 10.12.0 or later)"
		spctl -a -t open --context context:primary-signature -v "${DMG_FINAL}"
		if [ $? -gt 0 ]; then
			#macOS 10.14.5 and later will fail this check if the .dmg is not notarized
			vercomp ${OS_VERSION} 10.14.5
			case $? in
				0) op='=';;
				1) op='>';;
				2) op='<';;
			esac
			if [[ $op = '<' ]]
			then
				echo "Xojo2DMG ERROR: spctl -a -t open --context context:primary-signature -v \"${DMG_FINAL}\" failed."
				exit 11
			else
				echo "Xojo2DMG: macOS 10.14.5 and later will fail to check the .dmg if it is not notarized. So this error is expected."
			fi
		fi

		echo ""
		echo "Xojo2DMG: checking CodeSign... (spctl assess)"
		spctl --assess -vvvv --type exec "${APP_FROM}"
		if [ $? -gt 0 ]; then
			#macOS 10.14.5 and later will fail this check if the .dmg is not notarized
			vercomp ${OS_VERSION} 10.14.5
			case $? in
				0) op='=';;
				1) op='>';;
				2) op='<';;
			esac
			if [[ $op = '<' ]]
			then
				echo "Xojo2DMG ERROR: spctl --assess -vvvv --type exec \"${APP_FROM}\" failed."
				exit 11
			else
				echo "Xojo2DMG: macOS 10.14.5 and later may fail to check the .app if it is not notarized. So this error is somehow expected."
			fi
		fi
	fi
fi

#create a zip with the application, which now has the stapled Notarization ticket
#this zip can be used for further distribution. but note: the DMG is the preferred way.
echo ""
if [ $NOTARIZATION_PERFORM -eq 1 ]; then
		echo "Xojo2DMG: ZIP the application which now contains the stapled Notarization ticket"
else
	if [ -n "${CODESIGN_IDENT}" ]; then
		echo "Xojo2DMG: ZIP the codesigned application"
	else
		echo "Xojo2DMG: ZIP the application"
	fi
fi
cd "${BUILD_LOCATION}"
ditto -c -k --keepParent --sequesterRsrc --zlibCompressionLevel 9 "./${APP_FROM_FILENAME}" "./${APP_ZIP_FILENAME}"


sync
sleep 5
sync

echo ""
echo "Xojo2DMG: It's all done."
exit 0