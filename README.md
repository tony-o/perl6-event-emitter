#Event::Emitter

An extendable JS like event emitter.  Can use supplies or channels and is basically just some syntax sugar on already implemented Perl6 features.

##syntax

```perl6
use Event::Emitter;

my Event::Emitter $e .= new;

#hey, i work with regex
$e.on(/^^ "Some regex"/, -> $data {
  qw<do something with your $data here>;
});

#your own callables to match events
$e.on({ $event<some flag> // Nil eq $*STATE }, -> $data {
  qw<do something with your $data here>;
});

#plain ol strings, just like mom used to make
$e.on('some str', -> $data {
  qw<do something with your $data here>;
});

$e.emit('some str', @(1 .. 5)); #runs the some str listener

$e.emit('Some regex', { conn => IO::Socket::INET }); #runs the regex because it matches the regex;

$e.emit({ 'some flag' => 5 }, { });
```

