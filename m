Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4158A2C95
	for <regressions@lists.linux.dev>; Tue, 16 Nov 2021 09:26:32 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mmujP-0003C7-Uz; Tue, 16 Nov 2021 10:26:24 +0100
Message-ID: <e75bf933-9b93-89d2-d73f-f85af65093c8@leemhuis.info>
Date: Tue, 16 Nov 2021 10:26:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCHv2] Bluetooth: quirk disabling LE Read Transmit Power
Content-Language: en-BS
To: Orlando Chamberlain <redecorating@protonmail.com>
Cc: danielwinkler@google.com, gargaditya08@live.com,
 gregkh@linuxfoundation.org, johan.hedberg@intel.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 luiz.dentz@gmail.com, marcel@holtmann.org, regressions@lists.linux.dev,
 sonnysasaka@chromium.org
References: <4970a940-211b-25d6-edab-21a815313954@protonmail.com>
 <275acce4-9eab-9cba-7145-5a75a69ca530@protonmail.com>
 <20211001083412.3078-1-redecorating@protonmail.com>
 <CABBYNZLjSfcG_KqTEbL6NOSvHhA5-b1t_S=3FQP4=GwW21kuzg@mail.gmail.com>
 <972034A8-4B22-4FEE-9B37-C0A7C7ADD60C@live.com> <YYZr14zwHnd52rQ7@kroah.com>
 <829A2DF8-818E-4AF1-84F9-49B5822F9146@live.com> <YYePw07y2DzEPSBR@kroah.com>
 <70a875d0-7162-d149-dbc1-c2f5e1a8e701@leemhuis.info>
 <20211116090128.17546-1-redecorating@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20211116090128.17546-1-redecorating@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637054792;d86bf731;
X-HE-SMSGID: 1mmujP-0003C7-Uz

On 16.11.21 10:02, Orlando Chamberlain wrote:
>> Bluetooth maintainers, what's the status here? The proposed patch is
>> fixing a regression. It's not a recent one (it afaics was introduced in
>> v5.11-rc1). Nevertheless it would be good to get this finally resolved.
>> But this thread seems inactive for more than a week now. Or was progress
>> made, but is only visible somewhere else?
> 
> I think the best solution is getting broadcom to update their firmware,
> I've just sent them a message through a form on their website, I couldn't
> seem to get it to tell me "Your message has been sent", so it's possible
> that it didn't submit (more likely I've sent the same message several times).
> 
> If I hear back from them I'll send something here.

Thx for that. But FWIW: from the point of the regression tracker that's
not the best solution, as according to your report this is a regression.
IOW: we deal with something that used to up to a certain kernel version
and was broken by a change to the kernel. That is something frown upon
in Linux kernel development, hence changes introducing regression are
often quickly reverted, if they can't get fixed by follow up change quickly.

That sentence has two "quickly", as we want to prevent more people
running into the issue, resulting in a loss of trust. But that's what
will happen if we wait for a firmware update to get developed, tested,
published, and rolled out. And even then we can't expect users to have
the latest firmware installed when they switch to a new kernel.

Hence the best solution *afaics* might be: fix this in the kernel
somehow now with a workaround; once the firmware update is out, change
the kernel again to only apply the workaround if the old firmware is in use.

At least that's how it looks to me from the outside. But as mentioned
earlier already: as a Linux kernel regression tracker I'm getting a lot
of reports on my table. I can only look briefly into most of them.
Therefore I unfortunately will get things wrong or miss something
important. I hope that's not the case here; if you think it is, don't
hesitate to tell me about it in a public reply. That's in everyone's
interest, as what I wrote above might be misleading to everyone reading
this, which is something I'd like to avoid.

Ciao, Thorsten (carrying his Linux kernel regression tracker hat)
