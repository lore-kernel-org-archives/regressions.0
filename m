Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A49E10E4
	for <regressions@lists.linux.dev>; Tue,  2 May 2023 11:45:01 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ptoRG-00042P-Tx; Tue, 02 May 2023 13:44:58 +0200
Message-ID: <1efbf587-e7b5-74a3-89e4-ca70386bd191@leemhuis.info>
Date: Tue, 2 May 2023 13:44:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: PROBLEM: AMD Ryzen 9 7950X iGPU - Blinking Issue
Content-Language: en-US, de-DE
To: Felix Richter <judge@felixrichter.tech>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <46a7eb80-5f09-4f6a-4fd3-9550dafd497c@felixrichter.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1683027901;f41c8c40;
X-HE-SMSGID: 1ptoRG-00042P-Tx

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 30.04.23 13:44, Felix Richter wrote:
> Hi,
> 
> I am running into an issue with the integrated GPU of the Ryzen 9 7950X. It seems to be a regression from kernel version 6.1 to 6.2. 
> The bug materializes in from of my monitor blinking, meaning it turns full white shortly. This happens very often so that the system becomes unpleasant to use.
> 
> I am running the Archlinux Kernel:
> The Issue happens on the bleeding edge kernel: 6.2.13
> Switching back to the LTS kernel resolves the issue: 6.1.26
> 
> I have two monitors attached to the system. One 42 inch 4k Display and a 24 inch 1080p Display and am running sway as my desktop.
> 
> Let me know if there is more information I could provide to help narrow down the issue.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.1..v6.2
#regzbot title drm: amdgpu: system becomes unpleasant to use after
monitor starts blinking and turns full white
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
