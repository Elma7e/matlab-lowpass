# MATLAB Lowpass Filter
The **Filter** cheby1 built in function offers a convenient way to implement low pass filters for applications requiring signal smoothing. This library proves particularly useful in scenarios with constant cycletime as well as dynamic cycletime.

```[b,a] = cheby1(n,Rp,Wp)``` returns the transfer function coefficients of an nth-order lowpass digital Chebyshev Type I filter with normalized passband edge frequency Wp and Rp decibels of peak-to-peak passband ripple.


``` MATLAB
b=cheby1(5, 1, 0.45);
a=1;
y_filtered = filter(b, a, y_downsampled);  % Downsampling the audio with an anti-aliasing or lowpassfilter
Fs_filtered = Fs / D;
```
