clc; 
close all; 
clear all; 
% User Input 
x = input('Enter the roll numbers as a vector: ');     
N = input('Enter the number of members: ');            
% Sampling Frequency  
fs = 200; 
% Perform FFT  
X = fft(x); 
k = 0:N-1; 
fk = k * fs / N; 
% One-sided Amplitude Spectrum  
A = abs(X)/N; 
A1 = [A(1), 2*A(2:floor(N/2))]'; 
fk1 = fk(1:floor(N/2)); 
figure(1); 
stem(fk1, A1); 
title('One-sided Amplitude Spectrum'); 
xlabel('f (Hz)'); 
ylabel('Amplitude'); 
% One-sided Power Spectrum 
P = A.^2; 
P1 = [P(1), 2*P(2:floor(N/2))];
figure(2); 
stem(fk1, P1); 
title('One-sided Power Spectrum'); 
xlabel('f (Hz)'); 
ylabel('Power'); 
% Phase Spectrum 
phase = angle(X)*(180/pi); 
figure(3); 
stem(fk, phase); 
title('Phase Spectrum'); 
xlabel('f (Hz)'); 
ylabel('Angle (Degrees)'); 
% Pole-Zero Plots 
b = [1 -0.5];              
avg = mean(x);             
% Numerator stays same 
% Average of roll numbers 
rounded_avg = round(avg);  % Use this for taps later 
% For roll number 12 
r = 12; 
a = [avg, (1.2 + r), 0.45 * r]; 
figure(4); 
zplane(roots(b), roots(a)); 
title('Pole-Zero Plot for Roll No 12'); 
% For roll number 14 
r = 14; 
a = [avg, (1.2 + r), 0.45 * r]; 
figure(5); 
zplane(roots(b), roots(a)); 
title('Pole-Zero Plot for Roll No 14'); 
% For roll number 35 
r = 35; 
a = [avg, (1.2 + r), 0.45 * r]; 
figure(6); 
zplane(roots(b), roots(a)); 
title('Pole-Zero Plot for Roll No 35'); 
% FIR Bandpass Filter Design 
A = 1;                           
fL = 1000;                       
fH = 2000;                       
fs = 8000;                       
taps = (rounded_avg * 2) + 1;    
omega_L = 2*pi*fL/fs; 
omega_H = 2*pi*fH/fs; 
M = (taps - 1)/2; 
% Impulse response calculation 
for n = -M:M 
if n == 0 
% Filter gain 
% Lower cutoff frequency 
% Upper cutoff frequency 
% Sampling frequency 
% Filter taps (odd number) 
B(n+M+1) = (omega_H - omega_L) / pi; 
else 
B(n+M+1) = (sin(omega_H*n) - sin(omega_L*n)) / (n*pi); 
end 
end 
% Frequency response 
omega = 0:pi/1023:pi; 
H = freqz(B, A, omega); 
H_dB = 20 * log10(abs(H)); 
9 
phase = unwrap(angle(H)) * (180/pi);
f = (omega * fs) / (2*pi); 
figure(7); 
subplot(1,2,1); 
plot(f, H_dB); 
title(['Magnitude Response (' num2str(taps) ' taps)']); 
xlabel('f (Hz)'); 
ylabel('Magnitude (dB)'); 
subplot(1,2,2); 
plot(f, phase); 
title(['Phase Response (' num2str(taps) ' taps)']); 
xlabel('f (Hz)'); 
ylabel('Angle (Degrees)'); 
sgtitle({'FOURIER TRANSFORM DESIGN METHOD', 'FIR BANDPASS FILTER FREQUENCY RESPONSE'});
