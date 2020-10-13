
# Benchmark

Benchmark run from 2020-10-13 14:56:04.961000Z UTC

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
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap; text-align: right">22.42 K</td>
    <td style="white-space: nowrap; text-align: right">0.0446 ms</td>
    <td style="white-space: nowrap; text-align: right">±139.38%</td>
    <td style="white-space: nowrap; text-align: right">0 ms</td>
    <td style="white-space: nowrap; text-align: right">0.160 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">0.0716 K</td>
    <td style="white-space: nowrap; text-align: right">13.96 ms</td>
    <td style="white-space: nowrap; text-align: right">±53.36%</td>
    <td style="white-space: nowrap; text-align: right">16.00 ms</td>
    <td style="white-space: nowrap; text-align: right">32.00 ms</td>
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
    <td style="white-space: nowrap;text-align: right">22.42 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">0.0716 K</td>
    <td style="white-space: nowrap; text-align: right">312.94x</td>
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
    <td style="white-space: nowrap">0.0481 MB</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap">3.18 MB</td>
    <td>65.98x</td>
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
    <td style="white-space: nowrap">IntSet.difference</td>
    <td style="white-space: nowrap; text-align: right">403.98 K</td>
    <td style="white-space: nowrap; text-align: right">2.48 μs</td>
    <td style="white-space: nowrap; text-align: right">±776.98%</td>
    <td style="white-space: nowrap; text-align: right">0 μs</td>
    <td style="white-space: nowrap; text-align: right">149.99 μs</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">12.47 K</td>
    <td style="white-space: nowrap; text-align: right">80.21 μs</td>
    <td style="white-space: nowrap; text-align: right">±89.60%</td>
    <td style="white-space: nowrap; text-align: right">77.98 μs</td>
    <td style="white-space: nowrap; text-align: right">159.99 μs</td>
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
    <td style="white-space: nowrap;text-align: right">403.98 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap; text-align: right">12.47 K</td>
    <td style="white-space: nowrap; text-align: right">32.41x</td>
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
    <td style="white-space: nowrap">0.95 KB</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.difference</td>
    <td style="white-space: nowrap">16.77 KB</td>
    <td>17.6x</td>
  </tr>

</table>


<hr/>

