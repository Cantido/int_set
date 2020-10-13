
# Benchmark

Benchmark run from 2020-10-13 14:45:19.344000Z UTC

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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">2.04 M</td>
    <td style="white-space: nowrap; text-align: right">0.49 μs</td>
    <td style="white-space: nowrap; text-align: right">±129.51%</td>
    <td style="white-space: nowrap; text-align: right">0 μs</td>
    <td style="white-space: nowrap; text-align: right">1.58 μs</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">1.96 M</td>
    <td style="white-space: nowrap; text-align: right">0.51 μs</td>
    <td style="white-space: nowrap; text-align: right">±20.02%</td>
    <td style="white-space: nowrap; text-align: right">0.45 μs</td>
    <td style="white-space: nowrap; text-align: right">0.76 μs</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">0.0540 M</td>
    <td style="white-space: nowrap; text-align: right">18.52 μs</td>
    <td style="white-space: nowrap; text-align: right">±63.82%</td>
    <td style="white-space: nowrap; text-align: right">15.98 μs</td>
    <td style="white-space: nowrap; text-align: right">49.38 μs</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">0.0399 M</td>
    <td style="white-space: nowrap; text-align: right">25.07 μs</td>
    <td style="white-space: nowrap; text-align: right">±771.96%</td>
    <td style="white-space: nowrap; text-align: right">0 μs</td>
    <td style="white-space: nowrap; text-align: right">1499.98 μs</td>
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
    <td style="white-space: nowrap;text-align: right">2.04 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">1.96 M</td>
    <td style="white-space: nowrap; text-align: right">1.04x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">0.0540 M</td>
    <td style="white-space: nowrap; text-align: right">37.79x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">0.0399 M</td>
    <td style="white-space: nowrap; text-align: right">51.15x</td>
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
    <td style="white-space: nowrap">0.58 KB</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap">0.56 KB</td>
    <td>0.97x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap">4.81 KB</td>
    <td>8.26x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap">3.65 KB</td>
    <td>6.28x</td>
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
    <td style="white-space: nowrap">MapSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">5.41 M</td>
    <td style="white-space: nowrap; text-align: right">184.89 ns</td>
    <td style="white-space: nowrap; text-align: right">±43.67%</td>
    <td style="white-space: nowrap; text-align: right">144 ns</td>
    <td style="white-space: nowrap; text-align: right">446.40 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.99 M</td>
    <td style="white-space: nowrap; text-align: right">200.48 ns</td>
    <td style="white-space: nowrap; text-align: right">±41.31%</td>
    <td style="white-space: nowrap; text-align: right">144 ns</td>
    <td style="white-space: nowrap; text-align: right">454 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">1.42 M</td>
    <td style="white-space: nowrap; text-align: right">705.25 ns</td>
    <td style="white-space: nowrap; text-align: right">±95.99%</td>
    <td style="white-space: nowrap; text-align: right">604 ns</td>
    <td style="white-space: nowrap; text-align: right">1584 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">1.30 M</td>
    <td style="white-space: nowrap; text-align: right">770.92 ns</td>
    <td style="white-space: nowrap; text-align: right">±98.65%</td>
    <td style="white-space: nowrap; text-align: right">604 ns</td>
    <td style="white-space: nowrap; text-align: right">1584 ns</td>
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
    <td style="white-space: nowrap;text-align: right">5.41 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">4.99 M</td>
    <td style="white-space: nowrap; text-align: right">1.08x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap; text-align: right">1.42 M</td>
    <td style="white-space: nowrap; text-align: right">3.81x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap; text-align: right">1.30 M</td>
    <td style="white-space: nowrap; text-align: right">4.17x</td>
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
    <td style="white-space: nowrap">357.81 B</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.put with nonexisting member</td>
    <td style="white-space: nowrap">362.08 B</td>
    <td>1.01x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with existing member</td>
    <td style="white-space: nowrap">253.72 B</td>
    <td>0.71x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.put with nonexisting member</td>
    <td style="white-space: nowrap">273.51 B</td>
    <td>0.76x</td>
  </tr>

</table>


<hr/>

