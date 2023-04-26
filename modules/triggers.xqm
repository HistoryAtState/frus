xquery version "3.1";

module namespace trigger = 'http://exist-db.org/xquery/trigger';
import module namespace toc = "http://history.state.gov/ns/site/frus/toc" at '/db/apps/frus/modules/toc.xqm';

declare function trigger:after-create-document($uri) {
    toc:generate-frus-toc($uri)
};

declare function trigger:after-update-document($uri) {
    toc:generate-frus-toc($uri)
};
