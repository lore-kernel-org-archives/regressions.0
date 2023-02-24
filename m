Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8746D6FBB
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 16:15:10 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pVair-0005aa-Or; Fri, 24 Feb 2023 17:15:01 +0100
Message-ID: <1209941d-a3cb-6eb3-4fb7-0e09a8c32197@leemhuis.info>
Date: Fri, 24 Feb 2023 17:15:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Fwd: nvmem-cells regression after adding 'call
 of_platform_populate() for MTD partitions'
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Maxim Kiselev <bigunclemax@gmail.com>, linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxim Kochetkov <fido_max@inbox.ru>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
References: <CALHCpMgSZOZdOGpLwTYf0sFD5EMNL7CuqHuFJV_6w5VPSWZnUw@mail.gmail.com>
 <CALHCpMgEZjnR39upkR6iozSk-b5A_GHRo9rcDSPXzzQi6x_qCw@mail.gmail.com>
 <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <b1b7935d-0785-2e57-bad9-ab2476f0acf2@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677255310;42ff4e47;
X-HE-SMSGID: 1pVair-0005aa-Or

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Link: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 10.12.22 13:35, Thorsten Leemhuis wrote:
> [...]
> P.P.S.: let me add this to the regression tracking:
> 
> #regzbot ^introduced bcdf0315
> #regzbot title mtd: ethernet device can't be probed anymore due to
> broken nvmem-cells dep
> #regzbot monitor: https://lore.kernel.org/all/Yyj7wJlqJkCwObRn@lx2k/
> #regzbot ignore-activity

#regzbot fix: mtd: mtdpart: Don't create platform device that'll never probe
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

