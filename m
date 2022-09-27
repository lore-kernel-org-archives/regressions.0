Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09F7E1
	for <regressions@lists.linux.dev>; Tue, 27 Sep 2022 09:34:05 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1od6yZ-0008Ig-Mj; Tue, 27 Sep 2022 11:34:03 +0200
Message-ID: <924fb318-efd0-91f5-0526-b343c97e8660@leemhuis.info>
Date: Tue, 27 Sep 2022 11:34:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [Bug] [Deadlock] Kernel thread deadlock in rfcomm socket release
 when connect interrupted #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev
Cc: linux-bluetooth@vger.kernel.org
References: <CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com>
 <24e95c8b-dc05-0d00-50bb-58b71c5baf94@molgen.mpg.de>
 <CAD+dNTuRThoa2OSzQ27tENB29GJ4oD0j3D+P4k42HzopEeTJMw@mail.gmail.com>
 <CAD+dNTsqBEjzG7BinKtxveH9faJqss89WPufbSsaB5FZRDgOPA@mail.gmail.com>
 <ef7a1421-06c5-f3b7-8c7f-7fdfd7862c96@molgen.mpg.de>
 <e7c8127a-d561-3a3d-f208-770f3abbee17@leemhuis.info>
 <CAD+dNTsnVpyFKyZcAgnqAZz-e2upjFd3NGWV=hPhywL8k0g6Nw@mail.gmail.com>
 <6c0f6043-8aa0-2516-38de-b2b9f4a22401@leemhuis.info>
In-Reply-To: <6c0f6043-8aa0-2516-38de-b2b9f4a22401@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1664271245;b42bbcb2;
X-HE-SMSGID: 1od6yZ-0008Ig-Mj

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 13.09.22 17:37, Thorsten Leemhuis wrote:
> 
> On 13.09.22 16:20, Peter Sutton wrote:
>>>  a fix for a deadlock for RFCOMM sk state change was posted last year already:
>>>
>>> https://lore.kernel.org/all/20211004180734.434511-1-desmondcheongzx@gmail.com/
>>>
>>> It seems it never went anywhere, unless I'm missing something. Is that
>>> maybe the same problem or somehow related?
>>
>> I mentioned this on the Arch Linux Matrix channel. The `linux` package
>> maintainer said they had encountered the same and added the linked
>> patch to the Arch Linux kernel package but removed it because it
>> wasn't merged (which explains why my issue went way then came back).
>> Anyway, we compiled a 5.19.8 `linux` package with the patch (which
>> fixes my issue) and they said they'll add the patch back to the linux
>> package.
> 
> Well, that's fine and hopefully will solve your issue soon, but the arch
> maintainers are right: this should be fixed upstream.
> 
> Luiz, is there a reason why that patch wasn't merged? What is needed to
> get this merged, ideally while adding a "Link:
> https://lore.kernel.org/all/CAD+dNTsbuU4w+Y_P7o+VEN7BYCAbZuwZx2+tH+OTzCdcZF82YA@mail.gmail.com/"
> tag?

#regzbot fixed-by: 812e92b824c1db16

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
