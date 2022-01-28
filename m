Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530E029CA
	for <regressions@lists.linux.dev>; Fri, 28 Jan 2022 07:47:32 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nDLyk-000395-8a; Fri, 28 Jan 2022 08:47:30 +0100
Message-ID: <21305006-1397-507a-345f-fd488f876719@leemhuis.info>
Date: Fri, 28 Jan 2022 08:47:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Regression with 5021d709b31b ("tty: serial: Use fifo in 8250
 console driver") #forregzbot
Content-Language: en-BS
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <YfMpk7DM9zA7NfmI@debian> <YfOYBLz7/ktBcMNT@kroah.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
In-Reply-To: <YfOYBLz7/ktBcMNT@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1643356052;167be082;
X-HE-SMSGID: 1nDLyk-000395-8a

Top-posting for once, to make this easy accessible to everyone.

For the record:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-linus&id=6a7b9f002eca6788d346c16a6ff0c218b41f8d1d

#regzbot fixed-by: 6a7b9f002eca67

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.


On 28.01.22 08:15, Greg Kroah-Hartman wrote:
> On Thu, Jan 27, 2022 at 11:24:03PM +0000, Sudip Mukherjee wrote:
>> Hi Wander,
>>
>> Not sure if this has been reported before but since last few weeks I am
>> seeing a problem with the rpi4 serial port on my test setup. The initial
>> boot message will be completely garbled as you can see at:
>> https://lava.qa.codethink.co.uk/scheduler/job/543#L380.
>> The last good boot was https://lava.qa.codethink.co.uk/scheduler/job/540#L390.
>>
>> The bisect log:
>>
>> # bad: [455e73a07f6e288b0061dfcf4fcf54fa9fe06458] Merge tag 'clk-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
>> # good: [7e7b69654724c72bd3219b71f58937845dca0b2b] Merge tag 'dma-mapping-5.17' of git://git.infradead.org/users/hch/dma-mapping
>> git bisect start '455e73a07f6e288b0061dfcf4fcf54fa9fe06458' '7e7b69654724c72bd3219b71f58937845dca0b2b'
>> # bad: [342465f5337f7bd5b8bd3b6f939ac12b620cbb43] Merge tag 'tty-5.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
>> git bisect bad 342465f5337f7bd5b8bd3b6f939ac12b620cbb43
>> # good: [6dc69d3d0d18d587ab9d809fe060ba4417cf0279] Merge tag 'driver-core-5.17-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core
>> git bisect good 6dc69d3d0d18d587ab9d809fe060ba4417cf0279
>> # good: [e269f7acdc53623769da31135f60afeb3a65eaff] staging: r8188eu: remove the private ioctl "wps_assoc_req_ie"
>> git bisect good e269f7acdc53623769da31135f60afeb3a65eaff
>> # bad: [ad234e2bac274a43c9fa540bde8cd9f0c627b71f] tty: serial: meson: Drop the legacy compatible strings and clock code
>> git bisect bad ad234e2bac274a43c9fa540bde8cd9f0c627b71f
>> # good: [c66453ce8af8bac78a72ba4e21fd9a86720127d7] tty: fix kernel-doc in n_tty.c
>> git bisect good c66453ce8af8bac78a72ba4e21fd9a86720127d7
>> # good: [0882b473b084df31288003b3bee974aabac9dcf9] tty: serial: samsung: Enable console as module
>> git bisect good 0882b473b084df31288003b3bee974aabac9dcf9
>> # bad: [b4a29b94804c4774f22555651296b838df6ec0e4] serial: 8250: Move Alpha-specific quirk out of the core
>> git bisect bad b4a29b94804c4774f22555651296b838df6ec0e4
>> # good: [e822b4973f49015e1c6f63b91c8641ed9bfaf229] tty/ldsem: Fix syntax errors in comments
>> git bisect good e822b4973f49015e1c6f63b91c8641ed9bfaf229
>> # good: [fb09d0ac07725b442b32dbf53f0ab0bea54804e9] tty: Fix the keyboard led light display problem
>> git bisect good fb09d0ac07725b442b32dbf53f0ab0bea54804e9
>> # bad: [5021d709b31b8a14317998a33cbc78be0de9ab30] tty: serial: Use fifo in 8250 console driver
>> git bisect bad 5021d709b31b8a14317998a33cbc78be0de9ab30
>> # good: [adbfddc757aec1ed54ccb35c4a7ca9170df827e0] docs/driver-api: Replace a comma in the n_gsm.rst with a double colon
>> git bisect good adbfddc757aec1ed54ccb35c4a7ca9170df827e0
>> # first bad commit: [5021d709b31b8a14317998a33cbc78be0de9ab30] tty: serial: Use fifo in 8250 console driver
>>
>> And, indeed reverting 5021d709b31b ("tty: serial: Use fifo in 8250 console
>> driver") on top of 23a46422c561 ("Merge tag 'net-5.17-rc2' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net") fixes the problem
>> for me.
> 
> Thanks, but this is already reverted in my tree and will go to Linus
> later today.
> 
> greg k-h

