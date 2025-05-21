# libreoffice.yazi
Libreoffice for previewing document, spreedsheet and presentation

# Requirement

```bash
libreoffice
```

# Config

In `yazi.toml`

```toml
[plugin]
  pretend_previewers = [
    # Word
    { name = "*.doc{,x}", run = "libreoffice" },
    # Excel
    { name = "*.xls{,x}", run = "libreoffice" },
    # Powerpoint
    { name = "*.ppt{,x}", run = "libreoffice" },
    # Open Document Type
    { name = "*.odt", run = "libreoffice" },
    # Open Spreesheet Type
    { name = "*.ods", run = "libreoffice" },
    # Open Presentation Type
    { name = "*.odp", run = "libreoffice" },
  ]

  preloaders = [
    # Word
    { name = "*.doc{,x}", run = "libreoffice" },
    # Excel
    { name = "*.xls{,x}", run = "libreoffice" },
    # Powerpoint
    { name = "*.ppt{,x}", run = "libreoffice" },
    # Open Document Type
    { name = "*.odt", run = "libreoffice" },
    # Open Spreesheet Type
    { name = "*.ods", run = "libreoffice" },
    # Open Presentation Type
    { name = "*.odp", run = "libreoffice" },
  ]
```
