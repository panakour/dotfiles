#!/usr/bin/osascript

tell application "System Events" to make login item at end with properties {path:"/System/Applications/Utilities/Terminal.app", hidden:false}
tell application "System Events" to make login item at end with properties {path:"/Applications/Rectangle.app", hidden:true}
tell application "System Events" to make login item at end with properties {path:"/Applications/Thunderbird.app", hidden:false}
