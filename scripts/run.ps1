#
# To Run on Modern Windows we have to set text encoding Set 
# console encoding for proper character display
#

[Console]::OutputEncoding = [System.Text.Encoding]::ASCII

#
# Run the Text Elite game
#

.\build\Release\txtelite.exe
