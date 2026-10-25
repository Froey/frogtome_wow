#!/bin/bash

VERSION="v1.0.0"

# Define targets
TARGET_DIR="."

# Define exclusions
GIT_REPO_INFO=".git/*"
GIT_REPO_GITIGNORE=".gitignore"
VS_PROJECT_FILE="frogtome_wow.code-workspace"
VS_PROJECT_FILE_LINK="frogtome_wow.lnk"
JAVA_TOOLS_META="Dev/.metadata/*"
JAVA_TOOLS_GITIGNORE="Dev/.gitignore"
JAVA_TOOLS="Dev/Java/*"

BUILD_SCRIPT="build.sh"

# Delete any stale build
rm -rf "Build/"

# Copy all contents into a temporary directory
TEMP_DIR=$(mktemp -d)
mkdir "$TEMP_DIR/frogtome_wow"
cp -r . "$TEMP_DIR/frogtome_wow"

# Zip all relevant content (minus exclusions) from the temporary directory to the build folder
mkdir "Build/" && (cd "$TEMP_DIR" && zip -r "$OLDPWD/Build/frogtome_$VERSION.zip" . \
	-x "frogtome_wow/$GIT_REPO_INFO" \
	-x "frogtome_wow/$GIT_REPO_GITIGNORE" \
	-x "frogtome_wow/$VS_PROJECT_FILE" \
	-x "frogtome_wow/$VS_PROJECT_FILE_LINK" \
	-x "frogtome_wow/$JAVA_TOOLS_META" \
	-x "frogtome_wow/$JAVA_TOOLS_GITIGNORE" \
	-x "frogtome_wow/$JAVA_TOOLS" \
	-x "frogtome_wow/$BUILD_SCRIPT")

echo "Done."
