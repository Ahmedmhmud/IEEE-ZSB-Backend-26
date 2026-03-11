# UniCore Research Questions

---

## 1. GET vs POST

| | GET | POST |
|---|---|---|
| Data location | Appended to URL (`?name=ahmed`) | Sent in the request body |
| Visible in browser | Yes (URL bar, history, logs) | No |
| Bookmarkable | Yes | No |
| Data size limit | Yes (~2000 chars) | No practical limit |
| Use case | Searching, filtering | Submitting sensitive data |

**Critical security difference:** GET exposes submitted data in the URL, so passwords and personal info are visible to anyone looking at the browser history, server logs, or a shoulder-surfer. POST hides the data in the request body.

**For `register.html`:** Always use `method="POST"` — it prevents passwords and personal details from appearing in the URL or browser history.

---

## 2. Semantic HTML

Using only `<div>` tags works visually, but semantic tags like `<header>`, `<main>`, `<section>`, and `<footer>` are better because:

- **Accessibility** — screen readers understand the page structure and can navigate it properly for visually impaired users.
- **SEO** — search engines rank pages higher when they can correctly identify headings, main content, and sections.
- **Readability** — other developers (and future you) can read the code and instantly understand the layout without guessing what each `<div>` is for.
- **Browser defaults** — browsers apply sensible default styles and behaviors to semantic elements.

> A `<div>` means nothing. A `<footer>` tells everyone — browsers, bots, and humans — exactly what it is.

---

## 3. The Request/Response Cycle

When you type `google.com` and press Enter:

1. **DNS Lookup** — Your browser asks a DNS (Domain Name System) server: *"What is the IP address for google.com?"* DNS is like a phone book that maps domain names to IP addresses.
2. **IP Address returned** — DNS responds with Google's IP, e.g. `142.250.185.46`.
3. **TCP Connection** — Your browser opens a connection to that IP on port 80 (HTTP) or 443 (HTTPS).
4. **HTTP Request sent** — The browser sends `GET / HTTP/1.1` to Google's server.
5. **Server responds** — Google's server sends back an HTTP response with status `200 OK` and the HTML content.
6. **Browser renders** — The browser parses the HTML, fetches linked CSS/JS/images, and displays the page.
