Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445B7A4D
	for <regressions@lists.linux.dev>; Sun, 16 Oct 2022 12:43:14 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ok2z0-0003bd-TA; Sun, 16 Oct 2022 14:43:10 +0200
Message-ID: <6e744247-60b8-febb-9cc6-5c24ff6e3019@leemhuis.info>
Date: Sun, 16 Oct 2022 14:43:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: BISECT result: 6.0.0-RC kernels trigger Firefox snap bug with
 6.0.0-rc3 through 6.0.0-rc7
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Phillip Lougher <phillip@squashfs.org.uk>, mirsad.todorovac@alu.unizg.hr
Cc: linux-kernel@vger.kernel.org, marcmiltenberger@gmail.com,
 regressions@lists.linux.dev, srw@sladewatkins.net, stable@vger.kernel.org
References: <8702a833-e66c-e63a-bfc8-1007174c5b3d@leemhuis.info>
 <20221015205936.5735-1-phillip@squashfs.org.uk>
 <2d1ca80c-1023-9821-f401-43cff34cca86@gmail.com>
 <b811fb3a-b5bb-bb0d-0cdf-e5bc0e88836f@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <b811fb3a-b5bb-bb0d-0cdf-e5bc0e88836f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1665924194;0309ee56;
X-HE-SMSGID: 1ok2z0-0003bd-TA

On 16.10.22 14:24, Bagas Sanjaya wrote:
> On 10/16/22 19:21, Bagas Sanjaya wrote:
>> On 10/16/22 03:59, Phillip Lougher wrote:
>>>
>>> Which identified the "squashfs: support reading fragments in readahead call"
>>> patch.

BTW, Phillip, sorry for specifying the wrong culprit in an earlier mail.

> Also, since this regression is also found on linux-6.0.y stable branch,
> don't forget to Cc stable list.

FWIW, that's afaics not needed (and actually slightly confusing I'd
say). That is only important when the problem was introduced in a stable
release to make the stable team aware of it, as then they might be
willing to revert the culprit if the problem is not present in mainline.

But this problem was introduced in the 6.0 mainline cycle and thus needs
to be fixed there first.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

P.P.S.:

#regzbot introduced: b09a7a036d2035b14636c
