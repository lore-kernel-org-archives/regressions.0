Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F4A14A97
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 13:33:22 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q4Lx2-0007HZ-RZ; Wed, 31 May 2023 15:33:20 +0200
Message-ID: <cb093081-ef71-c556-fe2f-9ec30bbcfe80@leemhuis.info>
Date: Wed, 31 May 2023 15:33:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: mlx5 driver is broken when pci_msix_can_alloc_dyn() is false with
 v6.4-rc4
Content-Language: en-US, de-DE
To: Niklas Schnelle <schnelle@linux.ibm.com>, Shay Drory <shayd@nvidia.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Eli Cohen <elic@nvidia.com>,
 netdev@vger.kernel.org
References: <d6ada86741a440f99b5d6fedff532c8dbe86254f.camel@linux.ibm.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <d6ada86741a440f99b5d6fedff532c8dbe86254f.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1685540003;ed6a9167;
X-HE-SMSGID: 1q4Lx2-0007HZ-RZ

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 30.05.23 15:04, Niklas Schnelle wrote:
> 
> With v6.4-rc4 I'm getting a stream of RX and TX timeouts when trying to
> use ConnectX-4 and ConnectX-6 VFs on s390. I've bisected this and found
> the following commit to be broken:
> 
> commit 1da438c0ae02396dc5018b63237492cb5908608d
> Author: Shay Drory <shayd@nvidia.com>
> Date:   Mon Apr 17 10:57:50 2023 +0300
> [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 1da438c0ae02396dc5018b63237492cb5908608d
#regzbot title net/mlx5: RX and TX timeouts with ConnectX-4 and
ConnectX-6 VFs on s390
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
