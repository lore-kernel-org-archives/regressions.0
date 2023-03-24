Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9937E
	for <regressions@lists.linux.dev>; Fri, 24 Mar 2023 07:40:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pfc1w-0008LS-OO; Fri, 24 Mar 2023 08:40:08 +0100
Message-ID: <9ba211dc-4f9e-e5a0-4f71-4db256ec1196@leemhuis.info>
Date: Fri, 24 Mar 2023 08:40:08 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [regression] Bug 217225 - can no longer alter /proc/acpi/ibm/fan
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Hans de Goede <hdegoede@redhat.com>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <fc081e0f-2b58-b169-5ac1-f7845f48d1bf@leemhuis.info>
In-Reply-To: <fc081e0f-2b58-b169-5ac1-f7845f48d1bf@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679643612;c69599ae;
X-HE-SMSGID: 1pfc1w-0008LS-OO

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.03.23 10:13, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developers don't keep an eye on it, I decided to forward it by
> mail (note, the reporter *is not* CCed to this mail, see[1]).
> 
> Note, it's a stable regression, so it's a bit unclear who's responsible.
> I decided to forward it nevertheless, as some of you might want to be
> aware of this or might even have an idea what's wrong.
> 
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217225 :

Turned out it was a configuration error. Many thx to Hans helping the
user figuring this out.

For details see:
https://bugzilla.kernel.org/show_bug.cgi?id=217225#c10

#regzbot resolve: configuration error due to changes on the distro side
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
