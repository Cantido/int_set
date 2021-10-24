
# Benchmark

Benchmark run from 2021-10-24 06:47:30.727790Z UTC

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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">7.54 M</td>
    <td style="white-space: nowrap; text-align: right">0.133 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;4026.01%</td>
    <td style="white-space: nowrap; text-align: right">0 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">0.99 &micro;s</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.26 M</td>
    <td style="white-space: nowrap; text-align: right">0.160 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;8139.83%</td>
    <td style="white-space: nowrap; text-align: right">0 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">0.99 &micro;s</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">0.167 M</td>
    <td style="white-space: nowrap; text-align: right">6.01 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;28.19%</td>
    <td style="white-space: nowrap; text-align: right">5.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">8.99 &micro;s</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">0.124 M</td>
    <td style="white-space: nowrap; text-align: right">8.05 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;38.73%</td>
    <td style="white-space: nowrap; text-align: right">7.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">11.99 &micro;s</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap;text-align: right">7.54 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.26 M</td>
    <td style="white-space: nowrap; text-align: right">1.2x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">0.167 M</td>
    <td style="white-space: nowrap; text-align: right">45.26x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">0.124 M</td>
    <td style="white-space: nowrap; text-align: right">60.63x</td>
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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap">0 KB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap">0.29 KB</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap">3.22 KB</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap">7.30 KB</td>
    <td>&mdash;</td>
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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">10.95 M</td>
    <td style="white-space: nowrap; text-align: right">91.35 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;5517.49%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">7.97 M</td>
    <td style="white-space: nowrap; text-align: right">125.41 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;12660.78%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">3.05 M</td>
    <td style="white-space: nowrap; text-align: right">328.40 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;507.26%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">2.84 M</td>
    <td style="white-space: nowrap; text-align: right">351.97 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;437.62%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap;text-align: right">10.95 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">7.97 M</td>
    <td style="white-space: nowrap; text-align: right">1.37x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">3.05 M</td>
    <td style="white-space: nowrap; text-align: right">3.6x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">2.84 M</td>
    <td style="white-space: nowrap; text-align: right">3.85x</td>
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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap">0 B</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap">183.21 B</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap">290.48 B</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap">287.77 B</td>
    <td>&mdash;</td>
  </tr>
</table>


