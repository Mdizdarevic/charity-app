'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "d971458869d552620fb6944b2f4cb8c9",
"version.json": "50a2cc86c0c26ad8eb4387d937b1c32a",
"index.html": "ffd63e0916be0c6c76b128253b72717a",
"/": "ffd63e0916be0c6c76b128253b72717a",
"main.dart.js": "52912ee6f40da2f701e67572e61c99c0",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "6c62d7ff06141020a83b967fda584724",
".git/config": "c3ecb56f29d2dfc33b210855132e8abb",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/69/b2023ef3b84225f16fdd15ba36b2b5fc3cee43": "6ccef18e05a49674444167a08de6e407",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/34/ad42b9e418082f697b65171b04b866c1c47627": "8599013e315163d9aa215f71b4a60e09",
".git/objects/33/6f8e541df73a11ac7b8f8f1685fbf33e891dd0": "25b0ddac86ab69f5e557fe423d2c7b1d",
".git/objects/02/6b50f39f6464d41249a5b27da4518b48e17e39": "347a6987db5fb396dae69d6af2e9599d",
".git/objects/b5/8df3a5663c1ba18ee30962696e7462f9b1f761": "c1b7c8efc7ef0cdce64bd9ae1b83b383",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/ad/2d9f3003680b8612c814bdd5ba7cb6eca13fbc": "da04eaf50c5229e4caff66e04ea8ac76",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/be/c3f13872fec9f1c938da0a18c375b78b12610c": "6e74c58b8e52b996eac2b8704cbde625",
".git/objects/be/a21a7e65c3507d9de19be2da5e49609386f85d": "68ba60d7c2c083061774e6a067e8dad3",
".git/objects/b3/3d80ec47c7d71fbed584cc07713101bf99cee1": "bb0c4660dcde86f72386e9e7bf2de9ec",
".git/objects/b3/80d54133654052dd815c36fab7789aaf24b565": "d482f063192be6b2a88c1fbba2666d1d",
".git/objects/df/c7e2fc59dfbfaf577dc2777f6bb910a6d04d1f": "1a3069e2a129bcd83854f2d53efd65b2",
".git/objects/df/189155be14b9b349d4175c28857f74d5e11ca4": "8af798dfe5de1cc3a53f7efb0a0da800",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/1bb6d0165b76dd71c76e4cb60c54e68e55089f": "08e2651d9ebcb643a8357b943645a560",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fc/3f1219a60c9b136cfc2d31b874bd742870873b": "44ffa16c01f707142fa050a69779ddc5",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/e3/126780939277dc0a5bb3447a52e5ab0571ae90": "42217d52ac598e606f6cfa6f6d346224",
".git/objects/fe/3a3b6beae78b6254386086b068fedd14dbff1b": "463ba97c528fcadbacd24bd57e213731",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/ec/b70a19331a4f54da0643486323489b0117e71e": "ac6d1f5c4a9d7235e7821b318f1a3f2e",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/1a/2be78b3669a1af832a17abfb9e79c92023b3b9": "9d107a1ec5130c73cb433b604a90608c",
".git/objects/28/ea3b98f1836af38e03f72b1e55014b77439d54": "71cb12d325807bf3e23f963580ab6a76",
".git/objects/7b/f936c137e68a035ddd8e65c358f1371586f5c3": "57aeecb24ffb89307da4d32a85e6b84b",
".git/objects/7b/b6575c2448d79a200b5e2b50b432547f343e5e": "a4bdfe85c894ef45eb95211e81d4a87c",
".git/objects/7b/d28cb737ef46088453986d194c8e7a92abc003": "26e9cde65926cbe0b3a51f9afdee5a5b",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/72/0398250569acc5bdba602a25de685e8a274747": "135e11ec2055a23e19a016c85b7fb8d8",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/38/7dfa2a8919ee2013a9853c6804f9f765829966": "d427c4ced4d893caae8730714338bd9e",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/5b/0e53edf6f2d86c78af1e5a1105dbfadc93df0d": "bc69fd6b5f9488949c7dbb0ec2c5b972",
".git/objects/5b/6ff8c6c194ca6faeeaef5db934f38e962d3f5a": "5d3157772669e7eca3d42a141b3b7f7d",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/6c/9303e102406cc7053beb3acc684c0f188b9166": "a75a6a2f8a904321e0464eb805f87cd2",
".git/objects/97/c91187ce1d9bf0d263c99fcb42378ba655f0e0": "d225fcd7eb5dadc21570dd4335756411",
".git/objects/90/7b96828cdd5ff6d00f00b13014bf09d1488a7d": "132cd90773723c247728035827736df9",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d4/b4efeea0a701e14e2d41ce38bae04f2101d936": "f2d8ae6fe8ed6a083f87278450fece04",
".git/objects/aa/9033a801f73539a025d9f4012fa823c27ff3b1": "6489b5eb717a3de0e8081066d4570d80",
".git/objects/af/0344d79b3508c5ae792355e7ddac6097706248": "ce306dbd52fab9c1db00d01247d1fb9a",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/ef/ddc83415f34cb2ca66704126323cca45d43981": "b656859c40b233f704bed382b7882445",
".git/objects/e6/eb8f689cbc9febb5a913856382d297dae0d383": "466fce65fb82283da16cdd7c93059ff3",
".git/objects/f0/ba47991efc5293ae689a836b44924c2720a736": "5cc082302944cae04058ea7b3480d345",
".git/objects/c5/dfdb7679899c895750b30e858988c4e194970f": "3fb85d43ae8865a371ac8485e2715610",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/cb/408b43a220f992bfb8fea219f4ef750eb17e1b": "bf30a7938495230bc2859c84e7490145",
".git/objects/cb/f44db93188aa3f540453461f19b1f355e8f7f8": "f066f0813d8c013a38687ef90bc43207",
".git/objects/24/344d0c9e7a3bc6c60e64519f08396526b226c3": "5a6fb7a0eebb33765aefab949e0129cf",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/71/1a7ede736e23f8a38049cfdfe7d160ae45c76c": "ddb752a7f2e16abb900bac6c5253aece",
".git/objects/40/aa2110e855c9eaeabccccded362b5217bdfbcc": "ecab1e8f6bb6be95fd9a6901b1d7713c",
".git/objects/47/6d2eef39e431f4d1172f17edfb659bda1755be": "112fbb41e262f60ea2cf89b662981268",
".git/objects/14/3ebea8ff079e6892e2cb3f90c88a48c04c04b1": "b2c964411fd64bc1a9baadb08ac74a3c",
".git/objects/22/f71115b0a158de7818582bd6fa03efbda5b69a": "a7fe2fccd8eb17ff999535a25d2f080d",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "41e5ae856670f1431cfac1559d2c13cf",
".git/logs/refs/heads/main": "41e5ae856670f1431cfac1559d2c13cf",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "e0b1f77e2c0ffedf27320e52d80a7450",
".git/index": "c246a4f54a6ed14619aac8ee72781d48",
".git/COMMIT_EDITMSG": "1520be3c61253278c7ee6a9006ec81b5",
"assets/NOTICES": "c0d7e171e51dd5e4721dd8a5730d254b",
"assets/FontManifest.json": "934dfc072b21f96b6d72d90c0f64306e",
"assets/AssetManifest.bin.json": "361a6d0fbaf899ef72ad4190ea092475",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/AssetManifest.bin": "1f5094d0bbff620d21929e3a6fd3ec29",
"assets/fonts/MaterialIcons-Regular.otf": "ec236012ea002ddbb10c0ace07a57b2d",
"assets/assets/images/no_locations_found.png": "ce1c0029c72c6d2a1e3dfb76a593f5e5",
"assets/assets/images/empty_favorites.png": "dc582807b868399942acc23ac27ba4a9",
"assets/assets/images/camping_image.png": "e530c65f7378981287a80e6c43c8a3cc",
"assets/assets/images/charity_splash_image.png": "d00a43e24b43e40adec24daf521d072d",
"assets/assets/images/placeholder.jpg": "22db9e4dfa4bd3951aa9bd632e25988d",
"assets/assets/images/error_image.png": "95111ee24b12cceaa12a51592daf8f7c",
"assets/assets/images/sign_in_image.png": "5fb6ce3cff943792d314f8e52a359a7e",
"assets/assets/fonts/Montserrat-Medium.ttf": "b3ba703c591edd4aad57f8f4561a287b",
"assets/assets/fonts/Montserrat-Light.ttf": "e65ae7ed560da1a63db603bd8584cfdb",
"assets/assets/fonts/Montserrat-Bold.ttf": "1f023b349af1d79a72740f4cc881a310",
"assets/assets/fonts/Montserrat-SemiBold.ttf": "fb428a00b04d4e93deb4d7180814848b",
"assets/assets/fonts/Montserrat-Black.ttf": "9c1278c56276b018109f295c1a751a69",
"assets/assets/fonts/Montserrat-Regular.ttf": "3fe868a1a9930b59d94d2c1d79461e3c",
"assets/assets/animations/thief.json": "511f4c8d95d1d71f2ee3457beeccf592",
"assets/assets/animations/cherry.json": "e0bd709ff2b98a0b9ede359433749b71",
"assets/assets/animations/search.json": "10b8e00790d54728aa97f3bda7dc8076",
"assets/assets/animations/loading_sights.json": "7fa6fd28695025f3cdb2db21dcc3d2b6",
"assets/assets/animations/signed_in.json": "cd99f78dc1df9069b47c8cf20d51b0db",
"assets/assets/animations/heart.json": "1cf60eb7c31e75d56ad0138d7ac24217",
"assets/assets/animations/loading_dots.json": "f7faeb627cc8b675d7f314a172a5700e",
"assets/assets/animations/badge.json": "463e41e6dadbcfa2c787cc1b839265d7",
"assets/assets/animations/profile.json": "9d2d7487121a57604ab75040f92911ac",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
