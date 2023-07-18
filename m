Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6AAC8D8
	for <regressions@lists.linux.dev>; Tue, 18 Jul 2023 10:07:07 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qLhbX-0002Vt-7x; Tue, 18 Jul 2023 12:06:51 +0200
Message-ID: <f5e6258b-ba76-001b-4942-588f4cbb0aa7@leemhuis.info>
Date: Tue, 18 Jul 2023 12:06:50 +0200
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
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-fbdev@vger.kernel.org, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230713123710.5d7d81e4@canb.auug.org.au>
 <ccc63065-2976-88ef-1211-731330bf2866@infradead.org>
 <ZLYHtVuS7AElXcCb@debian.me>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ZLYHtVuS7AElXcCb@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1689674828;51d8169f;
X-HE-SMSGID: 1qLhbX-0002Vt-7x

On 18.07.23 05:32, Bagas Sanjaya wrote:
> On Thu, Jul 13, 2023 at 09:11:10AM -0700, Randy Dunlap wrote:
>> On 7/12/23 19:37, Stephen Rothwell wrote:
>>> Changes since 20230712:
>>
>> on ppc64:
>>
>> In file included from ../include/linux/device.h:15,
>>                  from ../arch/powerpc/include/asm/io.h:22,
>>                  from ../include/linux/io.h:13,
>>                  from ../include/linux/irq.h:20,
>>                  from ../arch/powerpc/include/asm/hardirq.h:6,
>>                  from ../include/linux/hardirq.h:11,
>>                  from ../include/linux/interrupt.h:11,
>>                  from ../drivers/video/fbdev/ps3fb.c:25:
>> ../drivers/video/fbdev/ps3fb.c: In function 'ps3fb_probe':
>> ../drivers/video/fbdev/ps3fb.c:1172:40: error: 'struct fb_info' has no member named 'dev'
>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>       |                                        ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>       |                                     ^~~~~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>       |         ^~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1172:61: error: 'struct fb_info' has no member named 'dev'
>>  1172 |                  dev_driver_string(info->dev), dev_name(info->dev),
>>       |                                                             ^~
>> ../include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk_index_wrap'
>>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>>       |                                     ^~~~~~~~~~~
>> ../drivers/video/fbdev/ps3fb.c:1171:9: note: in expansion of macro 'dev_info'
>>  1171 |         dev_info(info->device, "%s %s, using %u KiB of video memory\n",
>>       |         ^~~~~~~~
> 
> Hmm, there is no response from Thomas yet. I guess we should go with
> reverting bdb616479eff419, right?

I'm missing something here:

* What makes you think this is caused by bdb616479eff419? I didn't see
anything in the thread that claims this, but I might be missing something
* related: if I understand Randy right, this is only happening in -next;
so why is bdb616479eff419 the culprit, which is also in mainline since
End of June?

And asking for a revert already is a bit jumping the gun; sure, it would
be good to get this fixed, but remember: developers have a lot on their
plate and thus sometimes are forced to set priorities; they also
sometimes go on vacation or are afk for other reasons; and sometimes
they just miss a mail or two. These are just a few reasons why there
might be good reasons why Thomas didn't look into this yet, hence please
first ask really kindly before asking for a revert.

Ciao, Thorsten
