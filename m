Received: from mail.schwarzvogel.de (skade.schwarzvogel.de [157.90.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A032F47
	for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 17:04:30 +0000 (UTC)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
	(envelope-from <klausman@schwarzvogel.de>)
	id 1pLoBi-0012FE-2j;
	Sat, 28 Jan 2023 17:36:22 +0100
Date: Sat, 28 Jan 2023 17:36:22 +0100
From: Tobias Klausmann <klausman@schwarzvogel.de>
To: "Linux kernel regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Salvatore Bonaccorso <carnil@debian.org>, linux-input@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903
 (046d:c091) report too many non-hires events
Message-ID: <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
 <Y9VBz/GVZPqG3KwM@eldamar.lan>
 <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>

Hi! 

On Sat, 28 Jan 2023, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> On 28.01.23 16:39, Salvatore Bonaccorso wrote:
> > Let's loop in as well the regresssions list.
> 
> Thx for that.
> 
> TWIMC, I assume it's the same issue as this one:
> https://bugzilla.kernel.org/show_bug.cgi?id=216885

That is correct.

Best,
Tobias
