# code-server
code-server instance w/ tmux and my settings 

ref: https://github.com/cdr/code-server

# Install via wizard

`curl -O- https://raw.githubusercontent.com/choephix2/codercom/master/scripts/wizard.sh | bash`

# Example

```
sudo docker run -it -d --restart unless-stopped \
--name coder-blankslate \
--hostname blankslate \
-p 44000:8443 \ # coder web interface
-p 44080:80 -p 44036:3306 \ # some ports for your project
-e BOB=→ -e BOB_COLOR=94 \
-e GIT_USER_EMAIL=choephix2@gmail.com \
-e GIT_USER_NAME=choephix2 \
-v /projects/newproject:/workspace
choephix2/coder:latest
```

## BOB Suggestions :)
### `→ ♦ ♥ ♣ ♠ ● ► ◊ ○ ♪ ♫ ♯`
### `■ ▪ □ ▫ ▬ ─ ☻ ☺ ⌂ ∆ † ‽`
### `∞ √ ≈ ≡ └ › • ‼ » © ® °`
### `◦ ꞊ ▬ › µ ¶ § ˃ · ∑ ∫ ∂`
### BOB_COLOR: *<span style="color:red">91</span> <span style="color:green">92</span> <span style="color:yellow">93</span> <span style="color:blue">94</span> <span style="color:magenta">95</span> <span style="color:cyan">96</span>*