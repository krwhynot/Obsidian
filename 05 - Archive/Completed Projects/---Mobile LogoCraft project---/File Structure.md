
Project File Structure:
├── .pytest_cache/
│   ├── v/
│   │   ├── cache/
│   │   │   ├── lastfailed
│   │   │   ├── nodeids
│   │   │   ├── stepwise
│   ├── CACHEDIR.TAG
│   ├── README.md
├── assets/
│   ├── icons/
│   │   ├── HungerRush_Icon.ico
│   ├── images/
│   │   ├── gui.png
├── deployment/
│   ├── build.py
│   ├── LogoCraft.spec
│   ├── setup.py
├── logs/
├── src/
│   ├── core/
│   │   ├── ==config.py==
│   │   ├── ==error_handler.py==
│   │   ├── ==format.py==
│   │   ├── ==error_handler.py==
│   │   ├── __init__.py
│   ├── gui/
│   │   ├── ==main_window.py==
│   │   ├── ==widgets.py==
│   │   ├── __init__.py
│   ├── models/
│   │   ├── ==image_processor.py==
│   │   ├── __init__.py
│   ├── utils/
│   │   ├── ==file_utils.py==
│   │   ├── ==image_utils.py==
│   │   ├── ==logging.py==
│   │   ├── __init__.py
│   ├── ==main.py==
│   ├── __init__.py
├── tests/
│   ├── assets/
│   │   ├── output/
│   │   ├── test_images/
│   ├── conftest.py
│   ├── test_gui.py
│   ├── test_image_processor.py
│   ├── test_integration.py
│   ├── __init__.py
├── app.py
├── DEFAULT.PNG
├── requirements.txt