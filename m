Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA9C20EC
	for <regressions@lists.linux.dev>; Mon,  2 Jan 2023 07:25:49 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pCFCd-0001cX-3d; Mon, 02 Jan 2023 08:25:47 +0100
Message-ID: <e713f86b-1a05-c416-9415-e02fbd95f308@leemhuis.info>
Date: Mon, 2 Jan 2023 08:25:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] acl updates for v6.2 #forregzbot
Content-Language: en-US, de-DE
To: "J. R. Okajima" <hooanon05g@gmail.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 linux-fsdevel@vger.kernel.org
References: <20221212111919.98855-1-brauner@kernel.org>
 <29161.1672154875@jrobl> <2aa5cc7e-ca00-22a7-5e2f-7eb73556181e@leemhuis.info>
 <25986.1672603666@jrobl>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <25986.1672603666@jrobl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672644349;d91cca6d;
X-HE-SMSGID: 1pCFCd-0001cX-3d



On 01.01.23 21:07, J. R. Okajima wrote:
> Thorsten Leemhuis:
>> Thanks for the report. To be sure below issue doesn't fall through the
>> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
>> tracking bot:
> 
> Hold it!
> I'm not sure whether this is a regression or a bugfix. Or even it maybe
> a problem on my side. I'm still struggling to find out the reproducible
> way.

Don't worry about that, it's way easier to keep track of a potential
regression by just adding it to the tracking and later removing it, if
it turns out to not be a regression.

BTW, xfstests found a acl issue on ext4, too:
https://lore.kernel.org/lkml/202212291509.704a11c9-oliver.sang@intel.com/

I have no idea at all if this might be related, as this is not my area
of expertise, I just thought you might want to know about that.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr

Did I miss something or do something stupid? Then reply and tell me:
https://linux-regtracking.leemhuis.info/about/#stupid
