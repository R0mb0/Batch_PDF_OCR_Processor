# Batch PDF OCR Processor for Windows

**Batch process all PDF files in a folder to make them searchable with OCR using [ocrmypdf](https://ocrmypdf.readthedocs.io/en/latest/) and a simple PowerShell script. Output files are saved in an `output` subfolder. Perfect for Windows users needing fast PDF text recovery.**

---

## Features

- Processes all PDF files in the current folder
- Runs OCR to make PDFs searchable (text layer added)
- Outputs processed PDFs to an `output` subfolder
- Simple, no-setup PowerShell script
- Stupid-proof instructions for Windows users

---

## Prerequisites

- Windows 10/11
- PowerShell (already included in Windows)
- [Chocolatey](https://chocolatey.org/) package manager (for easy installation)
- [Python 3](https://www.python.org/) (with pip)
- [Tesseract-OCR](https://github.com/tesseract-ocr/tesseract)
- [Ghostscript](https://www.ghostscript.com/)
- [ocrmypdf](https://pypi.org/project/ocrmypdf/)

### Optional but Recommended

- **pngquant** (for better image compression)
- **jbig2** (for advanced PDF compression, but see important Windows note below)

---

## Step-by-Step Installation (Stupid-Proof)

### 1. Install Chocolatey

**Chocolatey** lets you install Windows programs from the command line.

1. Open **PowerShell as Administrator** (Right click PowerShell > "Run as Administrator").
2. Paste this command and press Enter:

    ```powershell
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
      [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
      iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    ```

3. Close and reopen PowerShell **(as normal user is fine for next steps)**.

---

### 2. Install Python and Pip

Using Chocolatey (in PowerShell):

```powershell
choco install python -y
```

- This will install Python **and** pip.
- Close and reopen PowerShell after installation.
- Test with:
    ```powershell
    python --version
    pip --version
    ```

---

### 3. Install Required Packages (ocrmypdf, tesseract, ghostscript)

**Install Tesseract and Ghostscript** using Chocolatey:

```powershell
choco install tesseract -y
choco install ghostscript -y
```

**Install ocrmypdf** (using pip):

```powershell
pip install ocrmypdf
```

---

### 4. (Optional) Install Additional Recommended Packages

#### pngquant

**For better image compression, install:**

```powershell
choco install pngquant -y
```

#### jbig2 (Advanced, Optional, Not Directly Supported on Windows)

**jbig2** is an optional dependency that can improve PDF compression.
- **Important:** There is **no official Windows binary** and it is **not available via Chocolatey**.
- If you require jbig2, you will need to manually compile it from source or find a trusted third-party binary for Windows. For most users, this step can be skipped.

---

### 5. Enable PowerShell Script Execution

> **IMPORTANT:**  
> By default, Windows may prevent running scripts.  
> Before running the script, in PowerShell, execute:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

This change is **temporary** and only for the current PowerShell window.

---

## Usage

1. **Place `ocr_batch.ps1` in the same folder as your PDFs.**
2. **Open PowerShell in that folder** (Shift + Right Click in the folder > "Open PowerShell window here").
3. **Run the script:**

    ```powershell
    .\ocr_batch.ps1
    ```

4. **Processed PDFs will appear in the `output` subfolder.**

---

**Happy OCR-ing!**
