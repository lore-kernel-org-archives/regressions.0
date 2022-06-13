Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCA8110D
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 14:43:12 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M1HuU-1o2PAH2rHe-002pGD; Mon, 13 Jun 2022 16:42:35 +0200
Message-ID: <de4da55b-a074-b375-c41d-413bb19a428b@i2se.com>
Date: Mon, 13 Jun 2022 16:42:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [BUG] null pointer dereference when loading bpf_preload on
 Raspberry Pi
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Shubham Bansal <illusionist.neo@gmail.com>, bpf@vger.kernel.org,
 jpalus@fastmail.com, regressions@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <f038d6f9-b96b-0749-111c-33ac8939a1c0@i2se.com>
 <YqcbgmTmezGM0VPr@shell.armlinux.org.uk>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <YqcbgmTmezGM0VPr@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RUNrFBwO0Rxcmop+xh2sE+cCQBp6k7JRB/aBlkwKSR5DZbbnnuK
 JzNwJOnHUCBbVTQF4vvpq45KCFOfjlvWG+h0CBWrquW+sLSTdcyq/JW9ACJIuLXwXO5jOFn
 n7cX6JIug22sB911HFAVE2Ym19DV+AQ4ibGWGDXOhxUmQB8nP0YeTdozmAuE7DlToDm2xsc
 2ggpSyzOPQFvCUCyDSnWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:d1UpMfaY4ok=:wa8pYV027iWAKONHmRhAgn
 7ORhcF2/gh31EYlJTxGsDlOOxHZ/ZwET3nSzKTPfTLmQkIFnYrTju7uVCe/gp6/PhfYYwLWSS
 HHwFVn3Iz1+URjdaWSWtb3yPczmPreDUP95gHJuLWlui/qtaE8PkNkaYw5DWBfw4jKmRrWVsu
 i42Dj+6LJECUrsB8vy3Y7YbC+0I6UKdtu8DSlZRJ3kG2P8x29wkd6XH3e4fxRhvG3yCOYKlKS
 LPlp0C/J8cHQ8lqtm0NJpMxEx3SlfyGqf36Ts9VIbxhyGLmONe5cxQrbJCRZF5Hu0I0LLD4OE
 RCA5LH77zlqyRD4Pbs3VEVdwG5LAmnJR4+hS83yuKRRJpEoMrmCmD9c/bRjfk0I7SYp5yaqYL
 jOViRHkD3WYx/nqIKJHMq0uidW/GPv/cBy+rOJeQeh/9hdSpJi2DdZiB0kfMr8lUlfDbh7vdV
 rhMRvvZ7JKFL8vTAzqu8XiREURXGZQUhLtkzPRjxD0uUdhwwmob/nRDB66CZhkdeud0sdLeDB
 cAudwt+P6ucWqGGI7pZqUcPX4+kY6QugLYQlx6qdbS/8YvTLdXbu5AzDjDFj13ZMeyLNVQlv3
 C7D/CMviKMe3bTG3aFlTKer3Kl8xIpppsG2iK/6AHmyiYQaq/4u+DvLZfnTuIRC+1b50OLLY1
 1Qaof+rLGfMQV6sSHSDwsjPBmLxLnEGCWBqK/MOXi7LsLbkjoRIt4xWFKoUebQg8PR1BHpYiv
 Fskrj7k2j5ZxJOuW+tRXFuzC9iU0tDvVFHky2AKNkou5ynxfHxvdFWvOAio=

Hi,

Am 13.06.22 um 13:12 schrieb Russell King (Oracle):
> On Mon, Jun 13, 2022 at 12:22:47AM +0200, Stefan Wahren wrote:
>> It would be nice to get a hint, how to narrow down or which commit might
>> trigger this issue.
> The standard way? git bisect?
>
> So it happens on 5.18.0 and 5.18.3. Presumably it didn't happen with
> 5.17?

in 5.17 there is a libelf dependency (was removed in 5.18), which cause 
a compile issue about missing libelf.h which is only available on my 
host system but not available in my Linaro cross toolchain.

Should i copy the libelf.h somewhere, so the cross compiler finds it?

