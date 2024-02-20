% Initalzing
clear
clc
load handel
sound(y, Fs); 

% The title of the figure that will contain all the graphs
figure('Name','The Three Audio Signal with Six Graphs','NumberTitle','off');

% Original Signal Time Graph
subplot(3, 2, 1);
plot((0:length(y)-1) / Fs, y);  % Plotting the original audio signal
title('Original Audio Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

% Continous Time Variable
a = 3; %Defineing the Scaling Factor
t_original = 0:length(y)-1;
t_scaled = a.*t_original;

% Original Signal Frequency Graph

subplot(3, 2, 2);
plot((-length(y)/2:length(y)/2-1) * Fs/length(y), abs(fftshift(fft(y))));  % Plotting the frequency spectrum of the original signal
title('Frequency Spectrum of Original Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

pause(9);  % Pause to allow the first audio to finish before plotting the next one

% Downsampled Audio Signal
D = 4;
y_downsampled = downsample(y, D);  % Downsampling the audio
Fs_downsampled = Fs / D;

% Downsampled Signal Time and Frequency
subplot(3, 2, 3);
plot((0:length(y_downsampled)-1) / Fs_downsampled, y_downsampled);  % Plotting the downsampled audio signal
title('Downsampled Audio');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3, 2, 4);
plot((-length(y_downsampled)/2:length(y_downsampled)/2-1) * Fs_downsampled/length(y_downsampled), abs(fftshift(fft(y_downsampled))));  % Plotting the frequency spectrum of the downsampled signal
title('Frequency Spectrum of Downsampled Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Play back the downsampled audio
sound(y_downsampled, Fs_downsampled);  % Playing back the second audio
pause(9);

% Filtered Audio Signal
b=cheby1(5, 1, 0.45);
a=1;
y_filtered = filter(b, a, y_downsampled);  % Downsampling the audio with an anti-aliasing or lowpassfilter
Fs_filtered = Fs / D;

% Filtered Signal with Time and Frequency
subplot(3, 2, 5);
plot((0:length(y_filtered)-1) / Fs_filtered, y_filtered);  % Plotting the downsampled and filtered audio signal
title('Downsampled Filtered Audio');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;

subplot(3, 2, 6);
plot((-length(y_filtered)/2:length(y_filtered)/2-1) * Fs_filtered/length(y_filtered), abs(fftshift(fft(y_filtered))));  % Plotting the frequency spectrum of the downsampled and filtered signal
title('Frequency Spectrum of Downsampled Filtered Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Play back the downsampled and filtered audio
sound(y_filtered, Fs_filtered);  % Playing back the third audio

% Saving all the three Audio into .wav
audiowrite ('Original Audio.wav',y,Fs)
audiowrite ('DownSampled Audio.wav',y_downsampled,Fs_downsampled)
audiowrite ('Filtered Audio.wav',y_filtered,Fs_filtered)

