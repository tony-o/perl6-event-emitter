#Event::Emitter

An extendable JS like event emitter.  Can use supplies or channels and is basically just some syntax sugar on already implemented Perl6 features.

##Syntax

Out of the box functionality

###Single thread

```Event::Emitter``` uses a ```Supply``` in the back end

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

#runs the some str listener
$e.emit('some str', @(1 .. 5)); 

#runs the regex because it matches the regex;
$e.emit('Some regex', { conn => IO::Socket::INET }); 

$e.emit({ 'some flag' => 5 }, { });
```

###Thread

```Event::Emitter``` uses a ```Channel``` in the back end

```perl6
use Event::Emitter;

my Event::Emitter $e .= new(:threaded);
```

##Rolling your own Event::Emitter

Want to make your own receiver/emitter?  Here's a template

```perl6
use Event::Emitter::Role::Handler;

class My::Own::Emitter;

method on($event, $data) {
  qw<do your thing>;
}

method emit($event, $data?) {
  qw<do your thing here>;
}
```

#License

Free for all.
