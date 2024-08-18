### For main project only ###

# flutter test --coverage
# lcov --remove coverage/lcov.info '*/widgets/*' '*/view/*' '*/common/*' -o coverage/lcov.g.info
# genhtml coverage/lcov.g.info -o coverage/html
# open coverage/html/index.html

### For main project and sub-packages ###

# Root directory of the packages
root="packages"

# List of packages to include i.e. ("package1" "package2" "package3")
packages=()

# Coverage file path and name
coverage_file="coverage/lcov.raw.info"

# Run tests with coverage for main project
flutter test --coverage --coverage-path="$coverage_file"

# Array to store coverage files for merging
coverage_files=()

# Merge coverage information for included packages
for package in "${packages[@]}"; do
  package_dir="$root/$package"
  if [ -d "$package_dir" ]; then
    # Change working directory to the project directory
    if cd "$package_dir"; then
      # Run tests with coverage
      flutter test --coverage --coverage-path="$coverage_file"
      # Check if coverage file exists and add to coverage_files array
      if [ -f "$coverage_file" ]; then
        # Modify SF: entries in lcov.info to prepend 'packages/project'
        sed -i "" "s|^SF:|SF:$package_dir/|g" "$coverage_file"
        # Add coverage file to coverage_files array
        coverage_files+=(-a)
        coverage_files+=("$package_dir/$coverage_file")
      fi
      # Change back to the original directory
      cd - > /dev/null
    else
      echo "Failed to change directory to $package_dir. Skipping."
    fi
  fi
done

# Merge lcov.info files into a single file
lcov -a $coverage_file "${coverage_files[@]}" -o coverage/lcov.merged.info

# Remove unwanted files/directories from the merged coverage file
lcov --remove coverage/lcov.merged.info '*/widgets/*' '*/view/*' '*/common/*' -o coverage/lcov.info

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open HTML report
open coverage/html/index.html