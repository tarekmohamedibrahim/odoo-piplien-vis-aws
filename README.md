# odoo-piplien-vis-aws

This repo is an aws implementation of CI/CD

I created two branches
1. CodeCommit based Pipeline
Branch Name is: codecommit-based
In this branch when you do a push to github the whole branch is downloaded to the EC2 instance while applying the pipeline deployment.
This occures for every push.
For small customer production branches there is no problem. For huge branches, the whole branch is, unnecesarily,  re-downloaded on the EC2 instance, at this point I created the 2nd solution based on S3-Bucket 

I created this solution first time specifically for Odoo deployment, so I created a file that includes a list of modules to be upgraded so another script I placed at the instance that is called automatically and do the upgrade action.
This file is called "upgrade-modules" under the "scripts" directory, I fill it using the git hook "pre-commit"

For new modules, they must be installed manually, to not unintentionally install unneeded module by mistake

2. S3 Bucket based Pipeline
Branch Name is: s3-bucket-based
In this case, from the git hook "pre-push", I collect the files to be pushed to the repo, zip them, update a s3 bucket prepared for this purpose. This bucket is the source of the pipeline. When the bucket is updated the pipeline is triggered


The S3 idea, could be used for the deployment of any application that is comprised of several deployed files, so that one can send only the updated file, not the whole repo.

Notes:
    1. I assume that the target folder for the custom odoo modules is called /odoo/custom on the target EC2 instance
    2. fill the file "database-name" with the target database on which modules are needed to be upgraded
    3. You have to copy the files in the "git-hooks" folder to your local .git/hooks for this solution to work
