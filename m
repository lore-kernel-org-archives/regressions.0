Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0667C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 11:18:28 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWFYA-0002mj-Ng; Thu, 08 Sep 2022 13:18:26 +0200
Message-ID: <dbceb7d0-8fd8-4202-2913-18e90c70ff55@leemhuis.info>
Date: Thu, 8 Sep 2022 13:18:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Regression in 5.19.0: USB errors during boot #forregzbot
Content-Language: en-US, de-DE
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <25342.20092.262450.330346@wylie.me.uk>
 <Yv5Q8gDvVTGOHd8k@kroah.com> <20220821062345.GA26598@lst.de>
 <25345.60162.942383.502797@wylie.me.uk> <20220821142610.GA2979@lst.de>
 <25346.25145.488362.162952@wylie.me.uk>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <25346.25145.488362.162952@wylie.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662635908;47673131;
X-HE-SMSGID: 1oWFYA-0002mj-Ng

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 21.08.22 18:50, Alan J. Wylie wrote:
> at 16:26 on Sun 21-Aug-2022 Christoph Hellwig (hch@lst.de) wrote:
> 
>> Thanks for confirming my suspicion.  I'd still like to fix the issue
>> with CONFIG_GART_IOMMU enabled once I've tracked it down.  Would you
>> be willing to test patches?
> 
> I'll be glad to help.
> 
> I've also had a look in the loft and my box of bits for an old
> Athlon64/Opteron/Turion/Sempron processor, but I'm afraid all I've got
> are:
> 
> Phenom II X6 1055T
> Phenom II X2 545
> Athlon 2  x2 270

#regzbot backburner: unusual config, workaround found, devs still want
to fix it, but apparently not urgent
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
