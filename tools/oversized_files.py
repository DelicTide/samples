import os
import shutil

def check_and_move_oversized_files(directory, max_size_mb=99):
    """
    Checks file sizes in the specified directory and moves files larger than the given size to a separate folder.

    Parameters:
    - directory: str, path to the directory to check
    - max_size_mb: int, maximum file size in megabytes (default is 99MB)
    """
    max_size_bytes = max_size_mb * 1024 * 1024
    oversized_folder = os.path.join(directory, 'oversized_files')
    oversized_files = []

    for root, _, files in os.walk(directory):
        for filename in files:
            file_path = os.path.join(root, filename)
            if os.path.isfile(file_path) and file_path.endswith('.wav'):
                file_size = os.path.getsize(file_path)
                if file_size > max_size_bytes:
                    oversized_files.append(file_path)

    if oversized_files:
        os.makedirs(oversized_folder, exist_ok=True)
        for file_path in oversized_files:
            shutil.move(file_path, os.path.join(oversized_folder, os.path.basename(file_path)))
            print(f"Moved {os.path.basename(file_path)} to oversized_files folder.")
    else:
        print("No oversized files found.")

def main():
    # Adjust path to point to your samples directory
    samples_directory = os.path.abspath('samples')
    check_and_move_oversized_files(samples_directory)

if __name__ == "__main__":
    main()
