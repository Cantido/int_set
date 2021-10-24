
# Benchmark

Benchmark run from 2021-10-24 06:44:23.421600Z UTC

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
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.82 M</td>
    <td style="white-space: nowrap; text-align: right">146.56 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;8914.72%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.47 M</td>
    <td style="white-space: nowrap; text-align: right">154.60 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;8964.46%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.84 M</td>
    <td style="white-space: nowrap; text-align: right">206.49 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;18032.61%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.67 M</td>
    <td style="white-space: nowrap; text-align: right">214.24 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;18249.08%</td>
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
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap;text-align: right">6.82 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.47 M</td>
    <td style="white-space: nowrap; text-align: right">1.05x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.84 M</td>
    <td style="white-space: nowrap; text-align: right">1.41x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.67 M</td>
    <td style="white-space: nowrap; text-align: right">1.46x</td>
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
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap">104 B</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap">104 B</td>
    <td>1.0x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap">24 B</td>
    <td>0.23x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap">24 B</td>
    <td>0.23x</td>
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
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.94 M</td>
    <td style="white-space: nowrap; text-align: right">143.99 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;12046.30%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.71 M</td>
    <td style="white-space: nowrap; text-align: right">149.14 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;10955.95%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.49 M</td>
    <td style="white-space: nowrap; text-align: right">154.20 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;9050.71%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">990 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.46 M</td>
    <td style="white-space: nowrap; text-align: right">154.72 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;9276.11%</td>
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
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap;text-align: right">6.94 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.71 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.49 M</td>
    <td style="white-space: nowrap; text-align: right">1.07x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.46 M</td>
    <td style="white-space: nowrap; text-align: right">1.07x</td>
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
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap">24 B</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap">24 B</td>
    <td>1.0x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap">104 B</td>
    <td>4.33x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap">104 B</td>
    <td>4.33x</td>
  </tr>
</table>


