# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#     a88888b.              dP         888888ba                           dP
#    d8'   `88              88         88    `8b                          88
#    88       .d8888b..d888b88.d8888b.a88aaaa8P'.d8888b..d8888b..d8888b.d8888P
#    88       88'  `8888'  `8888ooood8 88   `8b.88'  `8888'  `88Y8ooooo.  88
#    Y8.   .8888.  .8888.  .8888.  ... 88    .8888.  .8888.  .88      88  88
#     Y88888P'`88888P'`88888P8`88888P' 88888888P`88888P'`88888P'`88888P'  dP
#                               Copyright (c) 2025 zx0r. All rights reserved.

#     Author:        zx0r
#     License:       MIT License
#     Contact Info:  https:#github.com/zx0r
#     Version: 1.0
#     Date: 2025-01-20
#     Description: GitHub Repository Management Functions for Fish Shell

#                                               “Stay Hungry, Stay Foolish.”
#                                                      - Steve Jobs  Apple

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# ----------------------------------------
# 1. Install GitHub CLI (if not installed)
# ----------------------------------------
function install_gh
    if ! command -v gh >/dev/null
        echo "GitHub CLI (gh) is not installed. Installing..."
        switch (uname)
            case Linux
                sudo apt-get update && sudo apt-get install -y gh
            case Darwin
                brew install gh
            case '*'
                echo "Unsupported OS. Please install GitHub CLI manually."
                return 1
        end
    else
        echo "GitHub CLI is already installed."
    end
end

# ----------------------------------------
# 2. Authenticate with GitHub
# ----------------------------------------
function gh_auth
    gh auth login --hostname github.com --git-protocol ssh --web
    if test $status -eq 0
        echo "✓ Authentication complete."
    else
        echo "! Authentication failed. Please try again."
    end
end

# ----------------------------------------
# 3. Create a New Repository
# ----------------------------------------

function gh_create_repo
    # Prompt for repository name
    set -l repo_name (read -P "Enter the name of the new repository: ")
    # Prompt for repository description
    set -l repo_description (read -P "Enter a description for the repository: ")
    # Prompt for repository visibility
    set -l is_public (read -P "Should the repository be public? (y/n): ")

    # Set visibility flag based on user input
    if test "$is_public" = y
        set visibility --public
    else
        set visibility --private
    end

    # Prompt for README.md
    # set -l include_readme (read -P "Include a README.md file? (y/n): ")
    # if test "$include_readme" = y
    #     set add_readme --add-readme
    # else
    #     set add_readme ""
    # end

    # # Prompt for License
    # set -l license (read -P "Enter the license type (e.g., MIT, Apache-2.0, GPL-3.0, none): ")
    # if test "$license" = none
    #     set license ""
    # else
    #     set license "--license=$license"
    # end

    # # Prompt for .gitignore
    # set -l gitignore (read -P "Enter the .gitignore template (e.g., Node, Python, none): ")
    # if test "$gitignore" = none
    #     set gitignore ""
    # else
    #     set gitignore "--gitignore=$gitignore"
    # end

    # Prompt for cloning the repository
    set -l clone_repo (read -P "Clone the repository locally? (y/n): ")
    if test "$clone_repo" = y
        set clone_flag --clone
    else
        set clone_flag ""
    end

    # Display confirmation prompt
    echo "You are about to create a repository with the following details:"
    echo "Name: $repo_name"
    echo "Description: $repo_description"
    echo "Visibility: $visibility"
    # echo "README.md: $include_readme"
    # echo "License: $license"
    # echo ".gitignore: $gitignore"
    echo "Clone locally: $clone_repo"
    set -l confirm (read -P "Are you sure you want to proceed? (y/n): ")

    # Check confirmation
    if test "$confirm" = y
        # Create the repository
        gh repo create "$repo_name" --description "$repo_description" $visibility $clone_flag

        if test $status -eq 0
            echo "✓ Repository '$repo_name' created successfully!"

            # Add README.md content if provided and not using --add-readme
            # if test "$include_readme" = y -a -z "$add_readme"
            #     echo "Enter the content for README.md (Ctrl+D to finish):"
            #     set -l readme_content (cat)
            #     echo "$readme_content" >README.md
            #     git add README.md
            #     git commit -m "Add README.md"
            #     git push origin main
            #     echo "✓ README.md added and pushed to the repository."
            # end
        else
            echo "! Failed to create repository."
        end
    else
        echo "✗ Repository creation canceled."
    end
end

# ----------------------------------------
# 4. Clone a Repository
# ----------------------------------------
function gh_clone_repo
    set -l repo_name (read -P "Enter the name of the repository to clone: ")
    gh repo clone "$repo_name"
    if test $status -eq 0
        echo "✓ Repository '$repo_name' cloned successfully!"
    else
        echo "! Failed to clone repository."
    end
end

# ----------------------------------------
# 5. List Your Repositories
# ----------------------------------------
function gh_list_repos
    gh repo list --limit 100
end

# ----------------------------------------
# 6. Delete a Repository
# ----------------------------------------

function gh_delete_repo
    # Prompt for the repository name
    set -l repo_name (read -P "Enter the name of the repository to delete: ")

    # Confirm deletion
    set -l confirm (read -P "Are you sure you want to delete the repository '$repo_name'? (y/n): ")

    if test "$confirm" = y -o "$confirm" = Y
        # Delete the repository using the GitHub CLI
        gh repo delete "$repo_name" --confirm

        # Check if the deletion was successful
        if test $status -eq 0
            echo "✓ Repository '$repo_name' deleted successfully!"
        else
            echo "! Failed to delete repository '$repo_name'."
        end
    else
        echo "Deletion canceled..."
    end
end

# ----------------------------------------
# 7. Check SSH Connection to GitHub
# ----------------------------------------
function gh_check_ssh
    ssh -T git@github.com
end

# ----------------------------------------
# 8. Help Menu
# ----------------------------------------
function gh_help
    echo "GitHub Repository Management Functions:"
    echo "  install_gh       - Install GitHub CLI (if not installed)."
    echo "  gh_auth          - Authenticate with GitHub."
    echo "  gh_create_repo   - Create a new GitHub repository."
    echo "  gh_clone_repo    - Clone a GitHub repository."
    echo "  gh_list_repos    - List your GitHub repositories."
    echo "  gh_delete_repo   - Delete a GitHub repository."
    echo "  gh_check_ssh     - Check SSH connection to GitHub."
end
