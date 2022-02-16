Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D42904
	for <regressions@lists.linux.dev>; Wed, 16 Feb 2022 14:33:13 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nKLMl-0002zq-Dx; Wed, 16 Feb 2022 15:33:11 +0100
Message-ID: <0db6e3b0-aefb-2896-17d5-fe7aee8d91e6@leemhuis.info>
Date: Wed, 16 Feb 2022 15:33:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Dual monitor with amd 5700 causes system to,hang at startup (fwd
 from bugzilla) #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <99dc2b1f-2c46-04fb-86ea-92a748e495de@leemhuis.info>
In-Reply-To: <99dc2b1f-2c46-04fb-86ea-92a748e495de@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645021993;2b056f37;
X-HE-SMSGID: 1nKLMl-0002zq-Dx

#regzbot fixed-by: c1af59449d80a4f64

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 22.01.22 09:56, Thorsten Leemhuis wrote:
> Lo! There is a regression dealt with in bugzilla I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.15.8..v5.15.13
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215511
> #regzbot from: Jose Mestre <pmestre@gmail.com>
> #regzbot title: drm: amdgpu: Dual monitor with amd 5700 causes system to
> hang at startup.
> 
> Note: also present in 5.16.1
> 
> Quote:
> 
>> Hello, system mostly crashes (sometimes in different ways) when i
>> start with more than one monitor attached.
>>
>> If i switch off one monitor then system boots correctly (i don't need
>> to detach the displayport cable, just to switch off the monitor).
>>
>>
>> When both monitors are connected, most of the times it just crashes
>> as the attached log, sometimes it boots but screen is flickering and
>> with artifacts.
>>
>> This happened with kernel 5.10 and 5.11, it was fixed i don't
>> remember exactly when, and is happening again. For me it worked with
>> kernel 5.15.8 and failed with 5.15.13. It is still failing with
>> 5.16.1.
>>
>> Kind regards and many thanks for your work in the most crucial
>> open-source project.
> 
> Ciao, Thorsten
> 
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
