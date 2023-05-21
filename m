Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747703D3B6
	for <regressions@lists.linux.dev>; Sun, 21 May 2023 11:43:03 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q0h7l-0004k3-6q; Sun, 21 May 2023 13:21:17 +0200
Message-ID: <99b996f5-b25c-3d4a-5e2f-2d7cc20bfa31@leemhuis.info>
Date: Sun, 21 May 2023 13:21:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: Fwd: Linux 6.3.1 + AMD RX 570 on ppc64le 4K: Kernel attempted to
 read user page (1128) - exploit attempt? (uid: 0)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux for PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux AMDGPU <amd-gfx@lists.freedesktop.org>
References: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <588c1a66-9976-c96f-dcdd-beec8b7410f0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1684669383;5f74da10;
X-HE-SMSGID: 1q0h7l-0004k3-6q

/me removes a few people from CC, as this thread already annoyed a few
people

On 11.05.23 10:06, Bagas Sanjaya wrote:
> 
> I notice a regression report on bugzilla ([1]). As many developers
> don't keep an eye on it, I decide to forward it by email.
> [...] 
> #regzbot introduced: v6.2..v6.3 https://bugzilla.kernel.org/show_bug.cgi?id=217427
> #regzbot title: No video output from AMD RX 570 and kernel exploit attempt on ppc64le

per https://gitlab.freedesktop.org/drm/amd/-/issues/2553#note_1911308

#regzbot fix: 3cf7cd3f770a0b89dc
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

