"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const video = document.getElementById('video');
const MEDIA_CONSTRAINTS = {
    audio: false,
    video: true,
};
function getMedia(constraints) {
    return __awaiter(this, void 0, void 0, function* () {
        let stream = null;
        try {
            stream = yield navigator.mediaDevices.getUserMedia(constraints);
            /* use the stream */
            // video.srcObject = stream;
        }
        catch (err) {
            /* handle the error */
        }
    });
}
window.addEventListener('load', () => getMedia(MEDIA_CONSTRAINTS));