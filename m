Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1262C80
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 17:27:01 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mqIWR-0005hL-Om; Thu, 25 Nov 2021 18:26:59 +0100
Message-ID: <af435630-0f2f-0cb1-894e-b6ce25125620@leemhuis.info>
Date: Thu, 25 Nov 2021 18:26:59 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-BS
To: Steffen Maier <maier@linux.ibm.com>, regressions@lists.linux.dev
References: <20211012233558.4066756-1-bvanassche@acm.org>
 <163478764102.7011.9375895285870786953.b4-ty@oracle.com>
 <7c0af228-e098-5657-934e-d2bd2bff5ee3@linux.ibm.com>
 <c68b8cb6-ff71-c7e8-8ff7-4126dd8cdc0a@linux.ibm.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Missing driver-specific sysfs attributes of scsi_device [was: Re:
 [PATCH v4 00/46] Register SCSI sysfs attributes earlier]
In-Reply-To: <c68b8cb6-ff71-c7e8-8ff7-4126dd8cdc0a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637861221;88bcd48a;
X-HE-SMSGID: 1mqIWR-0005hL-Om

On 25.11.21 18:00, Steffen Maier wrote:
> On 10/23/21 22:54, Steffen Maier wrote:
>
>> since Friday 2021-10-22 our CI reports errors with linux-next. It
>> complains about missing zfcp-lun resources (although that's a
>> follow-on error). Machines that have their root-fs on zfcp-attached
>> SCSI disk(s) are stuck in boot. Looking at user visible effects, I see
>> zfcp-specific sysfs attributes of scsi_device missing:
> [...]
>> Not sure if I'll find time to dig deeper.
> 
> Didn't know about regzbot, so I'm trying to feed it after the facts.
> 
> #regzbot ^introduced: 92c4b58b15c56298b1b225c1d2e533165b3e32af
> #regzbot fixed-by: 3a71f0f7a51259b3cb95d79cac1e19dcc5e89ce9
> #regzbot monitor:
> https://lore.kernel.org/r/f5900f54-dddd-6dd4-ce13-a8bdfa58b6ad@linux.ibm.com
> 
> #regzbot link:
> https://lore.kernel.org/r/d9405d786496756564b31540cc73a9d22cc97730.camel@HansenPartnership.com
> 
> #regzbot monitor:
> https://lore.kernel.org/r/4b3e8a72-0b48-95e3-6617-a685d42c08fb@opensource.wdc.com
> 
> #regzbot monitor:
> https://lore.kernel.org/r/20211111084551.446548-1-damien.lemoal@opensource.wdc.com
> 
> #regzbot activity-ignore

Hah, thx for getting regzbot involved, it afaics handled all those
commands as it was supposed to.

But FWIW: at least for now regzbot is there to make sure that
regressions don't fall through the cracks. Maybe that changes one day.
But until then there is no need to tell regzbot about regressions
already fixed.

Ciao, Thorsten
