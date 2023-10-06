Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3884B63CC
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 08:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qogBm-0002gv-4v; Fri, 06 Oct 2023 10:28:02 +0200
Message-ID: <14ca8dd4-655f-4935-bf46-a9fbc024ad6f@leemhuis.info>
Date: Fri, 6 Oct 2023 10:28:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bluetooth issues since kernel 6.4 - not discovering other bt
 devices - /linux/drivers/bluetooth/btusb.c
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Erik_Dob=C3=A1k?= <erik.dobak@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAH7-e5sb+kT_LRb1_y-c5JaFN0=KrrRT97otUPKzTCgzGsVdrQ@mail.gmail.com>
 <ZRtWcgiH5JhD5NU2@debian.me>
 <CAH7-e5uspavg_VBJxKLOKJfU3nAq-OrPqzihF2opffY-ReiC-w@mail.gmail.com>
 <834062302e6a98e773dc4b03d7ed568a0f1c44fc.camel@nordicsemi.no>
 <CAH7-e5uZzmnFJAJrG664G6_JbK--DfbKC50aeVN5gMMxDJ51UA@mail.gmail.com>
 <ba7aaaed859ea2c4f5aac597deb382cceab33d65.camel@nordicsemi.no>
 <CAH7-e5unq6ggNjVkSsriUAmpvk4s7-NCYJrZnLK_3BjFO_Dceg@mail.gmail.com>
 <3e86e69c-64bc-4776-9ee8-75b98be1bf3e@leemhuis.info>
 <CAH7-e5v6jQyjeYDYr0zRXw_7XsdD1M2bbsBBcg0MZ3nZifhJ4g@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAH7-e5v6jQyjeYDYr0zRXw_7XsdD1M2bbsBBcg0MZ3nZifhJ4g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1696580884;5f76a96d;
X-HE-SMSGID: 1qogBm-0002gv-4v

On 05.10.23 17:11, Erik Dobák wrote:
> On Wed, 4 Oct 2023 at 07:20, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> On 03.10.23 18:10, Erik Dobák wrote:
>>> Sorry Tomasz,
>>>
>>> that must have been a reality glitch with your commit (cant find the
>>> page refering to your commit now). But yes it is probably a kernel bug
>>> as it manifests kernels 6.4 and not in the 6.1 LTS version.
>>
>> Could you then please try a bisection to get us closer to the problem?
>> You might want to try mainline (e.g. 6.6-rc4) first, with a bit of luck
>> the problem is fixed there already; FWIW, a few BT fixes that might or
>> might not be relevant for your case are heading that way and will most
>> likely be in 6.6-rc5.
> 
> after more than a day of netto compile time my bisection goes as following:
> kernelbuild:
>

That's not what I meant with a bisection. I...

> 
> I could compile the latest 6.2 kernel maybe things will get better and
> i can test again.
> But it seams that this is a pre 6.4 issue not like the article on the
> world wide interwebs says.
> In theory we could assume that it happened between 6.1latest-artix and
> 6.2first-vanilla
> 
> What do you propose now?

...meant a bisection between a working vanilla version (apparently 6.1 –
but ensure you try with vanilla first, maybe "latest-artix" contained
patches to make things work) using "git bisect". Such a bisection finds
the commit that broke things and often requires compiling ~15 kernels.

Ciao, Thorsten
