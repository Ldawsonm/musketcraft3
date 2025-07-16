import os

def remove_clientside_mods(mods_directory, clientside_mods_file):
    # Read the client-side mods from the specified file
    with open(clientside_mods_file, 'r') as file:
        clientside_mods = {line.strip() for line in file if line.strip()}

    # Iterate over files in the mods directory
    for mod_file in os.listdir(mods_directory):
        if mod_file in clientside_mods:
            mod_path = os.path.join(mods_directory, mod_file)
            try:
                os.remove(mod_path)
                print(f"Removed client-side mod: {mod_file}")
            except Exception as e:
                print(f"Failed to remove {mod_file}: {e}")

if __name__ == "__main__":
    mods_directory = 'mods'  # Adjust this path to your mods directory
    clientside_mods_file = 'clientside_mods.txt'  # Path to the client-side mods file
    remove_clientside_mods(mods_directory, clientside_mods_file)