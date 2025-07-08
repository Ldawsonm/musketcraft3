import os
import fnmatch
import shutil
import zipfile

def create_zip_from_directory(directory, zip_file_path):
    with zipfile.ZipFile(zip_file_path, 'w') as zip_file:
        for root, _, files in os.walk(directory):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, directory)
                zip_file.write(file_path, arcname)

def copy_remaining_mods(mod_files, destination_dir, base_dir):
    mods_dir = os.path.join(base_dir, 'mods')  # Path to the mods directory
    remaining_mods_dir = os.path.join(destination_dir, 'mods')  # Path to the destination directory for remaining mods
    os.makedirs(remaining_mods_dir, exist_ok=True)  # Create the destination directory if it doesn't exist

    # List all files in the mods directory
    for mod_file in os.listdir(mods_dir):
        if mod_file not in mod_files:  # Check if the mod file is not in the list of modFiles
            src_path = os.path.join(mods_dir, mod_file)
            dest_path = os.path.join(remaining_mods_dir, mod_file)

            # Copy the file to the remaining mods directory
            if os.path.isfile(src_path):  # Ensure it's a file before copying
                shutil.copy2(src_path, dest_path)
                print(f"Copied remaining mod: {mod_file} to {remaining_mods_dir}")

# def copy_overrides(overrides_file, destination_dir, base_dir):
#     with open(overrides_file, 'r') as file:
#         patterns = [line.strip() for line in file if line.strip() and not line.startswith('#')]

#     for pattern in patterns:
#         print(f"parsing override {pattern}")
#         # Normalize the pattern for matching
#         if pattern.endswith('/'):
#             pattern += '*'

#         # Split the pattern into components for directory matching
#         pattern_parts = pattern.split(os.sep)

#         # Walk through the base directory (instance directory)
#         for root, dirs, files in os.walk(base_dir):
#             for name in dirs + files:
#                 src_path = os.path.join(root, name)  # Define src_path here

#                 # Check if the current name matches the pattern
#                 if fnmatch.fnmatch(name, pattern_parts[-1]):
#                     rel_path = os.path.relpath(src_path, base_dir)  # Relative to the instance directory
#                     dest_path = os.path.join(destination_dir, rel_path)

#                     # Create destination directory if it doesn't exist
#                     os.makedirs(os.path.dirname(dest_path), exist_ok=True)

#                     # Copy the file or directory, including all subdirectories
#                     if os.path.isdir(src_path):
#                         shutil.copytree(src_path, dest_path, dirs_exist_ok=True)
#                     else:
#                         shutil.copy2(src_path, dest_path)

#                 # If the current item is a directory, copy all its contents if it matches the pattern
#                 if os.path.isdir(src_path) and fnmatch.fnmatch(name, pattern_parts[-1]):
#                     for dirpath, dirnames, filenames in os.walk(src_path):
#                         for filename in filenames:
#                             file_src_path = os.path.join(dirpath, filename)
#                             file_rel_path = os.path.relpath(file_src_path, base_dir)
#                             file_dest_path = os.path.join(destination_dir, file_rel_path)
#                             os.makedirs(os.path.dirname(file_dest_path), exist_ok=True)
#                             shutil.copy2(file_src_path, file_dest_path)

def read_patterns(overrides_file):
    with open(overrides_file, 'r') as file:
        return [line.strip() for line in file if line.strip() and not line.startswith('#')]

def extract_directories(patterns):
    directories = set()
    for pattern in patterns:
        if pattern.endswith('/'):
            directories.add(pattern[:-1])  # Remove the trailing slash for directory matching
        else:
            # Include the directory part of the pattern
            dir_part = os.path.dirname(pattern)
            if dir_part:
                directories.add(dir_part)
    return directories

# def copy_overrides(overrides_file, destination_dir, base_dir):
#     patterns = read_patterns(overrides_file)
#     relevant_dirs = extract_directories(patterns)

#     # Create a set to store matched paths
#     matched_paths = set()

#     # Walk through only the relevant directories
#     for relevant_dir in relevant_dirs:
#         full_relevant_dir = os.path.join(base_dir, relevant_dir)

#         if os.path.exists(full_relevant_dir):  # Check if the directory exists
#             for root, dirs, files in os.walk(full_relevant_dir):
#                 for name in dirs + files:
#                     src_path = os.path.join(root, name)
#                     # print(f"parsing {src_path}")

#                     # Check if the current name matches any of the patterns
#                     for pattern in patterns:
#                         # Normalize the pattern for matching
#                         if pattern.endswith('/'):
#                             pattern += '*'

#                         # Use the relative path for matching
#                         relative_path = os.path.relpath(src_path, base_dir)
#                         if fnmatch.fnmatch(relative_path, pattern):
#                             rel_path = os.path.relpath(src_path, base_dir)  # Relative to the instance directory
#                             dest_path = os.path.join(destination_dir, rel_path)

#                             # Create destination directory if it doesn't exist
#                             os.makedirs(os.path.dirname(dest_path), exist_ok=True)

#                             # Copy the file or directory
#                             if os.path.isdir(src_path):
#                                 shutil.copytree(src_path, dest_path, dirs_exist_ok=True)
#                             else:
#                                 shutil.copy2(src_path, dest_path)
#                                 print(f"{dest_path}")
#                             matched_paths.add(src_path)
#                             break  # Break once a match is found to avoid redundant checks

#     return matched_paths
def copy_overrides(overrides_file, destination_dir, base_dir):
    patterns = read_patterns(overrides_file)
    relevant_dirs = extract_directories(patterns)

    matched_paths = set()

    for relevant_dir in relevant_dirs:
        full_relevant_dir = os.path.join(base_dir, relevant_dir)

        if os.path.exists(full_relevant_dir):
            for root, dirs, files in os.walk(full_relevant_dir):
                for name in dirs + files:
                    src_path = os.path.join(root, name)

                    # Normalize the relative path
                    relative_path = os.path.relpath(src_path, base_dir).replace('\\', '/')

                    # print(f"Checking {relative_path}")  # Debugging output

                    # Check against normalized patterns
                    for pattern in patterns:
                        # Normalize the pattern
                        normalized_pattern = pattern.lstrip('./')  # Remove leading './'

                        if pattern.endswith('/'):
                            normalized_pattern += '*'

                        if fnmatch.fnmatch(relative_path, normalized_pattern):
                            dest_path = os.path.join(destination_dir, relative_path)

                            os.makedirs(os.path.dirname(dest_path), exist_ok=True)

                            if os.path.isdir(src_path):
                                shutil.copytree(src_path, dest_path, dirs_exist_ok=True)
                            else:
                                shutil.copy2(src_path, dest_path)
                                print(f"{dest_path}")

                            matched_paths.add(src_path)
                            break  # Break once a match is found

    return matched_paths
