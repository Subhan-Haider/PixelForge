import os
import shutil

def repopulate_assets():
    deleted_report = "deleted_images.md"
    master_logo = "logo.png"
    
    if not os.path.exists(deleted_report):
        print(f"Error: {deleted_report} not found.")
        return
    if not os.path.exists(master_logo):
        print(f"Error: {master_logo} not found.")
        return

    print("Repopulating assets with your new logo...")
    
    with open(deleted_report, 'r') as f:
        lines = f.readlines()
        
    count = 0
    for line in lines:
        line = line.strip()
        if line.startswith("- ") and line.lower().endswith(".png"):
            target_path = line[2:].strip()
            
            try:
                # Ensure directory exists
                os.makedirs(os.path.dirname(target_path), exist_ok=True)
                # Copy the logo to the target path
                shutil.copy(master_logo, target_path)
                count += 1
            except Exception as e:
                print(f"Could not copy to {target_path}: {e}")
                
    print(f"Success! {count} assets have been updated with your mascot logo.")

if __name__ == "__main__":
    repopulate_assets()
