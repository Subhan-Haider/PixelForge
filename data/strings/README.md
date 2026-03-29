# 🌐 PixelForge Translations

PixelForge's global reach is powered by the community. We use **Weblate** for simplified, collaborative translation management.

## 🚀 Official Translation Platform

The easiest way to contribute is through our official Weblate project:
👉 [**Translate PixelForge on Weblate**](https://hosted.weblate.org/projects/pixelforge/pixelforge/)

---

## 🔧 Manual Contributions & Local Testing

If you prefer to work locally or want to test your translations before submitting, follow these steps:

### 1. Locate the Base Strings
The master English strings are maintained in [`en.ini`](https://github.com/Subhan-Haider/PixelForge/blob/main/data/strings/en.ini). Use this file as your reference.

### 2. Creating a New Language
1.  Copy `en.ini` and rename it to your target language code (e.g., `fr.ini` for French, `ja.ini` for Japanese).
2.  Translate the values after the `=` sign. **Do not change the keys on the left.**
3.  Ensure the file is saved with **UTF-8 encoding**.

### 3. Testing Your Changes Locally
To see your translation inside PixelForge:
1.  Place your `.ini` file inside the `data/strings/` directory of your PixelForge installation.
2.  Restart PixelForge.
3.  Go to **Edit > Preferences > General**.
4.  Select your new language from the **Language** dropdown menu.

### 4. Submitting Your Work
Once you are satisfied with the translation, you can:
*   Push your changes directly to the [**strings repository**](https://github.com/pixelforge/strings).
*   Open a Pull Request with your new `.ini` file.

---

## 📦 Synchronization
The `en.ini` file in this repository is the "Source of Truth." It is automatically synced to the [strings repository](https://github.com/pixelforge/strings/blob/main/en.ini) and Weblate every 24 hours.

*Thank you for helping us make PixelForge accessible to everyone!*
