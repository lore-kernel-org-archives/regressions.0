Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7D64F
	for <regressions@lists.linux.dev>; Fri,  4 Mar 2022 06:33:22 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nQ1VA-0002DE-HC; Fri, 04 Mar 2022 07:33:20 +0100
Message-ID: <02ef7552-67f5-dbcf-ece6-87b5b49e1bb5@leemhuis.info>
Date: Fri, 4 Mar 2022 07:33:20 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: rtw_8822ce wifi regression after kernel update from 5.15 to 5.16
To: Larry Finger <Larry.Finger@lwfinger.net>, Nico Sneck
 <snecknico@gmail.com>, Yan-Hsuan Chuang <tony0620emma@gmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-wireless@vger.kernel.org
References: <CAO_iuKEL8tHnovpGiQGUxg7JUpZFxHpxhOHbqAMgbt5R4Eftgg@mail.gmail.com>
 <2d1c129b-d473-39e3-69b7-6f36dc1682a6@leemhuis.info>
 <9312eb18-840f-9a1f-bcb0-8e3a43e45239@leemhuis.info>
 <236d45a6-8b88-c02e-a61d-ce1773fdb0ef@lwfinger.net>
Content-Language: en-US
In-Reply-To: <236d45a6-8b88-c02e-a61d-ce1773fdb0ef@lwfinger.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1646375603;5c41529d;
X-HE-SMSGID: 1nQ1VA-0002DE-HC

Hi, this is your Linux kernel regression tracker.

On 28.02.22 23:07, Larry Finger wrote:
> On 2/28/22 08:30, Thorsten Leemhuis wrote:
> [...]
>
> Your use of rtw_8822ce in the title finally registered on me. With that
> driver in use, that means that you are using my GitHub repo; however,
> newer kernels have the driver built in, but with names such as
> rtw88_8822ce. The difference in the name is deliberate.

Many thx for this, the names already had made me a bit suspicious, but
wasn't aware of this!

> If you want to
> use the GitHub version, you must blacklist the ones from the kernel.
> 
> To check this, run 'lsmod | grep 88'. If you see a mixture of rtw_xxx
> and rtw88_xxx, then this is your problem.

Nico didn't reply to your mail, so I'll assume for now that this is not
a kernel regression:

#regzbot invalid: seems it's a regression in a external module of
similar name

@Yan-Hsuan Chuang: sorry for the noise!

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.



