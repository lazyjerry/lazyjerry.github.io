
**URL:** https://www.microsoft.com/en-us/security/blog/2026/04/01/mitigating-the-axios-npm-supply-chain-compromise/

---

Skip to content
Skip to content
Microsoft
Microsoft Security
Why Microsoft Security Solutions Products Pricing More
All Microsoft
Light
Dark
Home
Mitigating the Axios npm supply chain compromise
Search
Research 
April 1 
16 min read
Mitigating the Axios npm supply chain compromise
By Microsoft Threat Intelligence and Microsoft Defender Security Research Team
Listen to this post
0:00
0:00
/
0:00
1X
Powered by Microsoft Copilot
SHARE
TAGS
Linux
macOS
Sleet
more
In this article
Analysis of the attack
Mitigation and protection guidance
Microsoft Defender detections
Indicators of compromise
Hunting queries

On March 31, 2026, two new npm packages for updated versions of Axios, a popular HTTP client for JavaScript that simplifies making HTTP requests to a REST endpoint with over 70 million weekly downloads, were identified as malicious. These versions (1.14.1 and 0.30.4) were injected with a malicious dependency to download payloads from known actor command and control (C2). Microsoft Threat Intelligence has attributed this infrastructure and the Axios npm compromise to Sapphire Sleet, a North Korean state actor.

Following successful connection to the malicious C2, a second-stage remote access trojan (RAT) payload was automatically deployed based on the operating system of the compromised device, including macOS, Windows, and Linux. This activity follows the pattern of recent high-profile supply chain attacks, where other adversaries poison widely adopted open-source frameworks and their distribution channels to achieve broad downstream impact.

Users who have installed Axios version 1.14.1 or 0.30.4 should rotate their secrets and credentials immediately and downgrade to a safe version (1.14.0 or 0.30.3). Users should also follow the mitigation and protection guidance provided in this blog, including disabling auto-updates for Axios npm packages, since the malicious payload includes a hook that will continue to attempt to update.

This blog shares Microsoft Threat Intelligence’s findings from our analysis, Microsoft Defender detections in place that alerted and protected our customers, additional protections we have implemented in our products to detect and block malicious components, and suggested mitigations for organizations to prevent further compromise.

Analysis of the attack

On March 31, 2026, two malicious versions of Axios npm packages were released. These packages connected to a known malicious domain (C2) owned by Sapphire Sleet to retrieve a second-stage remote access trojan (RAT). Since Axios packages are commonly auto-updated, any projects with Axios versions higher than axios@^1.14.0 or axios@^0.30.0 connected to this Sapphire Sleet C2 upon installation and downloaded second-stage malware. Windows, macOS, and Linux systems are all targeted with platform-specific payloads.

Microsoft Threat Intelligence has determined the account that created the plain-crypto-js package is associated with Sapphire Sleet infrastructure. That account has been disabled.

Silent install-time code execution using dependency insertion

The updated versions of Axios inject plain-crypto-js@4.2.1, a fake runtime dependency that executes automatically through post-install with no user interaction required. The trusted package’s application logic is not modified; instead, the threat actor added a dependency that is never imported by the package’s runtime code but only exists to trigger an install-time script to download the second-stage RAT. That means normal app behavior might remain unchanged while malicious activity occurs during npm installation or npm update on developer endpoints and continuous integration and continuous delivery (CI/CD) systems.
