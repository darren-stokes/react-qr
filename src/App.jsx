import Footer from './Footer.jsx';

export default function App() {
  return (
    <main style={{ textAlign: 'center', padding: '24px', fontFamily: 'system-ui,Avenir,Helvetica,Arial,sans-serif', color: '#ffffffde', fontWeight: '400' }}>
      <h1>Welcome to the React QR Code App 🚀</h1>
      <p>This app generates QR codes for various purposes.</p>
      <p>Running on K8s, served by Caddy.</p>

      <Footer />
    </main>
  );
}