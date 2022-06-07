Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A507F
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 10:57:25 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nyWtn-0003kN-Bz; Tue, 07 Jun 2022 12:57:23 +0200
Message-ID: <6077d233-b0ea-f716-bf23-3fd6c16364af@leemhuis.info>
Date: Tue, 7 Jun 2022 12:57:22 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [REGRESSION] VGA output with AST 2600 graphics.
Content-Language: en-US
To: regressions@lists.linux.dev
References: <d84ba981-d907-f942-6b05-67c836580542@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <d84ba981-d907-f942-6b05-67c836580542@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1654599445;ad5053be;
X-HE-SMSGID: 1nyWtn-0003kN-Bz

Hi, this is your Linux kernel regression tracker.

On 01.06.22 11:33, Jocelyn Falempe wrote:
> 
> I've found a regression in the ast driver, for AST2600 hardware.
> 
> before the upstream commit f9bd00e0ea9d
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f9bd00e0ea9d9b04140aa969a9a13ad3597a1e4e
> 
> The ast driver handled AST 2600 chip like an AST 2500.
> 
> After this commit, it uses some default values, more like the older AST
> chip.

Thanks for the report.

To be sure below issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, my Linux kernel regression tracking bot:

#regzbot ^introduced f9bd00e0ea9d
#regzbot title drm/ast: VGA output blurred and flickered with whites
lines on AST2600
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replied to), as the kernel's
documentation call for; above page explains why this is important for
tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.


> There are a lot of places in the driver like this:
> https://elixir.bootlin.com/linux/v5.18.1/source/drivers/gpu/drm/ast/ast_post.c#L82
> 
> where it checks for (AST2300 || AST2400 || AST2500) but not for AST2600.
> 
> This makes the VGA output, to be blurred and flickered with whites lines
> on AST2600.
> 
> The issue is present since v5.11
> 
> For v5.11~v5.17 I propose a simple workaround (as there are no other
> reference to AST2600 in the driver):
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -146,7 +146,8 @@ static int ast_detect_chip(struct drm_device *dev,
> bool *need_post)
> 
>      /* Identify chipset */
>      if (pdev->revision >= 0x50) {
> -        ast->chip = AST2600;
> +        /* Workaround to use the same codepath for AST2600 */
> +        ast->chip = AST2500;
>          drm_info(dev, "AST 2600 detected\n");
>      } else if (pdev->revision >= 0x40) {
>          ast->chip = AST2500;
> 
> starting from v5.18, there is another reference to AST2600 in the code
> https://elixir.bootlin.com/linux/v5.18/source/drivers/gpu/drm/ast/ast_main.c#L212
> 
> 
> So I think someone with good aspeed knowledge should review all
> locations where there is a test for AST2500, and figure out what should
> be done for AST2600
> 
> Thanks,
> 
