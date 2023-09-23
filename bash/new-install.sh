#!/usr/bin/bash
#
# This script is only intended to be executed 1 time after repo is cloned.
# This will write over any existing / changed code in $publish_root/$project_name (if pre-existing)
#
cp crmbl-utils/bash/compile-site.sh ./
bash ./compile-site.sh

#Move install script to /crmbl-utils and copy compile-site to project root for
#re-deployment
mv new-install.sh crmbl-utils/bash/

rm -rf .git

cd crmbl-utils/bash/
bash ./publish-site.sh

cd ../../

echo "Done."
echo "The default site is set to point to http://127.0.0.1/"