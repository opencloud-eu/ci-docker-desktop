import os
if os.name == 'nt':
    # rename file on windows to make sure it runs as python script
    os.rename('/Python/Scripts/s3cmd', '/Python/Scripts/s3cmd.py')
exit(0)
