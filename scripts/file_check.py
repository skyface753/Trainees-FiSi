import os


            
            
class FileChecker:
    def __init__(self, root_dir, verbose=False, excludes=[]):
        self.root_dir = root_dir
        self.excludes = excludes
        self.verbose = verbose
        self.missing_files = []
        self.empty_files = []
        
    def check_missing_indexes(self):
        for root, dirs, files in os.walk(self.root_dir):
            if "index.md" not in files:
                if not any([exclude in root for exclude in self.excludes]):
                    self.missing_files.append(root)
                    if self.verbose:
                        print("No index.md file found in " + root)
        print("Found " + str(len(self.missing_files)) + " missing files")
        print("-" * 20)
        return self.missing_files
    
    def check_for_empty_files(self):
        for root, dirs, files in os.walk(self.root_dir):
            for file in files:
                if file.endswith(".md"):
                    if os.stat(os.path.join(root, file)).st_size == 0:
                        print("Empty file found: " + os.path.join(root, file))
                        self.empty_files.append(os.path.join(root, file))
        print("Found " + str(len(self.empty_files)) + " empty files")
        print("-" * 20)
        return self.empty_files
    
    
    def fix(self):
        for missing_file in self.missing_files:
            with open(os.path.join(missing_file, "index.md"), "w") as f:
                # Create an empty index.md file
                f.write("")
                

            
if __name__ == "__main__":
    # Get arguments
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--auto-fix", action="store_true")
    parser.add_argument("--root-dir", default="./docs")
    parser.add_argument("--verbose", action="store_true")
    parser.add_argument("--excludes", nargs="*", default=["assets"])
    parser.add_argument("--strict", action="store_true") # For the CI pipeline -> returns false if no errors found
    args = parser.parse_args()
    file_checker = FileChecker(args.root_dir, excludes=args.excludes, verbose=args.verbose)
    missing_files = file_checker.check_missing_indexes()
    empty_files = file_checker.check_for_empty_files()
    if args.auto_fix:
        file_checker.fix()
        print("Missing files fixed")
        print("-" * 20)
    if args.strict:
        if(len(missing_files) > 0) or (len(empty_files) > 0):
            print("Errors found => exiting with code 1")
            exit(1)
        else:
            exit(0)

    