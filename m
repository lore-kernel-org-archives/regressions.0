Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD6322B
	for <regressions@lists.linux.dev>; Mon, 13 Mar 2023 17:32:25 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pbm22-0004ev-Qp; Mon, 13 Mar 2023 18:32:22 +0100
Message-ID: <f96431ee-abc0-ff76-3963-c45d3b092840@leemhuis.info>
Date: Mon, 13 Mar 2023 18:32:22 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [REGRESSION] kbl-r5514-5663-max hdmi no longer working
Content-Language: en-US, de-DE
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Jason Montleon <jmontleo@redhat.com>, stable@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mark Brown <broonie@kernel.org>, Alsa-devel <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAJD_bPKQdtaExvVEKxhQ47G-ZXDA=k+gzhMJRHLBe=mysPnuKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678728746;c446ae62;
X-HE-SMSGID: 1pbm22-0004ev-Qp

[adding a push of people and lists to the recipients that dealt with the
culprit; leaving the stable list in CC for now, even if this is a
mainline issue (apart from the backport of the culprit to 5.10.y Takashi
asked for a while ago)]

On 13.03.23 17:34, Jason Montleon wrote:
> It looks like HDMI audio stopped working in 5.17-rc1. I ran a bisect
> which points to 636110411ca726f19ef8e87b0be51bb9a4cdef06.

FWIW, that's "ASoC: Intel/SOF: use set_stream() instead of
set_tdm_slots() for HDAudio" from Pierre-Louis Bossart.

> I built
> 5.17.14 with it reverted and it restored HDMI output, but it doesn't
> revert cleanly from 5.18 onward.
> 
>>From what I can tell it looks like -ENOTSUPP is returned from
> snd_soc_dai_set_stream for hdmi1 and hdmi2 now. I'm not sure if that's
> expected, but I made the following change and I have working HDMI
> audio now. https://gist.github.com/jmontleon/4780154c309f956d97ca9a304a00da3f

Thanks for the report and the patch. I CCed the relevant people for this.

[TLDR For the rest of the mail: : I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form. See link in footer if these mails annoy you.]

To be sure the issue doesn't fall through the cracks unnoticed, I'm
adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced 636110411ca726f19ef8e87b0be51bb9a4cdef06
#regzbot title alsa/asoc: kbl-r5514-5663-max hdmi stopped working
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
