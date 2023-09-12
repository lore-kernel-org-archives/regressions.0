Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F086EA93B
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 11:14:41 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qg1Lr-00047D-Rj; Tue, 12 Sep 2023 13:14:39 +0200
Message-ID: <be21241b-7f59-419b-823f-a6d66adacc87@leemhuis.info>
Date: Tue, 12 Sep 2023 13:14:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.1.y Regression found on AM3517
Content-Language: en-US, de-DE
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux OMAP <linux-omap@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
References: <CAHCN7xJjK=BaNHa=+OKzOmFtNRYKX_APTp5Zj3g-X_iQcpyK6g@mail.gmail.com>
 <ZPZ2zTS9loj06u31@debian.me> <20230905061739.GX11676@atomide.com>
 <CAHCN7xJo=pJkcChHm9AsNQGCJuHXgpRKKRK9ckEwdk3U-41ukw@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAHCN7xJo=pJkcChHm9AsNQGCJuHXgpRKKRK9ckEwdk3U-41ukw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694517283;4d190abf;
X-HE-SMSGID: 1qg1Lr-00047D-Rj

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 06.09.23 12:59, Adam Ford wrote:
> On Tue, Sep 5, 2023 at 11:25 AM Tony Lindgren <tony@atomide.com> wrote:
>> * Bagas Sanjaya <bagasdotme@gmail.com> [230905 00:31]:
>>> On Mon, Sep 04, 2023 at 11:37:46AM -0500, Adam Ford wrote:
>>>> I have an AM3517-EVM board that I am trying to use the latest 6.1.y
>>>> stable, currently 6.1.51.
>>>>
>>>> With git bisect, I narrowed the regression between 6.1.15 and 6.1.16 to commit
>>>> eaf9b5612a47 ("driver core: fw_devlink: Don't purge child fwnode's
>>>> consumer links")
>>>>
>>>> In the regression, 48002000.scm appears as not ready.  This affects a
>>>> variety of dependent peripherals making them unavailable:
> [...]
> Indeed, it does appear that a patch was missing from the back-ported series.
> 
> Applying commit 4a032827daa8 ("of: property: Simplify
> of_link_to_phandle()") to the 6.1.y branch appears
> to fix the regression.
> 
> Thanks for the pointer to the series.
> 
> Stable group,
> 
> Do I need to send a separate e-mail requesting the backporting of that
> commit to the 6.1.y branch?

Stable team picked this up, hence:

#regzbot fix: of: property: Simplify of_link_to_phandle()
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

