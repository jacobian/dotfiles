macos-bundle-id() {
    if [ $# -eq 0 ]; then
        echo "Usage: show-bundle-id <path/to/app>"
        return 1
    fi

    local app_path="$1"
    if [ ! -d "$app_path" ]; then
        echo "Error: '$app_path' is not a valid directory"
        return 1
    fi

    local plist_path="$app_path/Contents/Info.plist"
    if [ ! -f "$plist_path" ]; then
        echo "Error: Info.plist not found in '$app_path'"
        return 1
    fi

    /usr/libexec/PlistBuddy -c "Print CFBundleIdentifier" "$plist_path" 2>/dev/null || echo "Error: Bundle identifier not found"
}
