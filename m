Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A957E
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 06:07:06 +0000 (UTC)
Received: from [192.168.0.3] (ip5f5ae8e8.dynamic.kabel-deutschland.de [95.90.232.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0B15F61E64846;
	Thu, 24 Mar 2022 07:06:59 +0100 (CET)
Message-ID: <b49b4bc2-d4fc-4992-c616-3192a641fdd7@molgen.mpg.de>
Date: Thu, 24 Mar 2022 07:06:58 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: ATI Radeon Mobility 3470 fails with Kernel 5.0
Content-Language: en-US
To: Craig M <cmroanirgo@gmail.com>
References: <CAHtRFGvj1DuYzUUL1P5bvfMpT1WkwUL2ZpZQt1iYf-XH=fJP0Q@mail.gmail.com>
 <CAHtRFGvDmdMkc4r5Ko8osJPeGiWQnPwcABY=4WzweYz50WQQMg@mail.gmail.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAHtRFGvDmdMkc4r5Ko8osJPeGiWQnPwcABY=4WzweYz50WQQMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Craig,


Am 24.03.22 um 02:09 schrieb Craig M:
> I should add some further information:
> 
> I have tried using Manjaro KDE, Kubuntu 20 and Kubuntu 18.03 live
> disks and all exhibit this 'tearing' issue.
> 
> The problem begins rather early on in the boot sequence while the TUI
> is logging the startup information and continues to be a problem as
> the screen becomes graphic.
> 
> I feel that I should be able to rectify this with a setting change.
> 
> Again, Thanks for any help.
> Craig.

In the future, it’d be great if instead of top-posting you used 
interleaved style.

> On 3/24/22, Craig M <cmroanirgo@gmail.com> wrote:
>> Hi,
>>
>> I'm trying to track down a problem with an ancient graphics device ATI
>> Radeon Mobility 3470.
>>
>> Ubuntu/Kubuntu 18 is shipped kernel 4.18 and the radeon drivers work well.
>> With 18.02 and later it ships with kernel 5.0 and the radeon drivers don't.
>>
>> What I'm seeing is hard to describe. It looks a lot like the scan
>> lines are interleaved and there's a lot of noise. It's not the typical
>> screen tearing, nor is it just snow (black and white noise). I can
>> *just* make out what it being displayed onscreen, but hurts the eyes a
>> lot to try and do so!
>>
>> If I hold the kernel back at 4.18 things are just fine.
>>
>> Some detailed info (from a working 4.18 kernel). Note that the
>> returned information from a 5.x kernel isn't all that much different:
>>
>> $ lshw -c video
>> *-display
>>        description: VGA compatible controller
>>        product: RV620/M82 [Mobility Radeon HD 3450/3470]
>>        vendor: Advanced Micro Devices, Inc. [AMD/ATI]
>>        physical id: 0
>>        bus info: pci@0000:01:00.0
>>        version: 00
>>        width: 32 bits
>>        clock: 33MHz
>>        capabilities: pm pciexpress msi vga_controller bus_master
>> cap_list rom       configuration: driver=radeon latency=0
>> resources: irq:26 memory:c0000000-c7ffffff ioport:9000(size=256)
>> memory:c8020000-c802ffff memory:c0000-dffff
>>
>>
>> $ modinfo radeon
>>
>> filename:
>> /lib/modules/4.18.0-17-generic/kernel/drivers/gpu/drm/radeon/radeon.ko
>> license:        GPL and additional rights description:    ATI Radeon
>> author:         Gareth Hughes, Keith Whitwell, others.
>>
>> ...
>> name:           radeon
>> vermagic:       4.18.0-17-generic SMP mod_unload
>> signat:         PKCS#7
>> signer:
>> sig_key:
>> sig_hashalgo:   md4
>> ....

Looking at the output of `dmesg` might also help.

>> I'm just trying to track down the driver changes between 4.18 and 5.0
>> to see what I can do to change settings. Any help  would be greatly
>> appreciated. I've had a quick look through
>> https://gitlab.freedesktop.org/xorg/driver/xf86-video-ati but I don't
>> know where to start (as there's no correlation between releases and
>> kernels, from what I can see).

As switching the Linux kernel version works, you need to look at the 
driver in the Linux kernel. As you can easily reproduce your problem, 
and you are most likely alone with this old hardware, bisecting will 
probably the way to go. First you can try the packages from Ubuntu’s 
Kernel PPA [1]. Figuring out, in what version the regression occurs, you 
then build the Linux kernel yourself, for example with `make 
bindeb-pkg`, and try to find out the exact commit. There should be some 
guides on the WWW explaining all this in detail.


Kind regards and good luck,

Paul


PS: It would also be nice to know, if the problem is still present in 
Linux 5.17.


[1]: https://kernel.ubuntu.com/~kernel-ppa/mainline/
