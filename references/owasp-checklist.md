# Aegis OWASP coverage checklist

Check each item during the audit phase, or mark it not-applicable with a reason.

## Injection

- [ ] User input never reaches interpreters (SQL, shell, template engines) unescaped. Parameterized queries or safe APIs everywhere.
- [ ] No eval() or equivalent on user-controlled data.

## Cross-site scripting (XSS)

- [ ] All user-controlled output is escaped in HTML, attribute, and JS contexts.
- [ ] No inline event handlers with interpolated data.

## Sensitive data exposure

- [ ] No secrets, API keys, or credentials in client-side code or the repo.
- [ ] No sensitive data in URLs, logs, or error messages shown to users.

## Access control

- [ ] Every route and API endpoint checks authorization, not just authentication.
- [ ] No client-side-only access checks for sensitive actions.

## Security misconfiguration

- [ ] Security headers present: Content-Security-Policy, Strict-Transport-Security, X-Frame-Options (or frame-ancestors), X-Content-Type-Options.
- [ ] Debug modes, stack traces, and verbose errors disabled in production.
- [ ] No default credentials.

## Vulnerable dependencies

- [ ] npm audit shows no moderate or higher vulnerabilities.
- [ ] Dependencies pinned; no floating ranges pulling unreviewed code.

## Authentication and sessions (if the site has them)

- [ ] Passwords hashed with a proper algorithm (bcrypt, argon2, scrypt).
- [ ] Session tokens random, httpOnly, secure, sameSite.
- [ ] Rate limiting on login and other sensitive endpoints.
