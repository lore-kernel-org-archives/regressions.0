Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665D136C
	for <regressions@lists.linux.dev>; Thu, 24 Mar 2022 14:39:07 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nXOcB-0008Gh-To; Thu, 24 Mar 2022 15:39:04 +0100
Message-ID: <6569fcd6-0aec-00d6-2d34-0517962cc12e@leemhuis.info>
Date: Thu, 24 Mar 2022 15:39:03 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Regression from 3c196f056666 ("drm/amdgpu: always reset the asic
 in suspend (v2)") on suspend? #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <Ygf7KuWyc0d4HIFu@eldamar.lan>
 <CADnq5_MfR99OhjumQESCO7Oq+JVOHOVgyVQHX4FpGFDnPu6CyQ@mail.gmail.com>
 <5164225.DI6hChFYCN@ylum> <c62d4ba9-2214-ca7d-ee78-ee19a9bf51e6@free.fr>
 <CADnq5_MWqz7-XhOS4zfuzi3=_nKa72iYaO0BcKNcVDwEvZ+YHw@mail.gmail.com>
 <61c2b2ce-d749-3723-ad27-f40e1c49d967@leemhuis.info>
 <ba7faa48-68a5-41f9-9192-f843e17c5a07@free.fr>
 <41eaaf17-1456-5971-e7d9-e5ccc65bcf01@leemhuis.info>
In-Reply-To: <41eaaf17-1456-5971-e7d9-e5ccc65bcf01@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648132747;f01636ed;
X-HE-SMSGID: 1nXOcB-0008Gh-To

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

It looks a lot like Éric's issue is different. Marking this as resolved.

#regzbot fixed-by: 8a15ac1786c92dce

On 21.03.22 15:30, Thorsten Leemhuis wrote:
> On 21.03.22 13:07, Éric Valette wrote:
>> My problem has never been fixed.
>>
>> The proposed patch has been applied to 5.15. I do not remerber which version 28 maybe.
>>
>> I still have à RIP in pm_suspend. Did not test the Last two 15 versions.
>>
>> I can leave with 5.10 est using own compiled kernels.
>>
>> Thanks for asking.
> 
> This thread/the debian bug report
> (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1005005 ) is getting
> long which makes things hard to grasp. But to me it looks a lot like the
> problem you are facing is different from the problem that others ran
> into and bisected -- but I might be totally wrong there. Have you ever
> tried reverting 3c196f056666 to seem if it helps (sorry if that's
> mentioned in the bug report somewhere, as I said, it became long)? I
> guess a bisection from your side really would help a lot; but before you
> go down that route you might want to give 5.17 and the latest 5.15.y
> kernel a try.
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
