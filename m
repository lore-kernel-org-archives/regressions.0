Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAABCC2FA
	for <regressions@lists.linux.dev>; Sat,  8 Apr 2023 11:27:08 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pl6ib-0007Dc-An; Sat, 08 Apr 2023 13:26:53 +0200
Message-ID: <b6e7abcf-499c-da4b-7249-749fa525a911@leemhuis.info>
Date: Sat, 8 Apr 2023 13:26:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 01/13] firmware/sysfb: Fix EFI/VESA format selection
To: Pierre Asselin <pa@panix.com>, tzimmermann@suse.de, mripard@kernel.org,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 jose.exposito89@gmail.com, javierm@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-2-tzimmermann@suse.de>
 <4Psm6B6Lqkz1QXM@panix3.panix.com>
Content-Language: en-US, de-DE
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <4Psm6B6Lqkz1QXM@panix3.panix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1680953228;7f98bbfb;
X-HE-SMSGID: 1pl6ib-0007Dc-An

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 06.04.23 17:45, Pierre Asselin wrote:
> Thomas Zimmermann <tzimmermann@suse.de> wrote:
> [...] 
> Starting at linux-6.3-rc1 my simplefb picks the wrong mode and garbles
> the display This is on a 16-year old i686 laptop.  I can post lshw or
> dmidecode output if it helps.
> [...] 
> I bisected it to f35cd3fa77293c2cd03e94b6a6151e1a7d9309cf
>     firmware/sysfb: Fix EFI/VESA format selection

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced f35cd3fa77293c2cd03e
#regzbot title firmware/sysfb: wrong mode and display garbled on 16-year
old i686 laptop
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
