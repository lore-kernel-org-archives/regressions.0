Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C428EA
	for <regressions@lists.linux.dev>; Sun,  2 Apr 2023 10:26:16 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1piuuY-00040N-5h; Sun, 02 Apr 2023 12:26:10 +0200
Message-ID: <293df61a-1ea8-daa9-2606-e8fad3e71d1f@leemhuis.info>
Date: Sun, 2 Apr 2023 12:26:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [BUG] net, pci: 6.3-rc1-4 hangs during boot on PowerEdge R620
 with igb
Content-Language: en-US, de-DE
To: Donald Hunter <donald.hunter@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, netdev@vger.kernel.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <m2fs9lgndw.fsf@gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <m2fs9lgndw.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680431176;bdb4e3b4;
X-HE-SMSGID: 1piuuY-00040N-5h

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 31.03.23 13:40, Donald Hunter wrote:
> The 6.3-rc1 and later release candidates are hanging during boot on our
> Dell PowerEdge R620 servers with Intel I350 nics (igb).
> 
> After bisecting from v6.2 to v6.3-rc1, I isolated the problem to:
> 
> [6fffbc7ae1373e10b989afe23a9eeb9c49fe15c3] PCI: Honor firmware's device
> disabled status
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 6fffbc7ae1373e10b989afe23a9eeb9c49fe15c3
#regzbot title pci: / net: igb: hangs during boot on PowerEdge R620
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
