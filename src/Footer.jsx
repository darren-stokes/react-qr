export default function Footer() {
    return (
        <footer>
            <p>
                &copy; {new Date().getFullYear()} React QR Code App. All rights reserved.
                {' '}<a href="http://hello.127.0.0.1.nip.io/" target="_blank" rel="noreferrer">Docs</a>
            </p>
        </footer>
    );
}