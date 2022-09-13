Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BB23A3
	for <regressions@lists.linux.dev>; Tue, 13 Sep 2022 04:56:24 +0000 (UTC)
Received: from [89.101.6.116] (helo=[172.16.15.77]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oXxy4-0007id-P3; Tue, 13 Sep 2022 06:56:16 +0200
Message-ID: <5ae8b539-9fed-523d-f510-766a47ef9789@leemhuis.info>
Date: Tue, 13 Sep 2022 05:56:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [Regression] Bug 216421 - [regression] nl80211: kernel reports:
 key addition failed #forregzbot
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
References: <dd37d8af-d7e4-daee-1f80-36c53fbac076@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <dd37d8af-d7e4-daee-1f80-36c53fbac076@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1663044985;2ef5f66e;
X-HE-SMSGID: 1oXxy4-0007id-P3

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 28.08.22 12:22, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=216421
> 
>>  XiaoYan Li 2022-08-27 12:40:07 UTC

#regzbot invalid: bug is no longer reproducible for the reporter
https://bugzilla.kernel.org/show_bug.cgi?id=216421#c4

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
