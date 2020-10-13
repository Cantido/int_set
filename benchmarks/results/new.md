
# Benchmark

Benchmark run from 2020-10-13 14:42:51.985000Z UTC

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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap; text-align: right">25.63</td>
    <td style="white-space: nowrap; text-align: right">39.02 ms</td>
    <td style="white-space: nowrap; text-align: right">±25.12%</td>
    <td style="white-space: nowrap; text-align: right">32.00 ms</td>
    <td style="white-space: nowrap; text-align: right">63.00 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">9.02</td>
    <td style="white-space: nowrap; text-align: right">110.84 ms</td>
    <td style="white-space: nowrap; text-align: right">±7.66%</td>
    <td style="white-space: nowrap; text-align: right">109.00 ms</td>
    <td style="white-space: nowrap; text-align: right">127.72 ms</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap;text-align: right">25.63</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">9.02</td>
    <td style="white-space: nowrap; text-align: right">2.84x</td>
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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap">3.93 MB</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap">50.80 MB</td>
    <td>12.93x</td>
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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap; text-align: right">6.15 K</td>
    <td style="white-space: nowrap; text-align: right">162.72 μs</td>
    <td style="white-space: nowrap; text-align: right">±36.33%</td>
    <td style="white-space: nowrap; text-align: right">159.99 μs</td>
    <td style="white-space: nowrap; text-align: right">319.99 μs</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">2.67 K</td>
    <td style="white-space: nowrap; text-align: right">374.35 μs</td>
    <td style="white-space: nowrap; text-align: right">±156.76%</td>
    <td style="white-space: nowrap; text-align: right">0 μs</td>
    <td style="white-space: nowrap; text-align: right">1599.98 μs</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap;text-align: right">6.15 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">2.67 K</td>
    <td style="white-space: nowrap; text-align: right">2.3x</td>
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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap">63.56 KB</td>

      <td>&nbsp;</td>

  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap">302.90 KB</td>
    <td>4.77x</td>
  </tr>

</table>


<hr/>

