Received: from queue02b.mail.zen.net.uk (queue02b.mail.zen.net.uk [212.23.3.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB572
	for <regressions@lists.linux.dev>; Fri, 12 Nov 2021 17:25:18 +0000 (UTC)
Received: from [212.23.1.3] (helo=smarthost01b.sbp.mail.zen.net.uk)
	by queue02b.mail.zen.net.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <lkml@badpenguin.co.uk>)
	id 1mlaIY-0006T3-9E
	for regressions@lists.linux.dev; Fri, 12 Nov 2021 17:25:10 +0000
Received: from [217.155.148.18] (helo=swift)
	by smarthost01b.sbp.mail.zen.net.uk with esmtp (Exim 4.90_1)
	(envelope-from <lkml@badpenguin.co.uk>)
	id 1mlaIP-0007J4-FP; Fri, 12 Nov 2021 17:25:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by swift (Postfix) with ESMTP id 3905C2C9EB8;
	Fri, 12 Nov 2021 17:25:01 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at badpenguin.co.uk
Received: from swift ([127.0.0.1])
	by localhost (swift.badpenguin.co.uk [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hC3UDCOAKrmf; Fri, 12 Nov 2021 17:24:59 +0000 (GMT)
Received: from [192.168.42.11] (katana [192.168.42.11])
	by swift (Postfix) with ESMTPS id 0C8022C9EAD;
	Fri, 12 Nov 2021 17:24:59 +0000 (GMT)
Subject: Re: kernel 5.15.1: AMD RX 6700 XT - Fails to resume after screen
 blank
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <dbadfe41-24bf-5811-cf38-74973df45214@badpenguin.co.uk>
 <YYwDnbpES0rrnWBw@kroah.com>
 <b266047e-5674-d1e6-de4b-59a90299f022@badpenguin.co.uk>
 <797107e1-6595-f3ef-e7b2-5784667f73e7@badpenguin.co.uk>
 <e0f6f173-95a6-3868-5cc1-44092acd9267@leemhuis.info>
From: Mark Boddington <lkml@badpenguin.co.uk>
Message-ID: <ab370b30-3d01-6f7e-4e56-dd7b61251e25@badpenguin.co.uk>
Date: Fri, 12 Nov 2021 17:24:58 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <e0f6f173-95a6-3868-5cc1-44092acd9267@leemhuis.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-smarthost01b-IP: [217.155.148.18]
Feedback-ID: 217.155.148.18

Hi,

On 12/11/2021 16:04, Thorsten Leemhuis wrote:
> Hi Mark. Replying inline
> (https://en.wikipedia.org/wiki/Posting_style#Interleaved_style ), as
> that's the norm and kinda expected on Linux kernel mailing lists:
>
> On 11.11.21 00:11, Mark Boddington wrote:
>> And also
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c?h=linux-5.15.y&id=f02abeb0779700c308e661a412451b38962b8a0b
>>
>> Maybe if the function is called during resume() without being called
>> during init(), bad things happen???
> Have you tried to revert any of the patches you suspect to cause this
> and see if things improve? And BTW: did 5.15 (aka 5.15.0) work? Or was
> some process to resolve this made already somewhere else and I just
> missed it?
>
> Ciao, Thorsten (with his Linux kernel regression tracker hat on)
>
> #regzbot poke

I tried reverting both, but they didn't improve the situation.

I also had the deadlock happen on 5.15 yesterday, so the last stable 
kernel I have used is 5.14.15. I can try the latest 5.14.x if that will 
help?

Cheers,

Mark

