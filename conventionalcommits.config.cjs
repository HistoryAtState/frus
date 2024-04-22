// Change default header pattern matcher to match headers with no colon.
// This will make the first __word__ in free-form commit message headers the __type__.
// With this non-empty type we can do a negated match (the type being anything but
// one of the other keywords with associated release rules).
module.exports = { 
    headerPattern: /^(\w*)(?:\(([\w\$\.\-\* ]*)\))?\:? (.*)$/
}
