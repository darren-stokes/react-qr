import {useEffect, useMemo, useRef, useState} from 'react';
import QRCode from 'qrcode';

export default function QrGenerator() {
    const [text, setText] = useState('https://example.com');
    const [size, setSize] = useState(256);
    const [ecc, setEcc] = useState('M');
    const canvasRef = useRef(null);

    const opts = useMemo(() => ({
        width: size,
        margin: 2,
        errorCorrectionLevel: ecc,
        color: {
            dark: '#000000',
            light: '#ffffff'
        }
    }), [size, ecc]);

    useEffect(() => {
        const canvas = canvasRef.current;
        if (!canvas) return;
            // Render QR to the canvas
            QRCode.toCanvas(canvas, text || ' ', opts).catch(console.error);
        }, [text, opts]);

}