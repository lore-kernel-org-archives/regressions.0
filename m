Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344781369
	for <regressions@lists.linux.dev>; Sun,  3 Sep 2023 06:25:27 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qcgY2-0002sn-0k; Sun, 03 Sep 2023 08:25:26 +0200
Message-ID: <862c9034-6e81-1780-31a3-3bee5f0d3dc7@leemhuis.info>
Date: Sun, 3 Sep 2023 08:25:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to 501126083855 ("fbdev/g364fb: Use
 fbdev I/O helpers")
Content-Language: en-US, de-DE
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <ZPDgdGBbxrTl+m2s@debian>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZPDgdGBbxrTl+m2s@debian>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693722328;451f73db;
X-HE-SMSGID: 1qcgY2-0002sn-0k

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 31.08.23 20:48, Sudip Mukherjee (Codethink) wrote:
> Hi All,
> 
> The latest mainline kernel branch fails to build mips jazz_defconfig with
> the error:
> 
> drivers/video/fbdev/g364fb.c:115:9: error: 'FB_DEFAULT_IOMEM_HELPERS' undeclared here (not in a function); did you mean 'FB_DEFAULT_IOMEM_OPS'?
>   115 |         FB_DEFAULT_IOMEM_HELPERS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~
>       |         FB_DEFAULT_IOMEM_OPS
> 
> 
> git bisect pointed to 501126083855 ("fbdev/g364fb: Use fbdev I/O helpers").
> 
> Reverting the commit has fixed the build failure.
> 
> I will be happy to test any patch or provide any extra log if needed.
> 
> #regzbot introduced: 5011260838551cefbf23d60b48c3243b6d5530a2
> 

#regzbot fix: 8df0f84c3bb921f5aa1036223dd932bbc7df6d
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

