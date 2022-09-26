Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FBE3217
	for <regressions@lists.linux.dev>; Mon, 26 Sep 2022 13:40:56 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ocoLu-0006yL-49; Mon, 26 Sep 2022 15:40:54 +0200
Message-ID: <d1ba88bf-ae0e-72e2-d5c8-133cd4323e9f@leemhuis.info>
Date: Mon, 26 Sep 2022 15:40:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [regression] Bug 216397 - Kernel 5.19 with NetworkManager and
 iwd: Wifi reconnect on resume is broken #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <31cceaa5-2684-1aa8-61c6-c1be2d563bb0@leemhuis.info>
In-Reply-To: <31cceaa5-2684-1aa8-61c6-c1be2d563bb0@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664199656;40b655b3;
X-HE-SMSGID: 1ocoLu-0006yL-49

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 26.08.22 13:14, Thorsten Leemhuis wrote:
> 
> To quote from https://bugzilla.kernel.org/show_bug.cgi?id=216397 :
> 
>>  Vorpal 2022-08-22 16:35:21 UTC
>>
>> Created attachment 301630 [details]
>> Relevant journalctl.txt
>>
>> After upgrading to kernel 5.19 (Arch Linux kernel, which is minimally modified, but I tested a few alternative kernels too, such as zen), wifi reconnect on resume is broken when using NetworkManager + iwd.

#regzbot fixed-by: 8997f5c8a62

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
