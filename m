Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56F0659
	for <regressions@lists.linux.dev>; Mon,  3 Jul 2023 05:18:41 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qGBxI-0001DO-Mx; Mon, 03 Jul 2023 07:18:32 +0200
Message-ID: <493448c9-7a76-532b-0f06-adf6b806ef5b@leemhuis.info>
Date: Mon, 3 Jul 2023 07:18:32 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: RCU stalls with wireguard over bonding over igb on Linux
 6.3.0+
Content-Language: en-US, de-DE
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>
References: <e5b76a4f-81ae-5b09-535f-114149be5069@gmail.com>
 <79196679-fb65-e5ad-e836-2c43447cfacd@gmail.com>
 <10f2a5ee-91e2-1241-9e3b-932c493e61b6@leemhuis.info>
 <CAHmME9onMWdJVUerf86V0kpmNKByt+VC=SUfys+GFryGq1ziHQ@mail.gmail.com>
 <ZKIlibX5wCgWlonq@debian.me> <ZKIt5vyc_HunicuZ@zx2c4.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZKIt5vyc_HunicuZ@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688361521;7c680d54;
X-HE-SMSGID: 1qGBxI-0001DO-Mx



On 03.07.23 04:09, Jason A. Donenfeld wrote:
> On Mon, Jul 03, 2023 at 08:34:01AM +0700, Bagas Sanjaya wrote:
>> On Sun, Jul 02, 2023 at 03:46:38PM +0200, Jason A. Donenfeld wrote:
>>> I've got an overdue patch that I still need to submit to netdev, which
>>> I suspect might actually fix this.
>>>
>>> Can you let me know if
>>> https://git.zx2c4.com/wireguard-linux/patch/?id=54d5e4329efe0d1dba8b4a58720d29493926bed0
>>> solves the problem?
>>
>> The reporter on Bugzilla [1] said it fixed the regression, so telling
>> regzbot:
>>
>> #regzbot fix: 54d5e4329efe0d
> 
> That's not correct.

Yeah, the gitsha will only work when it's stable.

> I tend to send patches to netdev@, not pulls, so the
> commit is going to be different. Just leave this alone for a bit and
> tidy things up once everything hits the main trees.

Kinda right, but otoh this makes things this slightly annoying bit
harder for regression tracking. But as the patch subject rarely changes,
this can usually be avoided by using:

#regzbot fix: wireguard: queueing: use saner cpu selection wrapping

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
