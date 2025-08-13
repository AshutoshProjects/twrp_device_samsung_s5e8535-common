#
# Copyright (C) 2025 AshutoshProjects
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
#

# Patch AVB digest in a boot/recovery image

import argparse
import os
import pathlib

# Parse input image path
parser = argparse.ArgumentParser()
parser.add_argument('--img', type=pathlib.Path, required=True, help="Path to the image file")
args = parser.parse_args()

# Open image and patch AVB digest
with open(args.img, 'r+b') as img_file:
    data = img_file.read()

    # Find AVB header and seek to digest offset
    avb_header = b'AVB0'
    header_offset = data.find(avb_header)
    img_file.seek(header_offset + 972)

    # Write new random 64-byte digest
    digest = os.urandom(64)
    img_file.write(digest)

# Print results
print("AVB HEADER OFFSET:", header_offset)
print("AVB Digest:", digest.hex())
print("----- AVB patched successfully -----")