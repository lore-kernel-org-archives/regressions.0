Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD0510FE
	for <regressions@lists.linux.dev>; Wed, 20 Apr 2022 10:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC5EC385A0;
	Wed, 20 Apr 2022 10:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650450682;
	bh=VATqHpxy4xhyHxhfLQ62wyl7CnEWwvltNAvm4ld1EQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uh5gJB3axqdKC5OsivTse8L4a7Jij90v2MJSBj/nQGBUO5CgTBhN4wsVNnFzlHy21
	 m/upJaNGtunQ9DdX4OQJ+5KpQ5sga4HsG2MzmadYls3bbCG3lIuV3lmPd4Al2nDxeE
	 t6dz+E4Xh2JFatRiw7FH4e3o9nPSSHNNkBAhGSQH91h+EwyYYQ4hkaR/5a1L2/N3nu
	 JjmZ1u3th3JBvHqG8F7OhYQRm/RtMOQsSO2G3LaxURuQTzw0/+5BQsXZnRdCVUJgLF
	 04qV6ao7eo3aobR8EWlrGPU1XVuWVVWONwT8GmqvwD3A4HO4wo5SNU7BQ4thrqkM/S
	 zaAmJmg5i4PdQ==
Message-ID: <acccdf28-3c5d-a81b-8e3a-f72e0f46149c@kernel.org>
Date: Wed, 20 Apr 2022 12:31:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: A lot of regression reports submitted to bugzilla.kernel.org are
 apparently ignored, even bisected ones
Content-Language: en-US
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 workflows@vger.kernel.org
References: <6808cd17-b48c-657d-de60-ef9d8bfa151e@leemhuis.info>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <6808cd17-b48c-657d-de60-ef9d8bfa151e@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/04/2022 14:35, Thorsten Leemhuis wrote:
> Hi! TLDR: I looked closer at every ticket filed in bugzilla.kernel.org
> over a time span of two weeks to see how well reports are handled, in
> particular those for kernel regressions. The results of this rough
> analysis are kinda devastating from my point of view. I for example
> found 8 tickets describing a regression where the reporter had even
> bisected the problem, but nevertheless the ticket afaics didn’t get a
> single reply or any other reaction from a regular kernel developer
> within about a week; in fact out of a total of 20 reports that looked
> like regressions to me (17 if you exclude tickets where the reporter
> used an afaics lightly patched distro kernel), only one got a helpful
> reply from a developer within a week. 

To respond, developer would first had to be notified. Did it happen? Or
just some default assignee got automated notification?

> That makes us miss valuable
> reports and puts our "no regressions" rule into a bad light. Hence,
> something IMHO should be done here to improve the situation, but I'm not
> sure myself what exactly -- that's why I'm writing this mail. A better
> warning on bugzilla’s frontpage suggesting to report issues by mail
> maybe? And/or disable all bugzilla products and components where it's
> not clear that somebody will be looking at least once at submitted tickets?

I find such Bugzilla useless - the Components are not matching reality,
Products look ok except missing really a lot. Does it have proper
assigners based on maintainers? Nope. At least not everywhere.

All the bug or issue reports I get via email and I think I am not alone
in this. All automated tools (kbuild, kernelCI) are using emails for bug
reporting. Why having one more system which seems not up to date?

The only reliable and up to date information we have in maintainers
file: who is responsible and whom to CC (e.g. lists).

I can give example from my domain:
https://bugzilla.kernel.org/show_bug.cgi?id=210047

This is clearly issue for me but there is no way I was notified about
this. I just found it by using the keyword from maintainers. Wrong
mailing list as Assignee, no CC to me. Such bug reports will be missed
because there is no way I can receive information about them. Why then
providing interface for bug reports which by design will not reach the
respective person?

Best regards,
Krzysztof
