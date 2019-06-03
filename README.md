# code-server
code-server instance w/ tmux and my settings 

ref: https://github.com/cdr/code-server

# Install via wizard

`curl -O https://raw.githubusercontent.com/choephix2/codercom/master/scripts/install.sh && bash install.sh`

# For your own vscode settings

Fork this repo, then use it as SETTINGS_REPO

You can go to folder `/ini` and push your changes inside the container, and push your changes.
This way you can reuse your own vscode user settings in other containers as well.

# Example

Before copying, change the password and the project path.

```
sudo docker run -it -d \
--restart unless-stopped \
--name coder-blankslate \
--hostname blankslate \
-p 44000:8443 \
-p 44080:80 -p 44036:3306 \
-e BOB=→ -e BOB_COLOR=94 \
-e GIT_USER_EMAIL="$(git config user.name)" \
-e GIT_USER_NAME="$(git config user.email)" \
-e PASSWORD="chimichanga" \
-v /projects/newproject:/workspace \
choephix2/coder:latest
```

## BOB Suggestions :)
### `→ ♦ ♥ ♣ ♠ ● ► ◊ ○ ♪ ♫ ♯`
### `■ ▪ □ ▫ ▬ ─ ☻ ☺ ⌂ ∆ † ‽`
### `∞ √ ≈ ≡ └ › • ‼ » © ® °`
### `◦ ꞊ ▬ › µ ¶ § ˃ · ∑ ∫ ∂`
### BOB_COLOR: *<span style="color:red">91</span> <span style="color:green">92</span> <span style="color:yellow">93</span> <span style="color:blue">94</span> <span style="color:magenta">95</span> <span style="color:cyan">96</span>*
