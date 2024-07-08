# Benchmark

Benchmark run from 2021-10-24 06:40:41.671729Z UTC

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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap; text-align: right">67.53</td>
    <td style="white-space: nowrap; text-align: right">14.81 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;3.53%</td>
    <td style="white-space: nowrap; text-align: right">14.71 ms</td>
    <td style="white-space: nowrap; text-align: right">17.54 ms</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">23.94</td>
    <td style="white-space: nowrap; text-align: right">41.78 ms</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;5.75%</td>
    <td style="white-space: nowrap; text-align: right">41.47 ms</td>
    <td style="white-space: nowrap; text-align: right">50.27 ms</td>
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
    <td style="white-space: nowrap;text-align: right">67.53</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">23.94</td>
    <td style="white-space: nowrap; text-align: right">2.82x</td>
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
    <td style="white-space: nowrap">4.64 MB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap">51.30 MB</td>
    <td>11.04x</td>
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
    <td style="white-space: nowrap">MapSet.new</td>
    <td style="white-space: nowrap; text-align: right">11.19 K</td>
    <td style="white-space: nowrap; text-align: right">89.34 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;5.17%</td>
    <td style="white-space: nowrap; text-align: right">88.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">104.99 &micro;s</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">5.72 K</td>
    <td style="white-space: nowrap; text-align: right">174.92 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;9.93%</td>
    <td style="white-space: nowrap; text-align: right">167.99 &micro;s</td>
    <td style="white-space: nowrap; text-align: right">237.99 &micro;s</td>
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
    <td style="white-space: nowrap;text-align: right">11.19 K</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap; text-align: right">5.72 K</td>
    <td style="white-space: nowrap; text-align: right">1.96x</td>
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
    <td style="white-space: nowrap">63.57 KB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.new</td>
    <td style="white-space: nowrap">306.01 KB</td>
    <td>4.81x</td>
  </tr>
</table>


