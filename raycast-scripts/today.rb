#!/usr/bin/env ruby

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Todays date
# @raycast.mode silent
# @raycast.refreshTime 1h

# Optional parameters:
# @raycast.icon 🕰

# Documentation:
# @raycast.author Mathew Artemenko

date = Time.now.strftime("%Y-%m-%d")
`echo #{date} | pbcopy`
puts Time.now.strftime("%Y-%m-%d")