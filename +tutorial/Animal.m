%{
# animal
subject_name                : char(128)                     # unique subject name
---
genotype                    : enum('WT','KO','U')           # genotype - KO, WT, or unclassifed
animal_notes = null         : char(128)                     # 
animal_ts=CURRENT_TIMESTAMP : timestamp                     # 
%}

classdef Animal < dj.Manual
end
