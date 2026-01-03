# Biomedical Signal Processing & Filter Design

> **Analysis of Discrete-Time Systems and FIR Filter Design using MATLAB.**

[![Language](https://img.shields.io/badge/Language-MATLAB-orange)]()
[![Method](https://img.shields.io/badge/Method-FFT_%26_Z--Transform-blue)]()
[![Filter](https://img.shields.io/badge/Filter-FIR_Bandpass-green)]()

## Project Overview
Signal processing is the core of modern diagnostic devices (ECG, EEG, MRI). This project implements fundamental **Digital Signal Processing (DSP)** techniques to analyze discrete signals, verify system stability, and design digital filters.

The project focuses on three key pillars of BME Signal Processing:
1.  **Spectral Analysis:** Using Fast Fourier Transform (FFT) to visualize Power and Phase spectra.
2.  **System Stability:** Analyzing Transfer Functions $H(z)$ via Pole-Zero plots.
3.  **Noise Removal:** Designing a **Linear-Phase FIR Bandpass Filter** using the Fourier Transform method.

## Methodology

### 1. Spectral Analysis (FFT)
We analyzed the frequency components of a pseudo-random discrete signal.
* **Technique:** One-sided Amplitude and Power Spectrum.
* **Application:** Identifying dominant frequency components (similar to detecting Alpha/Beta waves in EEG).

### 2. Stability Analysis (Pole-Zero)
We modeled a discrete-time system using the custom Transfer Function:
$$H(z) = \frac{z - 0.5}{A \cdot z^2 + B \cdot z + C}$$
* **Stability Criterion:** The system was verified to be **Stable** as all poles lay strictly inside the Unit Circle ($|z| < 1$).

### 3. FIR Filter Design
Designed a Bandpass Filter to isolate specific physiological frequencies.
* **Type:** Finite Impulse Response (FIR)
* **Passband:** 1000 Hz – 2000 Hz
* **Sampling Rate ($f_s$):** 8000 Hz
* **Design Method:** Fourier Transform Method (Windowed Sinc).
* **Result:** Linear phase response, ensuring no distortion of the signal waveform (crucial for ECG morphology).

## Results

### Frequency Response (FIR Filter)
The Magnitude response shows clear attenuation outside the 1-2kHz band, while the Phase response is linear.
![Filter Response](https://github.com/amna-014/Biomedical-Signal-Processing-MATLAB/blob/main/magnitude%20and%20response.jpg?raw=true)

### Stability Analysis (Pole-Zero Plot)
Visual confirmation that system poles (x) are contained within the unit circle.
![Pole Zero Plot](https://github.com/amna-014/Biomedical-Signal-Processing-MATLAB/blob/main/pole%20zero%20plot.jpg?raw=true)

## 📂 Repository Contents
* **📄 Project Report:** Detailed mathematical derivation and design process.
* **💻 MATLAB Script (`.m`):** Source code for FFT computation and Filter design.

---
*Developed for Course BM-363L (Biomedical Signal Processing).*
