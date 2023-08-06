Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6FF53B3
	for <regressions@lists.linux.dev>; Sun,  6 Aug 2023 15:58:26 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qSg92-0001dY-NT; Sun, 06 Aug 2023 17:58:16 +0200
Message-ID: <1315675b-295a-fd26-0e54-86cb6cdbbcf1@leemhuis.info>
Date: Sun, 6 Aug 2023 17:58:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ACPI: resource: revert "Remove "Zen" specific match and
 quirks"
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-acpi@vger.kernel.org, Mario Limonciello
 <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org
References: <20230806151453.10690-1-hdegoede@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20230806151453.10690-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1691337506;903c751e;
X-HE-SMSGID: 1qSg92-0001dY-NT

On 06.08.23 17:14, Hans de Goede wrote:
> Commit a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and
> quirks") is causing keyboard problems for quite a log of AMD based
> laptop users, leading to many bug reports.
> 
> Revert this change for now, until we can come up with
> a better fix for the PS/2 IRQ trigger-type/polarity problems
> on some x86 laptops.

Thx for this.

> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229165
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2229317
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217726

Not that it matters much, but there is at least one more:

https://lore.kernel.org/lkml/596b9c4a-fb83-a8ab-3a44-6052d83fa546@augustwikerfors.se/

> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I tend to think this is the right thing to do. But for completeness to
ensure everybody is aware of this: I'm pretty sure (Mario will know for
sure) this will cause a regression for a few users, because a9c4a912b7dc
was meant fixing a regression for them. Not sure how many users this
might affect, but I guess it are at least those linked to in a9c4a912b7dc:

https://bugzilla.kernel.org/show_bug.cgi?id=217336
https://bugzilla.kernel.org/show_bug.cgi?id=217406
https://bugzilla.kernel.org/show_bug.cgi?id=217394

I assume that could be avoided by adding quirk entries for their
machines. Some of the tickets have the data to do so.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
