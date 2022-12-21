Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0E1FB3
	for <regressions@lists.linux.dev>; Wed, 21 Dec 2022 08:23:32 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7uNo-0002Z7-Op; Wed, 21 Dec 2022 09:23:24 +0100
Message-ID: <26bd2928-9d62-32b3-4f9f-9dd9293cefeb@leemhuis.info>
Date: Wed, 21 Dec 2022 09:23:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: BUG: arm64: missing build-id from vmlinux
Content-Language: en-US, de-DE
To: Masahiro Yamada <masahiroy@kernel.org>, Will Deacon <will@kernel.org>
Cc: linux-arch@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kernel@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
References: <CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAABkxwuQoz1CTbyb57n0ZX65eSYiTonFCU8-LCQc=74D=xE=rA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671611012;7c97dae8;
X-HE-SMSGID: 1p7uNo-0002Z7-Op

Hi, this is your Linux kernel regression tracker. CCing the regression
mailing list, as it should be in the loop for all regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html

On 18.12.22 21:51, Dennis Gilmore wrote:
> The changes in https://lore.kernel.org/linux-arm-kernel/166783716442.32724.935158280857906499.b4-ty@kernel.org/T/
> result in vmlinux no longer having a build-id.

FWIW, that's 994b7ac1697b ("arm64: remove special treatment for the link
order of head.o") from Masahiro merged through Will this cycle.

> At the least, this
> causes rpm builds to fail. Reverting the patch does bring back a
> build-id, but there may be a different way to fix the regression

Makes me wonder if other distros or CIs relying on the build-id are
broken, too.

Anyway, the holiday season is upon us, hence I also wonder if it would
be best to revert above change quickly and leave further debugging for 2023.

Masahiro, Will, what's your option on this?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

#regzbot ^introduced 994b7ac1697b
#regzbot title arm64: missing build-id in vmlinux breaks at leas
Fedora's kernel packaging
#regzbot ignore-activity
