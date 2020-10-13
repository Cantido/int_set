
# Benchmark

Benchmark run from 2020-10-13 14:44:05.535000Z UTC

## System

Benchmark suite executing on the following system:

<table style="width: 1%">
  <tr>
    <th style="width: 1%; white-space: nowrap">Operating System</th>
    <td>Windows</td>
  </tr><tr>
    <th style="white-space: nowrap">CPU Information</th>
    <td style="white-space: nowrap">Intel(R) Core(TM) i7-4770K CPU @ 3.50GHz</td>
  </tr><tr>
    <th style="white-space: nowrap">Number of Available Cores</th>
    <td style="white-space: nowrap">8</td>
  </tr><tr>
    <th style="white-space: nowrap">Available Memory</th>
    <td style="white-space: nowrap">15.94 GB</td>
  </tr><tr>
    <th style="white-space: nowrap">Elixir Version</th>
    <td style="white-space: nowrap">1.11.0</td>
  </tr><tr>
    <th style="white-space: nowrap">Erlang Version</th>
    <td style="white-space: nowrap">21.3</td>
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
    <td style="white-space: nowrap">Enum.member? MapSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">6.74 M</td>
    <td style="white-space: nowrap; text-align: right">148.40 ns</td>
    <td style="white-space: nowrap; text-align: right">±48.47%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">305 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.48 M</td>
    <td style="white-space: nowrap; text-align: right">154.32 ns</td>
    <td style="white-space: nowrap; text-align: right">±266.67%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1585 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.47 M</td>
    <td style="white-space: nowrap; text-align: right">223.56 ns</td>
    <td style="white-space: nowrap; text-align: right">±39.78%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">455 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.18 M</td>
    <td style="white-space: nowrap; text-align: right">239.30 ns</td>
    <td style="white-space: nowrap; text-align: right">±207.01%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1585 ns</td>
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
    <td style="white-space: nowrap;text-align: right">6.74 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.48 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.47 M</td>
    <td style="white-space: nowrap; text-align: right">1.51x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.18 M</td>
    <td style="white-space: nowrap; text-align: right">1.61x</td>
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
    <td style="white-space: nowrap">120 B</td>
    <td>5.0x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap">120 B</td>
    <td>5.0x</td>
  </tr>

</table>


<hr/>


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
    <td style="white-space: nowrap; text-align: right">6.55 M</td>
    <td style="white-space: nowrap; text-align: right">152.72 ns</td>
    <td style="white-space: nowrap; text-align: right">±50.15%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">305 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.13 M</td>
    <td style="white-space: nowrap; text-align: right">163.26 ns</td>
    <td style="white-space: nowrap; text-align: right">±258.42%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1585 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.53 M</td>
    <td style="white-space: nowrap; text-align: right">220.85 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.12%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">455 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.42 M</td>
    <td style="white-space: nowrap; text-align: right">226.14 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.99%</td>
    <td style="white-space: nowrap; text-align: right">145 ns</td>
    <td style="white-space: nowrap; text-align: right">455 ns</td>
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
    <td style="white-space: nowrap;text-align: right">6.55 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? MapSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">6.13 M</td>
    <td style="white-space: nowrap; text-align: right">1.07x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with existing member</td>
    <td style="white-space: nowrap; text-align: right">4.53 M</td>
    <td style="white-space: nowrap; text-align: right">1.45x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.42 M</td>
    <td style="white-space: nowrap; text-align: right">1.48x</td>
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
    <td style="white-space: nowrap">120 B</td>
    <td>5.0x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">Enum.member? IntSet with nonexisting member</td>
    <td style="white-space: nowrap">120 B</td>
    <td>5.0x</td>
  </tr>

</table>


<hr/>

