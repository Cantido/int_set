# Benchmark

Benchmark run from 2021-10-24 06:53:49.085253Z UTC

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
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">18.25 M</td>
    <td style="white-space: nowrap; text-align: right">54.80 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;1902.76%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">13.50 M</td>
    <td style="white-space: nowrap; text-align: right">74.10 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;3674.14%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">1.56 M</td>
    <td style="white-space: nowrap; text-align: right">639.16 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;2791.80%</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">0.0281 M</td>
    <td style="white-space: nowrap; text-align: right">35633.11 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;9.74%</td>
    <td style="white-space: nowrap; text-align: right">36000 ns</td>
    <td style="white-space: nowrap; text-align: right">37000 ns</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap;text-align: right">18.25 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">13.50 M</td>
    <td style="white-space: nowrap; text-align: right">1.35x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">1.56 M</td>
    <td style="white-space: nowrap; text-align: right">11.66x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">0.0281 M</td>
    <td style="white-space: nowrap; text-align: right">650.29x</td>
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
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap">0 KB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap">0 KB</td>
    <td>1.0x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap">1.55 KB</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap">110.09 KB</td>
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
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">15.45 M</td>
    <td style="white-space: nowrap; text-align: right">64.72 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;1296.29%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">14.03 M</td>
    <td style="white-space: nowrap; text-align: right">71.29 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;1823.42%</td>
    <td style="white-space: nowrap; text-align: right">0 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">1.33 M</td>
    <td style="white-space: nowrap; text-align: right">753.82 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;2733.87%</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">1.15 M</td>
    <td style="white-space: nowrap; text-align: right">866.15 ns</td>
    <td style="white-space: nowrap; text-align: right">&plusmn;1768.54%</td>
    <td style="white-space: nowrap; text-align: right">1000 ns</td>
    <td style="white-space: nowrap; text-align: right">2000 ns</td>
  </tr>

</table>


Comparison

<table style="width: 1%">
  <tr>
    <th>Name</th>
    <th style="text-align: right">IPS</th>
    <th style="text-align: right">Slower</th>
  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap;text-align: right">15.45 M</td>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">14.03 M</td>
    <td style="white-space: nowrap; text-align: right">1.1x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap; text-align: right">1.33 M</td>
    <td style="white-space: nowrap; text-align: right">11.65x</td>
  </tr>

  <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap; text-align: right">1.15 M</td>
    <td style="white-space: nowrap; text-align: right">13.38x</td>
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
    <td style="white-space: nowrap">MapSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap">0 KB</td>
    <td>&nbsp;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">MapSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap">0 KB</td>
    <td>1.0x</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are equal</td>
    <td style="white-space: nowrap">1.50 KB</td>
    <td>&mdash;</td>
  </tr>
    <tr>
    <td style="white-space: nowrap">IntSet.equal? when the sets are not equal</td>
    <td style="white-space: nowrap">2.37 KB</td>
    <td>&mdash;</td>
  </tr>
</table>


