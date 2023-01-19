Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48453C26
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 10:22:19 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae989.dynamic.kabel-deutschland.de [95.90.233.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A386F60027FD0;
	Thu, 19 Jan 2023 11:22:17 +0100 (CET)
Message-ID: <bef9f965-45d5-eaca-a889-a941fc8a00c6@molgen.mpg.de>
Date: Thu, 19 Jan 2023 11:22:17 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [Intel-wired-lan] Supermicro AOC-STGN-I1S (Intel 82599EN based
 10G adapter) - poor network performance after moving to Debian 11.5
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Bartek Kois <bartek.kois@gmail.com>
Cc: intel-wired-lan@osuosl.org, regressions@lists.linux.dev
References: <d1530cba-1a72-cae8-6a04-ed8ec0f82e6e@gmail.com>
 <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
In-Reply-To: <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Bartek,


Am 19.01.23 um 11:17 schrieb Paul Menzel:
> #regzbot ^introduced: 4.9.88..5.10.149

> Am 14.01.23 um 11:23 schrieb Bartek Kois:
> 
>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip link set 
>> enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel 82599EN based 10G 
>> adapter) I am experiencing high cpu load (even if no traffic is 
>> passing through the adapter) and network performance is low (when 
>> network is connected).
> 
> How do you test the network performance? Please give exact numbers for 
> comparison.
> 
>> The cpu load is oscillating between 0.1 and 0.3 on vanilla system
>> with no network attached. The problem can be observed on the following 
>> platforms: Supermicro X9SCL (Intel C202 PCH) and
>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the Supermicro
>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>
>> Tested environments:
>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
>> (2018-05-07) x86_64 GNU/Linux [all platforms working well with no 
>> problems: Supermicro X9SCL (Intel C202 PCH), Supermicro X10SLL+-F 
>> (Intel C222 Express PCH), Supermicro X11SSL-F (Intel® C232 chipset)]
> 
>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 
>> (2022-10-21) x86_64 GNU/Linux  [older platforms: Supermicro X9SCL 
>> (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222 Express PCH) behave 
>> problematic as described above | newer platform: Supermicro X11SSL-F 
>> (Intel® C232 chipset) working well with no problems]
> 
> Maybe create a bug at the Linux kernel bug tracker [1], where you can 
> attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
> 
>> So far to solve the problem I was trying to upgrade system to the 
>> newest stable version, upgrade kernel to version 6.x, upgrade ixgbe 
>> driver to the newest version but with no luck.
> 
> Thank you for checking that. Too bad it’s still present. To rule out 
> some user space problem, could you test Debian 9.7 with a stable Linux 
> release, currently 6.1.7?
> 
> What does `sudo perf top --sort comm,dso` show, where the time is spent?
> 
>> Supermicro support suggested as follows:
>> it might be kernel related debian 11.5 has kernel 5.10 which is a 
>> recent kernel it might not properly support the chipsets for X9 
>> therefore i suggest to use RHEL or CentOS as they use much older 
>> kernel versions. I expect that with ubuntu 20.04 you see the same 
>> problem it uses kernel 5.4
> 
> Testing another GNU/Linux distribution for another data point, might be 
> a good idea.
> 
> As nobody has responded yet, bisecting the issue is probably the fastest 
> way to get to the bottom of this. Luckily the problem seems reproducible 
> and you seem to be able to build a Linux kernel yourself, so that should 
> work. (For testing purposes you could also test with Ubuntu, as they 
> provide Linux kernel builds for (almost) all releases in their Linux 
> kernel mainline PPA [2].)

You could also try to do that in a virtual machine by passing through 
the network device to the VM. If that reproduces the issue, that’s quite 
a fast setup for bisecting a regression, as start times are really fast. 
(For example, you can pass the Linux kernel directly to a QEMU VM with 
the `-kernel` switch.)


Kind regards,

Paul


> [1]: https://bugzilla.kernel.org/
> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/
