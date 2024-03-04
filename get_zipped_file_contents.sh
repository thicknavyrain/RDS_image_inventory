#!/bin/bash

# Directory to store the output text files
outputDir="camera_zip_contents"

# Create the output directory if it doesn't exist
mkdir -p "$outputDir"

# Use an array to define the directories to search for zip and 7z files, correctly handling spaces
directories=(
    "../projects/imagery-accra/live/Full_Campaign_Accra/Long Term Sites/Camera"
    "../projects/imagery-accra/live/Full_Campaign_Accra/Long Term Sites/Camera_PostCampaign"
    "../projects/imagery-accra/live/Full_Campaign_Accra/Long Term Sites/Camera_PostCampaign2"
    "../projects/imagery-accra/live/Full_Campaign_Accra/Long Term Sites/Camera_PostCampaign3"
    "../projects/imagery-accra/live/Full_Campaign_Accra/Long Term Sites/Camera_PostCampaign4"
)

# Count the total number of archives
totalArchives=$(find "${directories[@]}" -type f \( -name "*.7z" -o -name "*.zip" \) | wc -l)
currentArchive=0

# Process each archive and update the progress
find "${directories[@]}" -type f \( -name "*.7z" -o -name "*.zip" \) | while read archive; do
    ((currentArchive++))
    progress=$((currentArchive * 100 / totalArchives))

    # Extract the file name without the path and extension
    baseName=$(basename "$archive" | sed 's/\(.*\)\..*/\1/')
    
    # Use 7za to list the contents of the archive and redirect the output to a text file with the same name as the archive
    7za l "$archive" > "${outputDir}/${baseName}.txt"
    
    # Update the progress bar
    echo -ne "Processing: $progress% ($currentArchive/$totalArchives)\r"
done

echo -e "\nAll archive contents have been listed in ${outputDir}."

