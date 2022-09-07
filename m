Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FC95CA6
	for <regressions@lists.linux.dev>; Wed,  7 Sep 2022 15:54:27 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oVxNh-000422-4b; Wed, 07 Sep 2022 17:54:25 +0200
Message-ID: <b395b2aa-3aa8-8f12-8629-23266fa108d3@leemhuis.info>
Date: Wed, 7 Sep 2022 17:54:24 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [Regression] Bug 216420 - Unable to handle kernel NULL pointer
 dereference at virtual address 00000008 #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <29a5c3e3-a590-01dd-1a2b-8415cae4a292@leemhuis.info>
In-Reply-To: <29a5c3e3-a590-01dd-1a2b-8415cae4a292@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662566067;7443beb1;
X-HE-SMSGID: 1oVxNh-000422-4b

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.


On 28.08.22 13:44, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it (I
> hope I picked the right recipients for this mail):
> 
> [...]
> 
> #regzbot introduced: v5.19..v6.0-rc2
> https://bugzilla.kernel.org/show_bug.cgi?id=216420
> #regzbot ignore-activity

#regzbot fixed-by: 25af7406df591

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
