import os
import sys

def rebrand(new_name):
    old_name = "PixelForge"
    old_name_lower = "pixelforge"
    old_name_upper = "PIXELFORGE"
    
    new_name_lower = new_name.lower()
    new_name_upper = new_name.upper()
    
    # Files to skip
    skip_dirs = {'.git', '.vs', 'out', 'build', 'node_modules', '.github', 'laf', 'skia'}
    # We skip laf and skia as they are submodules/third_party and might have their own naming conventions, 
    # though PixelForge uses them. Rebranding them might break things.
    
    skip_exts = {'.exe', '.dll', '.so', '.dylib', '.png', '.jpg', '.jpeg', '.gif', '.ico', '.zip', '.gz', '.tar', '.ase', '.pixelforge', '.obj', '.lib', '.pdb'}

    # Root directory
    root_dir = os.path.dirname(os.path.abspath(__file__))

    print(f"Rebranding '{old_name}' to '{new_name}'...")

    # 1. Text replacement and Rename files
    # We use topdown=False to rename files before parents directories
    for root, dirs, files in os.walk(root_dir, topdown=False):
        # Filter directories to skip
        dirs[:] = [d for d in dirs if d not in skip_dirs and not d.startswith('.')]
        
        for file in files:
            file_path = os.path.join(root, file)
            
            # Skip binary files by extension
            if any(file.lower().endswith(ext) for ext in skip_exts):
                continue
            
            # Text replacement
            try:
                # Read with ignore for non-utf8
                with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                
                new_content = content.replace(old_name, new_name)
                new_content = new_content.replace(old_name_lower, new_name_lower)
                new_content = new_content.replace(old_name_upper, new_name_upper)
                
                if new_content != content:
                    with open(file_path, 'w', encoding='utf-8') as f:
                        f.write(new_content)
                    print(f"Updated content: {file_path}")
            except Exception as e:
                print(f"Could not update {file_path}: {e}")

            # Rename file if it contains the name
            if old_name_lower in file.lower():
                new_file_name = file.replace(old_name, new_name)
                new_file_name = new_file_name.replace(old_name_lower, new_name_lower)
                new_file_name = new_file_name.replace(old_name_upper, new_name_upper)
                
                new_file_path = os.path.join(root, new_file_name)
                if file_path != new_file_path:
                    try:
                        os.rename(file_path, new_file_path)
                        print(f"Renamed file: {file} -> {new_file_name}")
                    except Exception as e:
                        print(f"Could not rename file {file}: {e}")

        # Rename directories
        for d in dirs:
            if old_name_lower in d.lower():
                old_dir_path = os.path.join(root, d)
                new_dir_name = d.replace(old_name, new_name)
                new_dir_name = new_dir_name.replace(old_name_lower, new_name_lower)
                new_dir_name = new_dir_name.replace(old_name_upper, new_name_upper)
                
                new_dir_path = os.path.join(root, new_dir_name)
                if old_dir_path != new_dir_path:
                    try:
                        os.rename(old_dir_path, new_dir_path)
                        print(f"Renamed directory: {d} -> {new_dir_name}")
                    except Exception as e:
                        print(f"Could not rename directory {d}: {e}")

    print("Rebranding complete!")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python rebrand.py NewAppName")
        print("Example: python rebrand.py PixelCraft")
    else:
        rebrand(sys.argv[1])
