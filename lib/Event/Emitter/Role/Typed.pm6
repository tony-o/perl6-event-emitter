role Event::Emitter::Role::Typed[:$threaded?] {
    use Event::Emitter;

    has Event::Emitter $!emitter;

    submethod BUILD {
        $!emitter = Event::Emitter.new(:threaded(so $threaded));
    }

    method on(Mu:U $type, Callable $handler) {
        $!emitter.on(-> $event { $event ~~ $type}, $handler);
    }

    method emit(Mu:D $payload) {
        $!emitter.emit($payload.WHAT, $payload);
    }
}
