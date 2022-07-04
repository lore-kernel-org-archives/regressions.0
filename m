Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060923B5
	for <regressions@lists.linux.dev>; Mon,  4 Jul 2022 09:29:37 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o8IOX-0004ho-J4; Mon, 04 Jul 2022 11:29:29 +0200
Message-ID: <19fa2473-467f-92cd-dad2-1a8ab17f3bed@leemhuis.info>
Date: Mon, 4 Jul 2022 11:29:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: regression, 5.19.0-rc1 not powering off when hibernated
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: linux-kernel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <YqE22nS9k2+AldI6@llamedos.localdomain>
 <84d01637-febb-f602-2d03-fe1600e85ae3@leemhuis.info>
 <8d5b1411-09a9-565b-89eb-0d7675170d89@leemhuis.info>
In-Reply-To: <8d5b1411-09a9-565b-89eb-0d7675170d89@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656926977;64cc87b3;
X-HE-SMSGID: 1o8IOX-0004ho-J4



On 17.06.22 08:43, Thorsten Leemhuis wrote:
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 11.06.22 15:53, Thorsten Leemhuis wrote:
>> On 09.06.22 01:55, Ken Moffat wrote:
>>> Up to 5.18.0 hibernation has worked ok on my ryzen 5 3400G : screen
>>> blanks, disk activity for the write to swap, screen briefly has a
>>> trashed display, machine powers off.  When powering up from
>>> hibernation, after the saved files are loaded X starts with a
>>> briefly trashed display before my desktop reappears.
>>>
>> #regzbot ^introduced v5.18..v5.19-rc1
> 
> #regzbot introduced 98f30d0ecf79da8cf17a171fa4cf6eda7ba4dd71

#regzbot fixed-by: 202773260023b5

