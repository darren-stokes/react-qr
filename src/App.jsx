import Footer from './Footer.jsx';
import './App.css';

export default function App() {
  return (
    <main>
      <h1>Welcome to the React QR Code App 🚀</h1>
      <p>This app generates QR codes for various purposes.</p>
      <p>Running on K8s, served by Caddy.</p>

      <Footer />
    </main>
  );
}