Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9E7EA
	for <regressions@lists.linux.dev>; Wed,  4 Jan 2023 10:04:14 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pD0cx-0005pI-1g; Wed, 04 Jan 2023 11:04:07 +0100
Message-ID: <32ce10e7-62ff-92f1-cac4-00037a2110a5@leemhuis.info>
Date: Wed, 4 Jan 2023 11:04:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] acl updates for v6.2
Content-Language: en-US, de-DE
To: hooanon05g@gmail.com, Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221212111919.98855-1-brauner@kernel.org>
 <29161.1672154875@jrobl> <20221227183115.ho5irvmwednenxxq@wittgenstein>
 <16855.1672793848@jrobl>
From: "Linux kernel regression tracking (#info)" <regressions@leemhuis.info>
Reply-To: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <16855.1672793848@jrobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672826655;fc16cf06;
X-HE-SMSGID: 1pD0cx-0005pI-1g

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.01.23 01:57, hooanon05g@gmail.com wrote:
> Christian Brauner:
>> On Wed, Dec 28, 2022 at 12:27:55AM +0900, J. R. Okajima wrote:
> 	:::
>>> I've found a behaviour got changed from v6.1 to v6.2-rc1 on ext3 (ext4).
>>
>> Hey, I'll try to take a look before new years.
> 
> Now it becomes clear that the problem was on my side.
> The "acl updates for v6.2" in mainline has nothing to deal with it.
> Sorry for the noise.

In that case:

#regzbot resolve: turns out it was a local problem and not regression in
the kernel

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
-- 
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.
