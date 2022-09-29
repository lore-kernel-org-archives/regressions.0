Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484531C13;
	Thu, 29 Sep 2022 13:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C937AC433C1;
	Thu, 29 Sep 2022 13:46:40 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:47:53 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Artem S.
 Tashkinov" <aros@gmx.com>, workflows@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>, ksummit@lists.linux.dev
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20220929094753.6bba89d8@gandalf.local.home>
In-Reply-To: <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
	<05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 29 Sep 2022 13:33:53 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

Thanks Thorsten for doing this.

> >  * In the kernel summit sessions (recording:
> > https://youtu.be/e2SZoUPhDRg?t=5370 ) Len Brown stated that he and
> > fellow ACPI/PM developers rely on bugzilla.kernel.org and would need
> > some replacement if it's decommissioned.
> > 

I also use bugzilla.kernel.org with trace-cmd/kernelshark and the
libraries, although I don't really use it for the Linux tracing subsystem
(but I probably should :-/).

That is, the tools portion of bugzilla is not part of the MAINTAINERS file
(that I know of), so probably shouldn't be affected by this.

-- Steve

