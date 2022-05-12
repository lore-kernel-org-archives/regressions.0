Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E183A17D2
	for <regressions@lists.linux.dev>; Thu, 12 May 2022 06:24:05 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1np2F0-0003ty-1P; Thu, 12 May 2022 08:24:02 +0200
Message-ID: <d66ec3a0-10b4-fd60-0b03-e9a3f3571645@leemhuis.info>
Date: Thu, 12 May 2022 08:24:00 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Jim Quinlan <jim2101024@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Cyril Brulebois <kibi@debian.org>, Nicolas Saenz Julienne
 <nsaenz@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
 regressions@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>
References: <20220511201856.808690-1-helgaas@kernel.org>
 <20220511201856.808690-2-helgaas@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH 1/4] Revert "PCI: brcmstb: Do not turn off WOL regulators
 on suspend"
In-Reply-To: <20220511201856.808690-2-helgaas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1652336646;91a4093b;
X-HE-SMSGID: 1np2F0-0003ty-1P

On 11.05.22 22:18, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This reverts commit 11ed8b8624b8085f706864b4addcd304b1e4fc38.
> 
> This is part of a revert of the following commits:
> 
>   11ed8b8624b8 ("PCI: brcmstb: Do not turn off WOL regulators on suspend")
>   93e41f3fca3d ("PCI: brcmstb: Add control of subdevice voltage regulators")
>   67211aadcb4b ("PCI: brcmstb: Add mechanism to turn on subdev regulators")
>   830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup() into two funcs")
> 
> Cyril reported that 830aa6f29f07 ("PCI: brcmstb: Split brcm_pcie_setup()
> into two funcs"), which appeared in v5.17-rc1, broke booting on the
> Raspberry Pi Compute Module 4.  Apparently 830aa6f29f07 panics with an
> Asynchronous SError Interrupt, and after further commits here is a black
> screen on HDMI and no output on the serial console.
> 
> This does not seem to affect the Raspberry Pi 4 B.
> 
> Reported-by: Cyril Brulebois <kibi@debian.org>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=215925

A "Bugzilla" tag? Why don't you just use a proper "Link:" tag, as
explained by the documentation to use in this case (I clarified the docs
recently with regards to this). Such inventions (some people use
"References:", others "BugLink:" and there were a few others I already
forget about) make my regression tracking efforts hard. :-/

Side note: Linus in the past few days two times reminded people to use
proper Link: tags, but that was in a totally different context (when
there was no link at all or just a Link: pointing to the submission of a
patch)

> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

> [...]

Ciao, Thorsten
