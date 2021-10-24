
# Benchmark

Benchmark run from 2021-10-24 06:49:05.253453Z UTC

## System

Benchmark suite executing on the following system:

<table style="width: 1%">
  <tr>
    <th style="width: 1%; white-space: nowrap">Operating System</th>
    <td>macOS</td>
  </tr><tr>
    <th style="white-space: nowrap">CPU Information</th>
    <td style="white-space: nowrap">Apple M1</td>
  </tr><tr>
    <th style="white-space: nowrap">Number of Available Cores</th>
    <td style="white-space: nowrap">8</td>
  </tr><tr>
    <th style="white-space: nowrap">Available Memory</th>
    <td style="white-space: nowrap">16 GB</td>
  </tr><tr>
    <th style="white-space: nowrap">Elixir Version</th>
    <td style="white-space: nowrap">1.12.2</td>
  </tr><tr>
    <th style="white-space: nowrap">Erlang Version</th>
    <td style="white-space: nowrap">24.1</td>
  </tr>
</table>

## Configuration

Benchmark suite executing with the following configuration:

<table style="width: 1%">
  <tr>
    <th style="width: 1%">:time</th>
    <td style="white-space: nowrap">5 s</td>
  </tr><tr>
    <th>:parallel</th>
    <td style="white-space: nowrap">4</td>
  </tr><tr>
    <th>:warmup</th>
    <td style="white-space: nowrap">2 s</td>
  </tr>
</table>

## Statistics




__Input: Middle (100 Thousand)__

Run Time

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap; text-align: right">38.85 K</td>
    <td style="white-space: nowrap; text-align: right">0.0257 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;45.72%</td>
    <td style="white-space: nowrap; text-align: right">0.0250 ms</td>
    <td style="white-space: nowrap; text-align: right">0.0310 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">0.160 K</td>
    <td style="white-space: nowrap; text-align: right">6.24 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;7.20%</td>
    <td style="white-space: nowrap; text-align: right">6.17 ms</td>
    <td style="white-space: nowrap; text-align: right">8.16 ms</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap;text-align: right">38.85 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">0.160 K</td>
    <td style="white-space: nowrap; text-align: right">242.46x</td>
  </tr>

</table>



Memory Usage

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">Memory</th>
    <th style="text-align: right">Factor</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap">0.0243 MB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap">3.29 MB</td>
    <td>135.68x</td>
  </tr>
</table>



__Input: Small (1 Thousand)__

Run Time

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Average</th>
    <th style="text-align: right">Devitation</th>
    <th style="text-align: right">Median</th>
    <th style="text-align: right">99th&nbsp;%</th>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap; text-align: right">983.15 K</td>
    <td style="white-space: nowrap; text-align: right">1.02 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;289.47%</td>
    <td style="white-space: nowrap; text-align: right">0.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">1.99 &micro;s</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">23.04 K</td>
    <td style="white-space: nowrap; text-align: right">43.40 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;19.29%</td>
    <td style="white-space: nowrap; text-align: right">42.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">49.99 &micro;s</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap;text-align: right">983.15 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">23.04 K</td>
    <td style="white-space: nowrap; text-align: right">42.66x</td>
  </tr>

</table>



Memory Usage

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">Memory</th>
    <th style="text-align: right">Factor</th>
  </tr>
  <tr>
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap">0.65 KB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap">17.07 KB</td>
    <td>26.25x</td>
  </tr>
</table>


