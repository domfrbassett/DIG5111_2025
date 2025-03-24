Audio Processing Project
------------------------

This work is submitted in partial fulfilment of the Digital Signal Processing module.
The project is divided into two main tasks:
 
1. Frequency Comparison of Audio Files
2. Audio Filtering with Various Options

----------------------------------------------------------------------
Folder Structure
----------------------------------------------------------------------

AudioProcessingProject/
├── audio/                   # Folder to store input and output audio files
├── task1_frequency_analysis/ # Folder for Task 1 (Frequency Comparison)
│   ├── functions/            # Functions related to Task 1
│   ├── gui/                  # GUI for Task 1
│   └── scripts/              # Main scripts for Task 1
├── task2_audio_filtering/    # Folder for Task 2 (Audio Filtering)
│   ├── functions/            # Functions related to Task 2
│   ├── gui/                  # GUI for Task 2
│   └── scripts/              # Main scripts for Task 2
├── results/                 # Folder for storing output files and visualisations
└── README.txt               # Project documentation and instructions
 
----------------------------------------------------------------------
Task 1: Frequency Comparison of Audio Files
----------------------------------------------------------------------

This task allows the user to compare the frequency content of two audio files by displaying the magnitude spectrum of each signal. Advanced features include:
 
- Selecting the frequency range to display.
- Analysing left and right channels of stereo audio files separately.
- Displaying the phase spectrum of the signals.
- Performing time-frequency analysis.
- Providing a GUI for easier interaction.
 
To Run Task 1:
1. Run the `main_task1.m` script located in the `scripts/` folder.
2. Follow the prompts to select the two audio files for comparison.
3. The program will display magnitude and phase spectra of both signals.
4. Analysis results will be saved as images in the `results/` folder.
 
Functions Used in Task 1:
- `compare_frequency.m`: Compares the magnitude spectra of two audio files.
- `plot_spectrum.m`: Plots the magnitude and phase spectra.
- `stft_analysis.m`: Performs short-time Fourier transform (STFT) for time-frequency analysis.
- `plot_stft.m`: Plots the spectrogram from STFT results.
 
Example Usage:
compare_frequency('audio/audio1.wav', 'audio/audio2.wav');
 
----------------------------------------------------------------------
Task 2: Audio Filtering with Various Options
----------------------------------------------------------------------

This task allows the user to apply different types of filters to audio files. Advanced features include:
 
- Selecting the type of filter (low-pass, high-pass, band-pass, band-stop).
- Specifying the cut off frequency and filter order.
- Displaying the magnitude and phase response of the applied filter.
- Choosing the filter topology (FIR or IIR) and filter type (Butterworth, Chebyshev).
- Handling stereo audio files correctly.
- Implementing a GUI for filtering operations.
 
To Run Task 2:
1. Run the `main_task2.m` script located in the `scripts/` folder.
2. Select the audio file to filter and specify the filter parameters.
3. The filtered audio will be saved to the `audio/` folder.
4. Magnitude and phase responses of the filter will be plotted and saved to the 'results/' folder.
 
Functions Used in Task 2:
- `filter_audio.m`: Applies the specified filter to an audio file.
- `filter_design.m`: Designs the filter based on the user-specified parameters.
- `plot_filter_response.m`: Plots the magnitude and phase response of the filter.
 
Example Usage:
filter_audio('audio/audio1.wav', 'results/filtered_audio.wav', 'low-pass', 1000, 4);
 
----------------------------------------------------------------------
Graphical User Interface (GUI)
----------------------------------------------------------------------
To simplify usage, a GUI is available that integrates both tasks. To launch the GUI:
1. Run the GUI script from the `gui/` folder:
   >> audio_gui
2. Follow the instructions to compare audio files or apply filtering.
 
----------------------------------------------------------------------
Dependencies
----------------------------------------------------------------------
- MATLAB R2020a or later
- Signal Processing Toolbox
- Audio Toolbox
 
----------------------------------------------------------------------
Author: Dominic Bassett
Student ID: 22124830
Date: 13/05/25
----------------------------------------------------------------------