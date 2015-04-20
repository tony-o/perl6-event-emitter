role Event::Emitter::Role::Node[:$threaded?] {
    use Event::Emitter;

    has Event::Emitter $!emitter handles <on emit>;

    submethod BUILD {
        $!emitter = Event::Emitter.new(:threaded(so $threaded));
    }
}
