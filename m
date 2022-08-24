Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E487E
	for <regressions@lists.linux.dev>; Wed, 24 Aug 2022 07:13:38 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oQkZy-0006rf-HJ; Wed, 24 Aug 2022 09:13:34 +0200
Message-ID: <c6ea56f5-05be-c9bb-4eda-a3c4a081326f@leemhuis.info>
Date: Wed, 24 Aug 2022 09:13:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [REGRESSION 5.19.x] AMD HD-audio devices missing on 5.19
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org
References: <874jy4cqok.wl-tiwai@suse.de>
To: regressions@lists.linux.dev
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <874jy4cqok.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661325218;221ebad2;
X-HE-SMSGID: 1oQkZy-0006rf-HJ

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker.

On 22.08.22 16:12, Takashi Iwai wrote:
> 
> we've received regression reports about the missing HD-audio devices
> on AMD platforms, and this turned out to be caused by the commit
> 512881eacfa72c2136b27b9934b7b27504a9efc2
>     bus: platform,amba,fsl-mc,PCI: Add device DMA ownership management
> 
> The details are found in openSUSE bugzilla:
>   https://bugzilla.suse.com/show_bug.cgi?id=1202492
> 
> The problem seems to be that HD-audio (both onboard analog and HDMI)
> PCI devices are assigned to the same IOMMU group as AMD graphics PCI
> device, and once after the AMDGPU is initialized beforehand, those
> audio devices can't be probed since iommu_device_use_default_domain()
> returns -EBUSY.
> 
> I'm not sure whether it's specific to PCI bus due to the assignment
> logic of those IOMMU groups, or it's about the handling of the active
> domain assignment.  In anyway, disabling IOMMU works around the
> problem, and passing driver_managed_dma flag to the HD-audio driver
> was also confirmed to work around it, too.
> 
> The problem persists with 6.0-rc1 kernel.
> 
> If you have / can give any fix patch or debug patch, let me know; I'll
> build test kernels and ask the reporters.

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot introduced 512881eacfa72c2136b27b99 ^
https://bugzilla.suse.com/show_bug.cgi?id=1202492
#regzbot title AMD HD-audio devices missing on 5.19
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
