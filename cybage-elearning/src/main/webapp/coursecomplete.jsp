<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Your Certificate for Cybage e-Learning</title>
  
    <link rel="favicon" href="media/favicon.ico">
</head>
<body>
<header>
        <img src="media/cyb1.png" alt="Cybage e-Learning">
        <h4>Get your certificate of subscription to</h4>
        <h1> <a href="https://www.youtube.com/channel/UCUwURiBONxHJw1vdxU_RGkw" target="_blank"
                rel="noopener noreferrer">Cybage e-Learning</a></h1>
    </header>
    <main>

        <label for="name">Type Your Name</label>
        <input required type="text" name="Name" autocomplete="name" placeholder="" id="name" minlength="3"
            maxlength="25">
        <Button id="submitBtn">Get Certificate</Button>


    </main>
    <script src="https://unpkg.com/pdf-lib@1.4.0"></script>
<!--      <script src="./FileSaver.js"></script> -->
<script>
(function (global, factory) {
    if (typeof define === "function" && define.amd) {
      define([], factory);
    } else if (typeof exports !== "undefined") {
      factory();
    } else {
      var mod = {
        exports: {}
      };
      factory();
      global.FileSaver = mod.exports;
    }
  })(this, function () {
    "use strict";
  
    /*
    * FileSaver.js
    * A saveAs() FileSaver implementation.
    *
    * By Eli Grey, http://eligrey.com
    *
    * License : https://github.com/eligrey/FileSaver.js/blob/master/LICENSE.md (MIT)
    * source  : http://purl.eligrey.com/github/FileSaver.js
    */
    // The one and only way of getting global scope in all environments
    // https://stackoverflow.com/q/3277182/1008999
    var _global = typeof window === 'object' && window.window === window ? window : typeof self === 'object' && self.self === self ? self : typeof global === 'object' && global.global === global ? global : void 0;
  
    function bom(blob, opts) {
      if (typeof opts === 'undefined') opts = {
        autoBom: false
      };else if (typeof opts !== 'object') {
        console.warn('Deprecated: Expected third argument to be a object');
        opts = {
          autoBom: !opts
        };
      } // prepend BOM for UTF-8 XML and text/* types (including HTML)
      // note: your browser will automatically convert UTF-16 U+FEFF to EF BB BF
  
      if (opts.autoBom && /^\s*(?:text\/\S*|application\/xml|\S*\/\S*\+xml)\s*;.*charset\s*=\s*utf-8/i.test(blob.type)) {
        return new Blob([String.fromCharCode(0xFEFF), blob], {
          type: blob.type
        });
      }
  
      return blob;
    }
  
    function download(url, name, opts) {
      var xhr = new XMLHttpRequest();
      xhr.open('GET', url);
      xhr.responseType = 'blob';
  
      xhr.onload = function () {
        saveAs(xhr.response, name, opts);
      };
  
      xhr.onerror = function () {
        console.error('could not download file');
      };
  
      xhr.send();
    }
  
    function corsEnabled(url) {
      var xhr = new XMLHttpRequest(); // use sync to avoid popup blocker
  
      xhr.open('HEAD', url, false);
  
      try {
        xhr.send();
      } catch (e) {}
  
      return xhr.status >= 200 && xhr.status <= 299;
    } // `a.click()` doesn't work for all browsers (#465)
  
  
    function click(node) {
      try {
        node.dispatchEvent(new MouseEvent('click'));
      } catch (e) {
        var evt = document.createEvent('MouseEvents');
        evt.initMouseEvent('click', true, true, window, 0, 0, 0, 80, 20, false, false, false, false, 0, null);
        node.dispatchEvent(evt);
      }
    } // Detect WebView inside a native macOS app by ruling out all browsers
    // We just need to check for 'Safari' because all other browsers (besides Firefox) include that too
    // https://www.whatismybrowser.com/guides/the-latest-user-agent/macos
  
  
    var isMacOSWebView = /Macintosh/.test(navigator.userAgent) && /AppleWebKit/.test(navigator.userAgent) && !/Safari/.test(navigator.userAgent);
    var saveAs = _global.saveAs || ( // probably in some web worker
    typeof window !== 'object' || window !== _global ? function saveAs() {}
    /* noop */
    // Use download attribute first if possible (#193 Lumia mobile) unless this is a macOS WebView
    : 'download' in HTMLAnchorElement.prototype && !isMacOSWebView ? function saveAs(blob, name, opts) {
      var URL = _global.URL || _global.webkitURL;
      var a = document.createElement('a');
      name = name || blob.name || 'download';
      a.download = name;
      a.rel = 'noopener'; // tabnabbing
      // TODO: detect chrome extensions & packaged apps
      // a.target = '_blank'
  
      if (typeof blob === 'string') {
        // Support regular links
        a.href = blob;
  
        if (a.origin !== location.origin) {
          corsEnabled(a.href) ? download(blob, name, opts) : click(a, a.target = '_blank');
        } else {
          click(a);
        }
      } else {
        // Support blobs
        a.href = URL.createObjectURL(blob);
        setTimeout(function () {
          URL.revokeObjectURL(a.href);
        }, 4E4); // 40s
  
        setTimeout(function () {
          click(a);
        }, 0);
      }
    } // Use msSaveOrOpenBlob as a second approach
    : 'msSaveOrOpenBlob' in navigator ? function saveAs(blob, name, opts) {
      name = name || blob.name || 'download';
  
      if (typeof blob === 'string') {
        if (corsEnabled(blob)) {
          download(blob, name, opts);
        } else {
          var a = document.createElement('a');
          a.href = blob;
          a.target = '_blank';
          setTimeout(function () {
            click(a);
          });
        }
      } else {
        navigator.msSaveOrOpenBlob(bom(blob, opts), name);
      }
    } // Fallback to using FileReader and a popup
    : function saveAs(blob, name, opts, popup) {
      // Open a popup immediately do go around popup blocker
      // Mostly only available on user interaction and the fileReader is async so...
      popup = popup || open('', '_blank');
  
      if (popup) {
        popup.document.title = popup.document.body.innerText = 'downloading...';
      }
  
      if (typeof blob === 'string') return download(blob, name, opts);
      var force = blob.type === 'application/octet-stream';
  
      var isSafari = /constructor/i.test(_global.HTMLElement) || _global.safari;
  
      var isChromeIOS = /CriOS\/[\d]+/.test(navigator.userAgent);
  
      if ((isChromeIOS || force && isSafari || isMacOSWebView) && typeof FileReader !== 'undefined') {
        // Safari doesn't allow downloading of blob URLs
        var reader = new FileReader();
  
        reader.onloadend = function () {
          var url = reader.result;
          url = isChromeIOS ? url : url.replace(/^data:[^;]*;/, 'data:attachment/file;');
          if (popup) popup.location.href = url;else location = url;
          popup = null; // reverse-tabnabbing #460
        };
  
        reader.readAsDataURL(blob);
      } else {
        var URL = _global.URL || _global.webkitURL;
        var url = URL.createObjectURL(blob);
        if (popup) popup.location = url;else location.href = url;
        popup = null; // reverse-tabnabbing #460
  
        setTimeout(function () {
          URL.revokeObjectURL(url);
        }, 4E4); // 40s
      }
    });
    _global.saveAs = saveAs.saveAs = saveAs;
  
    if (typeof module !== 'undefined') {
      module.exports = saveAs;
    }
  });
  </script>
    <script src="https://unpkg.com/pdf-lib/dist/pdf-lib.min.js"></script>
    <script src="https://unpkg.com/@pdf-lib/fontkit@0.0.4"></script>
<!--     <script src="./index.js"></script> -->
<script>
const userName = document.getElementById("name");
const submitBtn = document.getElementById("submitBtn");

const {PDFDocument, rgb, degrees}= PDFLib;


const capitalize = (str, lower = false) =>
  (lower ? str.toLowerCase() : str).replace(/(?:^|\s|["'([{])+\S/g, (match) =>
    match.toUpperCase()
  );

submitBtn.addEventListener("click", ()=> {
  const val = capitalize(userName.value);

  //check if the text is empty or not
  if (val.trim() !== "" && userName.checkValidity()) {
    // console.log(val);
    generatePDF(val);
  } else {
    userName.reportValidity();
  }
});

const generatePDF = async (name) => {
  const existingPdfBytes = await fetch("./cert.pdf").then((res) =>
    res.arrayBuffer()
  );

  // Load a PDFDocument from the existing PDF bytes
  const pdfDoc = await PDFDocument.load(existingPdfBytes);
  pdfDoc.registerFontkit(fontkit);

  //get font
  const fontBytes = await fetch("media/Sanchez-Regular.ttf").then((res) =>
    res.arrayBuffer()
  );

  // Embed our custom font in the document
  const SanChezFont = await pdfDoc.embedFont(fontBytes);

  // Get the first page of the document
  const pages = pdfDoc.getPages();
  const firstPage = pages[0];

  // Draw a string of text diagonally across the first page
  firstPage.drawText(name, {
    x: 135,
    y: 270,
    size: 40,
    font: SanChezFont,
    color: rgb(0,0,0),
  });

  // Serialize the PDFDocument to bytes (a Uint8Array)
  const pdfBytes = await pdfDoc.save();
  console.log("Done creating");

  // this was for creating uri and showing in iframe

  // const pdfDataUri = await pdfDoc.saveAsBase64({ dataUri: true });
  // document.getElementById("pdf").src = pdfDataUri;

  var file = new File(
    [pdfBytes],
    "Cybage e-Learning.pdf",
    {
      type: "application/pdf;charset=utf-8",
    }
  );
saveAs(file);
};

// init();
</script>


   
</body>

<style>
:root {
  --dark-color: #212121;
}

body {
  font-family: system-ui;
  text-align: center;
  margin-top: 40px;
  font-size: 1.5em;
}

h4 {
  font-weight: normal;
  margin-bottom: 5px;
}
h1 {
  font-weight: normal;
  margin-top: 0;
  margin-bottom: 40px;
  font-size: 2em;
}

img {
  border-radius: 150%;
  height: 120px;
}

main {
  display: flex;
  flex-direction: column;
  align-items: center;
}
main * {
  margin-bottom: 12px;
}

input {
  text-align:left;
  font-size:medium;
  outline: none;
  border: none;
  border-bottom: 1px solid black;
  text-transform: capitalize;
}

/* for styling the autocomplete style */
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active {
  transition: background-color 5000s ease-in-out 0s;
  -webkit-text-fill-color: var(--dark-color) !important;
}


button {
  background: #8bc34a;
  color: #fff;
  border: none;
  font-size: 0.8em;
  padding: 5px 15px;
  margin: 20px;
  border-radius: 5px;
  cursor: pointer;
}
a {
  color: #6492f6;
}

/* dark mode css */
@media (prefers-color-scheme: dark) {
  body {
    background: var(--dark-color);
    color: #fff;
  }
  input,
  input:active {
    background: var(--dark-color);
    border-color: #fff;
    color: #fff;
  }

  /* for styling the autocomplete style */
  input:-webkit-autofill,
  input:-webkit-autofill:hover,
  input:-webkit-autofill:focus,
  input:-webkit-autofill:active {
    transition: background-color 5000s ease-in-out 0s;
    -webkit-text-fill-color: #fff !important;
  }
}

</style>
</html>
