Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8327E3
	for <regressions@lists.linux.dev>; Sun, 14 May 2023 12:10:47 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pyAYl-0000pA-UA; Sun, 14 May 2023 14:10:43 +0200
Message-ID: <ce0b54a6-807c-4afc-279e-022fc9ecaa7e@leemhuis.info>
Date: Sun, 14 May 2023 14:10:43 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Content-Language: en-US, de-DE
To: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, mairacanal@riseup.net,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684066247;da62e5ab;
X-HE-SMSGID: 1pyAYl-0000pA-UA

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 12.05.23 15:20, Linus Walleij wrote:
> Sorry for late regression detection but this patch regresses
> the Integrator AB IMPD-1 graphics, I bisected down to this
> patch.
> 
> On Mon, Jan 2, 2023 at 12:30 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> [...]
> Before this patch:
> 
> [drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
> drm-clcd-pl111 c1000000.display: [drm] requested bpp 16, scaled depth down to 15
> drm-clcd-pl111 c1000000.display: enable IM-PD1 CLCD connectors
> Console: switching to colour frame buffer device 80x30
> drm-clcd-pl111 c1000000.display: [drm] fb0: pl111drmfb frame buffer device
> 
> After this patch:
> 
> [drm] Initialized pl111 1.0.0 20170317 for c1000000.display on minor 0
> drm-clcd-pl111 c1000000.display: [drm] bpp/depth value of 16/16 not supported
> drm-clcd-pl111 c1000000.display: [drm] No compatible format found
> drm-clcd-pl111 c1000000.display: [drm] *ERROR* fbdev: Failed to setup
> generic emulation (ret=-12)
> 
> It seems the bpp downscaling stopped to work? [...]

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced 37c90d589dc
#regzbot title drm/fb-helper: downscaling apparently stopped to work
with pl110_impd1
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

