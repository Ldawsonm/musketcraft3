import os
import json
import zipfile
import tempfile
import shutil
from utils import *

#NOTE Change this variable when exporting in a different dev environment
# path = "C:\\Users\\ldmar\\curseforge\\minecraft\\Instances\\adventure-build\\export"
path = os.path.dirname(os.path.abspath(__file__))
os.chdir(path)

## CREATING THE MANIFEST.JSON AND MODLIST.HTML
# Open both minecraftinstance.json and manifest.json
with open('../minecraftinstance.json', 'r', encoding='utf-8') as file:
    json_str = file.read()
    profile = json.loads(json_str)

with open('manifest.json', 'r') as manifestFile:
    manifest = json.load(manifestFile)

# copy over important instance data into manifest
manifest["minecraft"] = {}
manifest["minecraft"]["version"] = profile["baseModLoader"]["minecraftVersion"]
manifest["minecraft"]["modLoaders"] = []
manifest["minecraft"]["modLoaders"].append({
    "id": profile["baseModLoader"]["name"],
    "primary": True
})
manifest["name"] = profile["name"]

# copy over mods into manifest
modFiles = []
htmlModEntries = []
manifest["files"] = []
for addonDict in profile["installedAddons"]:
    if not addonDict["fileNameOnDisk"].endswith(".jar"):
        continue
    addon = {}
    addon["projectID"] = addonDict["addonID"]
    addon["fileID"] = addonDict["installedFile"]["id"]
    addon["required"] = True
    manifest["files"].append(addon)
    modFiles.append(addonDict["fileNameOnDisk"])
    modHtml = "<li><a href=\"" + addonDict["webSiteURL"] + "\">" + addonDict["name"] + " (by " + addonDict["primaryAuthor"] +")</a></li>"
    htmlModEntries.append(modHtml)

# Produce HTML file as a string
modlistHTML = "<ul>"
for mod in htmlModEntries:
    modlistHTML = modlistHTML + "\n" + mod
    # print(mod)
modlistHTML = modlistHTML + "\n</ul>"

## SAVE FILES AND CREATE ZIP FILE
with tempfile.TemporaryDirectory() as temp_dir:

    # Save the modlist.html
    html_file_path = os.path.join(temp_dir, 'modlist.html')
    with open(html_file_path, 'w', encoding='utf-8') as htmlFile:
        htmlFile.write(modlistHTML)

    # Save the manifest.json
    manifest_file_path = os.path.join(temp_dir, 'manifest.json')
    with open(manifest_file_path, 'w', encoding='utf-8') as manifestFile:
        json.dump(manifest, manifestFile)

    # Parse overrides
    base_dir = os.path.abspath(os.path.join(path, '..'))
    override_dir = os.path.join(temp_dir, 'overrides')
    os.makedirs(override_dir, exist_ok=True)
    copy_overrides('overrides.txt', override_dir, base_dir)

    # Copy remaining mods into overrides
    copy_remaining_mods(modFiles, override_dir, base_dir)

    # Create zip file    
    print("Writing Zip File")
    output_zip_path = f"{manifest["name"]}-{manifest["version"]}.zip"
    zip_dir = os.path.join(path, output_zip_path)
    create_zip_from_directory(temp_dir, zip_dir)
print("Export Complete!")