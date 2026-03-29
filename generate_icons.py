import os
import sys
try:
    from PIL import Image
except ImportError:
    print("Error: Pillow library not found. Please run: pip install Pillow")
    sys.exit(1)

def generate_icons(input_path):
    if not os.path.exists(input_path):
        print(f"Error: {input_path} not found.")
        return

    # Create target directory
    output_dir = "data/icons"
    os.makedirs(output_dir, exist_ok=True)

    img = Image.open(input_path)
    
    # Standard sizes for software icons
    sizes = [16, 32, 48, 64, 128, 256]
    base_name = "pixelforge"
    
    print(f"Generating icons for {base_name}...")

    # Save individual PNGs
    for size in sizes:
        resized = img.resize((size, size), Image.Resampling.LANCZOS)
        output_file = os.path.join(output_dir, f"ase_{size}.png") # Keeping ase_ prefix for system compatibility
        resized.save(output_file)
        
        # Also save with the new name
        new_output_file = os.path.join(output_dir, f"{base_name}_{size}.png")
        resized.save(new_output_file)
        print(f"Generated: {size}x{size} icons")
    
    # Generate Windows .ico file
    ico_path = os.path.join(output_dir, f"{base_name}.ico")
    img.save(ico_path, format="ICO", sizes=[(s, s) for s in sizes])
    
    # Backup as ase.ico for build system
    ase_ico_path = os.path.join(output_dir, "ase.ico")
    img.save(ase_ico_path, format="ICO", sizes=[(s, s) for s in sizes])
    
    print(f"\nSuccess! Icons generated in {output_dir}")
    print(f"Main icon: {ico_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python generate_icons.py logo.png")
    else:
        generate_icons(sys.argv[1])
