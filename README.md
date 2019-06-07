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
--name coder-newproject \
--hostname newproject \
-p 44000:8443 \
-p 44080:80 \
-p 44036:3306 \
-e BOB=→ -e BOB_COLOR=93 \
-e GIT_USER_EMAIL="$(git config user.email)" \
-e GIT_USER_NAME="$(git config user.name)" \
-e PASSWORD="chimichanga" \
-v /projects/newproject:/workspace \
choephix2/coder:latest
```

## BOB Suggestions :)
### `→ ● ► ♦ ♥ ♣ ♠ ○ ◊ ♪ ♫ ♯`
### `˃ › » ◦ · • √ ≈ ≡ ∞ ☻ ☺`
### `■ ▪ □ ▫ ▬ ▬ ─ ꞊ └ © ® °`
### `‼ µ ¶ § ∑ ∫ ∂ ⌂ ∆ † ‽ ¢`
### `✶ ♀ ♂ ⸗ ⱻ ⱺ ﬁ ﬂ ﬀ ﬕ ﬗ ﬔ`
### `Ɱ Ɐ ≠ ℗ ₿ ₡ ₤ ₲ ₰ ₷ ₳ ⱷ`
## BOB_COLOR: 
### 91 (red)
### 92 (green)
### 93 (yellow)
### 94 (blue)
### 95 (magenta)
### 96 (cyan)
### 97 (white)
