import React, { useState, useEffect } from 'react';
import { Container, TextField, Button, CircularProgress } from '@mui/material';
import { backend } from 'declarations/backend';

const App: React.FC = () => {
  const [markdown, setMarkdown] = useState('');
  const [formattedMarkdown, setFormattedMarkdown] = useState('');
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const formatMarkdown = async () => {
      setLoading(true);
      try {
        const result = await backend.formatMarkdown(markdown);
        setFormattedMarkdown(result);
      } catch (error) {
        console.error('Error formatting markdown:', error);
      }
      setLoading(false);
    };

    const timeoutId = setTimeout(formatMarkdown, 500);
    return () => clearTimeout(timeoutId);
  }, [markdown]);

  const handleDownload = async () => {
    setLoading(true);
    try {
      const html = await backend.downloadHTML(markdown);
      const blob = new Blob([html], { type: 'text/html' });
      const url = URL.createObjectURL(blob);
      const a = document.createElement('a');
      a.href = url;
      a.download = 'formatted_markdown.html';
      document.body.appendChild(a);
      a.click();
      document.body.removeChild(a);
      URL.revokeObjectURL(url);
    } catch (error) {
      console.error('Error downloading HTML:', error);
    }
    setLoading(false);
  };

  return (
    <Container maxWidth="lg" className="mt-8">
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div>
          <TextField
            fullWidth
            multiline
            rows={20}
            variant="outlined"
            value={markdown}
            onChange={(e) => setMarkdown(e.target.value)}
            placeholder="Enter your Markdown here..."
          />
        </div>
        <div className="bg-white p-4 rounded-md shadow">
          <pre className="whitespace-pre-wrap">
            {formattedMarkdown}
          </pre>
        </div>
      </div>
      <div className="mt-4 flex justify-end">
        <Button
          variant="contained"
          color="primary"
          onClick={handleDownload}
          disabled={loading}
          className="mr-2"
        >
          {loading ? <CircularProgress size={24} /> : 'Download HTML'}
        </Button>
      </div>
    </Container>
  );
};

export default App;