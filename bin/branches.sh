#!/bin/bash

# Get list of local branches
branches=$(git branch --sort=-committerdate | tr -d '*' | awk '{print $1}')

# Output branch list with numbers
echo "Local branches:"
select branch_name in $branches; do
    # If user selects a branch, switch to it
    if [[ -n $branch_name ]]; then
        git checkout $branch_name
        echo ""
        echo "You are now on branch $branch_name."
        break
    # If user doesn't select a branch, prompt them to try again
    else
        echo "Invalid selection. Please try again."
    fi
done

