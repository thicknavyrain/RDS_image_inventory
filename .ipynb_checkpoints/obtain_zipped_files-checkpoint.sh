#!/bin/bash

find ../projects/imagery-accra/live/Full_Campaign_Accra/Long\ Term\ Sites/Camera ../projects/imagery-accra/live/Full_Campaign_Accra/Long\ Term\ Sites/Camera_PostCampaign ../projects/imagery-accra/live/Full_Campaign_Accra/Long\ Term\ Sites/Camera_PostCampaign2 ../projects/imagery-accra/live/Full_Campaign_Accra/Long\ Term\ Sites/Camera_PostCampaign3 ../projects/imagery-accra/live/Full_Campaign_Accra/Long\ Term\ Sites/Camera_PostCampaign4 -type f \( -name "*.7z" -o -name "*.zip" \) >> camera_zip_file_paths.txt
