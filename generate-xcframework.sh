#!/bin/bash -e

declare -a platforms=("iOS" "iOS Simulator" "watchOS" "watchOS Simulator" "tvOS" "tvOS Simulator")
declare -a schemes=("Rudder_iOS" "Rudder_iOS" "Rudder_watchOS" "Rudder_watchOS" "Rudder_tvOS" "Rudder_tvOS")

# Clean directories
rm -rf archives/
rm -rf xcframeworks

# Archive for each platform
for ((i = 0; i < ${#platforms[@]}; i++)); do
    platform="${platforms[i]}"
    scheme="${schemes[i]}"

    archive_path="archives/Rudder-${platform// /-}"

    xcodebuild archive \
        -workspace Rudder.xcworkspace \
        -scheme "${scheme}" \
        -destination "generic/platform=${platform}" \
        -archivePath "${archive_path}" \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        SKIP_INSTALL=NO |
        xcpretty

    # Check if the archive was successful
    if [ $? -ne 0 ]; then
        echo "Error: Archive failed for ${platform}. Exiting."
        exit 1
    fi
done

# Create xcframework for each platform
for platform in "${platforms[@]}"; do
    framework_name="Rudder.framework"
    archive_path="archives/Rudder-${platform// /-}.xcarchive"

    xcodebuild -create-xcframework \
        -archive "${archive_path}" -framework "${framework_name}" \
        -output "xcframeworks/Rudder-${platform// /-}.xcframework" |
        xcpretty
done
