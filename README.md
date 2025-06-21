## Make System Understand WezTerm

```bash
curl -o wezterm.terminfo https://raw.githubusercontent.com/wezterm/wezterm/main/termwiz/data/wezterm.terminfo
tic -x wezterm.terminfo
rm wezterm.terminfo
```

### References

- https://github.com/wezterm/wezterm/blob/main/docs/config/lua/config/term.md
- https://github.com/wezterm/wezterm/blob/main/termwiz/data/wezterm.terminfo
