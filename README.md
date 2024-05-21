# QPSK-Modulator

Quadrature Phase Shift Keying (QPSK) is a modulation technique used in digital communication systems to transmit data by changing the phase of a carrier signal. It operates by encoding two bits of data into four distinct phase shifts: 0°, 90°, 180°, and 270°. Each phase shift corresponds to a unique pair of bits, enabling QPSK to transmit twice the amount of data per symbol compared to Binary Phase Shift Keying (BPSK). The QPSK modulator splits the input bitstream into two separate bitstreams, which modulate two orthogonal carriers (usually sine and cosine waves) that are then combined to form the QPSK signal. At the receiver, the QPSK demodulator separates the combined signal back into its orthogonal components, decodes the phase shifts, and converts them back into the original bit pairs. This modulation scheme is efficient in terms of bandwidth utilization and is robust against noise, making it suitable for various communication applications, including satellite and cellular networks. The use of differential encoding can enhance its performance by simplifying phase ambiguity resolution during the demodulation process.

![QPSK Example waveform](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/0acbe60a-e9ae-426e-80b4-1645099ebb67)

Hardware Block Diagram:
![Schematic Of FInal QPSK Mod](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/ce25a7f9-3712-47d2-b5e4-06ee90cc0861)

Functioning of bit splitter:
In Quadrature Phase Shift Keying (QPSK), a bit splitter divides the input binary data stream into two separate bit streams(Even and Odd). Each bit stream is then used to modulate the in-phase (I) and quadrature (Q) components of the carrier signal. This allows the simultaneous transmission of two bits per symbol, effectively doubling the data rate compared to Binary Phase Shift Keying (BPSK).

Functioning of synchronizer:
In QPSK, a synchronizer aligns the Even and Odd bit streams with the receiver's reference signals to ensure accurate modulation.

To achieve synchronization in a QPSK system using counters, we can utilize the following method, assuming a clock frequency of 50 MHz and a carrier wave frequency of 960 kHz:
1. **Clock and Carrier Frequency Relationship**: The 50 MHz clock and 960 kHz carrier wave relationship is used to determine the number of clock cycles per bit.
2. **Bit Timing Calculation**: By calculation, each bit (both even and odd) should be held for 52 clock cycles to match the carrier wave period.
3. **Bit Modulation Process**:
   - Each bit (even and odd) is retained for 52 clock cycles.
   - After 52 cycles, the next bit is fetched for modulation.
4. **Synchronization Cycle**:
   - The process is repeated every 4 bits (both even and odd), ensuring synchronization with the carrier signal for accurate modulation.

This structured approach ensures that the QPSK modulation is synchronized with the system's clock and carrier wave, facilitating accurate and efficient data transmission.

Functionining of Modulator:
In a QPSK modulator, two sine waves and cosine waves are generated, each with a frequency of 960 kHz. The sine wave is modulated with even bits, while the cosine wave is modulated with odd bits. When the data bit is '1', there is no phase shift applied to either wave. However, when the data bit is '0', both waves experience a phase shift of 180 degrees. These modulated outputs are combined using a summer circuit to produce the final QPSK output signal. This method allows for efficient transmission of digital data by encoding two bits per symbol, leveraging both the amplitude and phase of the carrier waves.

QPSK output for bitstream [00101100]:

![00101100](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/718e8c3d-c0c4-4580-bbee-a3dfdb94c53f)

The look up table for sine and cosine waves can be generated using MATLAB.


![WhatsApp Image 2024-05-21 at 16 56 45_3caf2b74](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/4dea6151-ba2c-4aa7-b278-e19a74dfb2a8)


![sinewaveLUTgeneratoroutput](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/1b678703-5dd0-4b76-8ef4-c239f41c824a)



For verifying the verilog code we can write a MATLAB code for the same functionality.


![11110000 matlab sim](https://github.com/Divyajyotipatra10/QPSK-Modulator/assets/165509472/1a654039-717d-4563-9510-ff802ca8b51e)



