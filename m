Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599438F
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 16:50:18 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oWKjB-0001DD-O4; Thu, 08 Sep 2022 18:50:09 +0200
Message-ID: <83d087ac-e69c-f57e-4486-f58bc6da5c52@leemhuis.info>
Date: Thu, 8 Sep 2022 18:50:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec
 -26.5% regression #forregzbot
In-Reply-To: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1662655818;3c1cd0ac;
X-HE-SMSGID: 1oWKjB-0001DD-O4

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.


On 31.08.22 09:21, kernel test robot wrote:
> 
> hi, pleased be noted that we read this patch and understand it as a fix,
> also what we understand is, since the patch itself adds some memory barrier,
> some regression in block IO area is kind of expected.
> 
> after more internal review, we still decided to report out to share our finding
> in our tests, and for your information that how this patch could impact
> performance in some cases. please let us know if you have any concern.
> 
> Thanks a lot!
> 
> below is the full report.
> 
> 
> Greeting,
> 
> FYI, we noticed a -26.5% regression of fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec due to commit:

Due to some bug in regzbot (one I saldy have no time to look into right
now) regzbot didn't see the fix for this, so let's do it manually:

#regzbot fixed-by: 2f79cdfe58c13949bbbb6

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
