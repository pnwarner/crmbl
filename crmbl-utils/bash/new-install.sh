#!/usr/bin/bash
#
# This script is only intended to be executed 1 time after repo is cloned.
# This will write over any existing / changed code in $publish_root/$project_name (if pre-existing)
#
bash ./deploy-project.sh


bash ./publish-project.sh
cd ../../
rm -rf .git
cd crmbl-utils/bash/

echo "Done."
echo "The default site is set to point to http://127.0.0.1/"