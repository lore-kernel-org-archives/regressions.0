Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5C61863
	for <regressions@lists.linux.dev>; Fri,  3 Feb 2023 09:13:43 +0000 (UTC)
Received: from [46.183.103.8] (helo=[172.18.99.178]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pNs8W-0006Vz-Sx; Fri, 03 Feb 2023 10:13:36 +0100
Message-ID: <2445e228-37d0-ef64-7abf-bfa14e10f9cc@leemhuis.info>
Date: Fri, 3 Feb 2023 10:13:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, airlied@redhat.com,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
 <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1675415623;f6b5122d;
X-HE-SMSGID: 1pNs8W-0006Vz-Sx

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 05.01.23 13:28, Thorsten Leemhuis wrote:
> On 28.12.22 15:49, Diogo Ivo wrote:
>> Hello,
>>
>> Commit 2541626cfb79 breaks GM20B probe with
>> the following kernel log:
> Just wondering: is anyone looking on this? The report was posted more
> than a week ago and didn't even get a single reply yet afaics. This of
> course can happen at this time of the year, but I nevertheless thought a
> quick status inquiry might be a good idea at this point.

#regzbot fix: drm/nouveau/acr/gm20b: regression fixes
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

