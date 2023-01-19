Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED1A93E
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 16:43:11 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pIY0I-0004b9-TV; Thu, 19 Jan 2023 17:43:06 +0100
Message-ID: <33cdaf9b-49ce-a98b-350e-5885343d10b4@leemhuis.info>
Date: Thu, 19 Jan 2023 17:43:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: Chris Clayton <chris2553@googlemail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
 <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
In-Reply-To: <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674146591;9847421a;
X-HE-SMSGID: 1pIY0I-0004b9-TV

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 19.01.23 15:33, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> On 18.01.23 21:59, Chris Clayton wrote:
>>
>> 	# first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
>> (VPR scrubber)
>
> #regzbot ^introduced e44c2170876197

/me wonders if he failed to spot or cut'n'paste the leading 0
/me wonders if he needs glasses
#sigh

Sorry for the noise!

#regzbot 0e44c21708761977dc

> #regzbot title drm: nouveau: hangs on poweroff/reboot
> #regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
