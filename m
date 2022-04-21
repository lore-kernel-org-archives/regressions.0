Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948F21876
	for <regressions@lists.linux.dev>; Thu, 21 Apr 2022 09:51:12 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhTSw-0005SS-9u; Thu, 21 Apr 2022 11:51:10 +0200
Message-ID: <745e356a-0d4c-966b-66cb-e4067ca33d40@leemhuis.info>
Date: Thu, 21 Apr 2022 11:51:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Bug 215777 - ath11k: 5.17.x causes cpu soft-lock on xps13 9310
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <cd89d263-43e4-5634-75b9-bf3340c9bb1e@leemhuis.info>
In-Reply-To: <cd89d263-43e4-5634-75b9-bf3340c9bb1e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650534672;c6589778;
X-HE-SMSGID: 1nhTSw-0005SS-9u

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: 1f682dc9fb3790a
#regzbot from: Dominik Förderer <dominik.foerderer@windeck-gymnasium.de>

On 08.04.22 10:20, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> About a week ago a regression was reported to bugzilla.kernel.org that
> seems to be handled there already, nevertheless I'd like to add to the
> tracking to ensure it's not forgotten.
> 
> #regzbot introduced: 9dcf6808b253a72b2c90eed179863bf5fab7d68c
> #regzbot from: dominik.foerderer@windeck-gymnasium.de
> <dominik.foerderer@windeck-gymnasium.de>
> #regzbot title: net: wifi: ath11k: 5.17.x causes cpu soft-lock on xps13
> 9310
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215777
> 
> See the ticket for details, there were a few replies already.
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
