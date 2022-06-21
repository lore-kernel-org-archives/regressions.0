Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6079BEA4
	for <regressions@lists.linux.dev>; Tue, 21 Jun 2022 09:36:03 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o3aIh-0007GQ-G5; Tue, 21 Jun 2022 11:35:59 +0200
Message-ID: <b5b67c54-e17d-64c5-7bec-00f0d5b5bae2@leemhuis.info>
Date: Tue, 21 Jun 2022 11:35:58 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: virtio_balloon regression in 5.19-rc3
Content-Language: en-US
To: Ben Hutchings <ben@decadent.org.uk>,
 virtualization@lists.linux-foundation.org
Cc: debian-kernel@lists.debian.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655804163;a8393eba;
X-HE-SMSGID: 1o3aIh-0007GQ-G5

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

On 20.06.22 20:49, Ben Hutchings wrote:
> I've tested a 5.19-rc3 kernel on top of QEMU/KVM with machine type
> pc-q35-5.2.  It has a virtio balloon device defined in libvirt as:
> 
>     <memballoon model="virtio">
>       <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
>     </memballoon>
> 
> but the virtio_balloon driver fails to bind to it:
> 
>     virtio_balloon virtio4: init_vqs: add stat_vq failed
>     virtio_balloon: probe of virtio4 failed with error -5
> 
> On a 5.18 kernel with similar configuration, it binds successfully.
> 
> I've attached the kernel config for 5.19-rc3.

CCing the regression mailing list, as it should be in the loop for all
regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced v5.18..v5.19-rc3
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
