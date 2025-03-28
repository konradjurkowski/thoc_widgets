import os

def generate_export_file(lib_path='lib', export_file='lib/thoc_widgets.dart'):
    with open(export_file, 'w') as f:
        for root, dirs, files in os.walk(lib_path):
            for file in files:
                if file.endswith('.dart') and file != 'thoc_widgets.dart':
                    relative_path = os.path.relpath(os.path.join(root, file), lib_path)
                    export_path = relative_path.replace(os.sep, '/')
                    f.write(f'export \'{export_path}\';\n')

    print(f'File {export_file} has been generated.')

# Run script
generate_export_file()
