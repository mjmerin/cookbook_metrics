# Cookbook Metrics

## Description

Simple [Chef Supermarket](https://supermarket.chef.io/) cookbook tracker script.  
Queries the [json file](https://supermarket.chef.io/api/v1/cookbooks/) provided by the [Chef Supermarket](https://supermarket.chef.io/) to provide supermarket downloads across all versions of the selected cookbook.  
The selected cookbook must exist on the [Chef Supermarket](https://supermarket.chef.io/). 

Uses [Supermarket API V1](https://docs.chef.io/supermarket_api.html)

#### Usage

Basic Usage
```
ruby cookbook_metrics.rb <supermarket cookbook>
```

CSV Usage
```
ruby cookbook_metrics.rb <supermarket cookbook> csv
```

#### Sample Output
```
==============  macos cookbook metrics  ==============
Description: Resources for configuring and provisioning macOS
Source URL:  https://github.com/Microsoft/macos-cookbook

Version Downloads
------- ---------
0.8.2    59
0.9.0    72
1.0.0    90
1.1.0    81
1.1.1    70
1.2.0    60
1.5.0    52
1.6.0    64
1.7.0    48
1.8.0    92
1.9.0    56
1.10.1   103
1.11.0   109
1.12.0   68
1.13.1   53
1.14     13
1.14.1   63
2.0.0    33
2.1.0    37
2.2.0    161
2.3.0    70
2.4.0    44

Metrics:
  Date/Time: 09/07/2018 - 09:22
  Total Downloads: 1498
  Most Downloaded Version: 2.2.0 at 161 downloads

===========================================================
```

## Coding
#### Requirements

Ruby
- Built with version 2.5.1p57 (2018-03-29 revision 63029)

Gems
- rest-client
- json
- date
- csv

#### Classes

`Cookbook` - Contains easily accessible parsed results from the Chef Supermarket
`Metrics` - Contains metrics pertaining to the selected cookbook
`Version` - Contains cookbook version specific data
`Display` - Contains printing methods

