Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78140405CE
	for <regressions@lists.linux.dev>; Tue, 14 Nov 2023 13:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3090BC433C7;
	Tue, 14 Nov 2023 13:55:30 +0000 (UTC)
Date: Tue, 14 Nov 2023 08:55:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Milian
 Wolff <milian.wolff@kdab.com>, akaher@vmware.com,
 akpm@linux-foundation.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, mark.rutland@arm.com, mhiramat@kernel.org
Subject: Re: NULL pointer dereference regression when running `chmod -R
 root:tracing /sys/kernel/debug/tracing`
Message-ID: <20231114085529.77099439@rorschach.local.home>
In-Reply-To: <2053f011-3c85-41e2-8685-1f46a2bc5fb8@leemhuis.info>
References: <20231105160139.660634360@goodmis.org>
	<20231112104158.6638-1-milian.wolff@kdab.com>
	<2053f011-3c85-41e2-8685-1f46a2bc5fb8@leemhuis.info>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Nov 2023 14:38:57 +0100
"Linux regression tracking #adding (Thorsten Leemhuis)" <regressions@leemhuis.info> wrote:

> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
> 
> On 12.11.23 11:41, Milian Wolff wrote:
> > 
> > this patch seems to have introduced a kernel bug causing
> > a NULL pointer dereference when one runs:
> > 
> >     sudo chown -R root:tracing /sys/kernel/debug/tracing/
> > 
> > See the archlinux bug report I created initially for some more information:
> > https://bugs.archlinux.org/task/80230
> > 
> > With 6.6.1 and 9aaee3eebc91dd9ccebf6b6bc8a5f59d04ef718b reverted,
> > the above `chmod` command works. With a normal 6.6.1 build, or re-applying
> > the patch again, the command fails and `dmesg` shows:  
> 
> Steven is already working on this, but to ensure the issue doesn't fall
> through the cracks unnoticed, I'm adding it to regzbot, the Linux kernel
> regression tracking bot (and from the context I assume it happens in
> mainline as well)

Note, the code in question was rewritten in 6.7 and the bug does not
exist there. It only exists in 6.6 and I already sent Greg the patch,
and he told me that it's in his queue.

It's only a regression in 6.6 and not in mainline.

-- Steve

