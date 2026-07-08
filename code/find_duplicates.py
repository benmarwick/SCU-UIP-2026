# terminal command to find screenshots that posted to WeChat that are on my computer:
#
# find ~/Library/Containers/com.tencent.xinWeChat ~/Library/Application\ Support/com.tencent.xinWeChat ~/Library/Group\ Containers/2N3A5ZX7T0.com.tencent.xinWeChat \  -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.heic' -o -iname '*.webp' \) 2>/dev/null
#
# move all images into a folder in /Users/bmarwick/Downloads/Archive then run this script with 
# python code/find_duplicates.py

#!/usr/bin/env python3

from PIL import Image
import imagehash
import os
from collections import defaultdict
from itertools import combinations

def find_near_duplicates(folder_path, threshold=10):
    """
    To find near-duplicates (e.g., slightly cropped, compressed, or resized versions)
    """
    hashes = {}
    
    for filename in os.listdir(folder_path):
        if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.webp', '.gif', '.bmp', '.tiff')):
            path = os.path.join(folder_path, filename)
            try:
                img = Image.open(path)
                hash_val = imagehash.phash(img)
                hashes[filename] = hash_val
            except Exception as e:
                print(f"Error with {filename}: {e}")
    
    # Find pairs with Hamming distance <= threshold
    duplicates = []
    for f1, f2 in combinations(hashes.keys(), 2):
        distance = hashes[f1] - hashes[f2]
        if distance <= threshold:
            duplicates.append((f1, f2, distance))
    
    return duplicates

# Run
near_dups = find_near_duplicates("/Users/bmarwick/Downloads/Archive", threshold=10)

if near_dups:
    print(f"Found {len(near_dups)} near-duplicate pairs:\n")
    for f1, f2, dist in sorted(near_dups, key=lambda x: x[2]):
        print(f"  Distance {dist}: {f1}  ~  {f2}")
else:
    print("No near-duplicates found.")
