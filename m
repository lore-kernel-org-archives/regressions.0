Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434572561
	for <regressions@lists.linux.dev>; Sat, 21 Jan 2023 13:31:35 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pJDy0-0007Yo-H9; Sat, 21 Jan 2023 14:31:32 +0100
Message-ID: <1df92fec-7f57-5080-94ed-b149ed384280@leemhuis.info>
Date: Sat, 21 Jan 2023 14:31:32 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US, de-DE
To: Nick Bowler <nbowler@draconx.ca>, sparclinux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CADyTPEwt=ZNams+1bpMB1F9w_vUdPsGCt92DBQxxq_VtaLoTdw@mail.gmail.com>
 <CADyTPEyAidGgBT3f1VJLHb3ouO-r1UyvFp1PcwXxy0NRG94sbw@mail.gmail.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: PROBLEM: Only one CPU active on Ultra 60 since ~4.8 (regression)
In-Reply-To: <CADyTPEyAidGgBT3f1VJLHb3ouO-r1UyvFp1PcwXxy0NRG94sbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674307895;6d4e7f2c;
X-HE-SMSGID: 1pJDy0-0007Yo-H9

CCing the sparc maintainer. Also CCing the regression list, as it should
be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html

The the mail address of the culprit's author bounces. There is another
Atish Patra still active; does anyone known if those two are the same
person?

Anyway, that's it from my side.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

On 20.01.23 04:15, Nick Bowler wrote:
> Hi,
> 
> I'm resending this report CC'd to linux-kernel as there was no response
> on the sparclinux list.
> 
> I tried 6.2-rc4 and there is no change in behaviour.  Reverting the
> indicated commit still works to fix the problem.
> 
> On 2022-07-12, Nick Bowler <nbowler@draconx.ca> wrote:
>> When using newer kernels on my Ultra 60 with dual 450MHz UltraSPARC-II
>> CPUs, I noticed that only CPU 0 comes up, while older kernels (including
>> 4.7) are working fine with both CPUs.
>>
>> I bisected the failure to this commit:
>>
>>   9b2f753ec23710aa32c0d837d2499db92fe9115b is the first bad commit
>>   commit 9b2f753ec23710aa32c0d837d2499db92fe9115b
>>   Author: Atish Patra <atish.patra@oracle.com>
>>   Date:   Thu Sep 15 14:54:40 2016 -0600
>>
>>       sparc64: Fix cpu_possible_mask if nr_cpus is set
>>
>> This is a small change that reverts very easily on top of 5.18: there is
>> just one trivial conflict.  Once reverted, both CPUs work again.
>>
>> Maybe this is related to the fact that the CPUs on this system are
>> numbered CPU0 and CPU2 (there is no CPU1)?
>>
>> Here is /proc/cpuinfo on a working kernel:
>>
>>     % cat /proc/cpuinfo
>>     cpu             : TI UltraSparc II  (BlackBird)
>>     fpu             : UltraSparc II integrated FPU
>>     pmu             : ultra12
>>     prom            : OBP 3.23.1 1999/07/16 12:08
>>     type            : sun4u
>>     ncpus probed    : 2
>>     ncpus active    : 2
>>     D$ parity tl1   : 0
>>     I$ parity tl1   : 0
>>     cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
>>     Cpu0ClkTck      : 000000001ad31b4f
>>     Cpu2ClkTck      : 000000001ad31b4f
>>     MMU Type        : Spitfire
>>     MMU PGSZs       : 8K,64K,512K,4MB
>>     State:
>>     CPU0:           online
>>     CPU2:           online
>>
>> And on a broken kernel:
>>
>>     % cat /proc/cpuinfo
>>     cpu             : TI UltraSparc II  (BlackBird)
>>     fpu             : UltraSparc II integrated FPU
>>     pmu             : ultra12
>>     prom            : OBP 3.23.1 1999/07/16 12:08
>>     type            : sun4u
>>     ncpus probed    : 2
>>     ncpus active    : 1
>>     D$ parity tl1   : 0
>>     I$ parity tl1   : 0
>>     cpucaps         : flush,stbar,swap,muldiv,v9,mul32,div32,v8plus,vis
>>     Cpu0ClkTck      : 000000001ad31861
>>     MMU Type        : Spitfire
>>     MMU PGSZs       : 8K,64K,512K,4MB
>>     State:
>>     CPU0:           online
>>
>> Let me know if you need any more info.
>>
>> Thanks,
>>   Nick
> 
