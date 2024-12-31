{% set sample_dictionary = {
    'word' : 'data',
    'speech' : 'noun',
    'definition' : 'if you know you know'
 }
%}

{{  sample_dictionary['word'] }} | {{ sample_dictionary['speech'] }} | {{ sample_dictionary['definition'] }}