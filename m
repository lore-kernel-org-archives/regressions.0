Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C371FD8
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 12:17:48 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qLje3-0001Gz-HV; Tue, 18 Jul 2023 14:17:35 +0200
Message-ID: <2148b246-96e8-3beb-c21d-904df215cded@leemhuis.info>
Date: Tue, 18 Jul 2023 14:17:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: linux-next: Tree for Jul 13 (drivers/video/fbdev/ps3fb.c)
Content-Language: en-US, de-DE
To: Michael Ellerman <mpe@ellerman.id.au>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-fbdev@vger.kernel.org,
 Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Geoff Levand <geoff@infradead.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me> <874jm1jv9m.fsf@mail.lhotse>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <874jm1jv9m.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689682668;3d0d6f06;
X-HE-SMSGID: 1qLje3-0001Gz-HV

Michael, thx for looking into this!

On 18.07.23 13:48, Michael Ellerman wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>> On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
>>> on ppc64:
>>>
>>> In file included from ../include/linux/device.h:15,
>>>                  from ../arch/powerpc/include/asm/io.h:22,
>>>                  from ../include/linux/io.h:13,
>>>                  from ../include/linux/irq.h:20,
>>>                  from ../arch/powerpc/include/asm/hardirq.h:6,
>>>                  from ../include/linux/hardirq.h:11,
>>>                  from ../include/linux/interrupt.h:11,
>>>                  from ../drivers/video/fbdev/ps3fb.c:25:
>>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>>       |                                        ^~
>>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>>       |                                     ^~~~~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>>       |         ^~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>>       |                                                             ^~
>>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>>       |                                     ^~~~~~~~~~~
>>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>>       |         ^~~~~~~~
>>>
>>>
>>
>> Hmm, there is no response from Thomas yet. I guess we should go with
>> reverting bdb616479eff419, right? Regardless, I'm adding this build regression
>> to regzbot so that parties involved are aware of it:
>>
>> #regzbot ^introduced: bdb616479eff419
>> #regzbot title: build regression in PS3 framebuffer
> 
> Does regzbot track issues in linux-next?

It can, I made sure of that in case somebody want to use this sooner or
later (and it wasn't much work), but I don't actively use this
functionally right now and do not plan to do so, there are more
important issues to spend time on.

> They're not really regressions because they're not in a release yet.
> 
> Anyway I don't see where bdb616479eff419 comes from.

That makes two of us :-D

> The issue was introduced by:
> 
>   701d2054fa31 fbdev: Make support for userspace interfaces configurable

Ahh, that makes a lot more sense. While at it, let me tell regzbot:

#regzbot introduced: 701d2054fa31

Ciao, Thorsten
