Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577667E0
	for <regressions@lists.linux.dev>; Tue, 29 Nov 2022 08:54:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ozwNK-0005sb-Ad; Tue, 29 Nov 2022 09:53:58 +0100
Message-ID: <fca2e6df-6c00-8fa4-808c-5021ab5b26d0@leemhuis.info>
Date: Tue, 29 Nov 2022 09:53:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: INFO: rcu_preempt detected expedited stalls on CPUs/tasks
 (6.1.0-rc3): in cat /sys/kernel/debug/kmemleak #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <e048a5c5-dea5-a31a-1022-1b007e022adb@alu.unizg.hr>
 <7ebd090d-4a6c-1a26-6e31-b0554c627e83@leemhuis.info>
In-Reply-To: <7ebd090d-4a6c-1a26-6e31-b0554c627e83@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1669712040;feed0507;
X-HE-SMSGID: 1ozwNK-0005sb-Ad

On 09.11.22 11:48, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
>
> On 04.11.22 23:01, Mirsad Goran Todorovac wrote:
>>
>> When investigating thermald kmemleak, it occurred that the "cat
>> /sys/kernel/debug/kmemleak"
>> and "tail -20 /sys/kernel/debug/kmemleak" commands take unusual amount
>> of time.
>>
>> Dmesg output showed expedited stalls that the commands caused NMIs and
>> NMI backtraces:
>>
>> [ 8123.263464] rcu: INFO: rcu_preempt detected expedited stalls on
>> CPUs/tasks: { 0-.... } 26 jiffies s: 3829 root: 0x1/.
>> [ 8123.263500] rcu: blocking rcu_node structures (internal RCU debug):
>> [ 8123.263508] Sending NMI from CPU 7 to CPUs 0:
>> [ 8123.263528] NMI backtrace for cpu 0
>> [ 8123.263539] CPU: 0 PID: 27898 Comm: cat Not tainted 6.1.0-rc3 #1
>> [ 8123.263552] Hardware name: LENOVO 82H8/LNVNB161216, BIOS GGCN34WW
>> 03/08/2022
> 
> #regzbot ^introduced 28b3ae426598e
> #regzbot title rcu: thermald causes a kmemleak
> #regzbot ignore-activity

#regzbot invalid: likely not a regression and just a odd config

For details see the discussion ending here:
https://lore.kernel.org/all/20221124201552.GV4001@paulmck-ThinkPad-P17-Gen-1/

Ciao, Thorsten
