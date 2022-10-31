Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA3417F4
	for <regressions@lists.linux.dev>; Mon, 31 Oct 2022 09:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F4AC433D6;
	Mon, 31 Oct 2022 09:48:39 +0000 (UTC)
Date: Mon, 31 Oct 2022 05:48:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION 6.0.x / 6.1.x] NULL dereferencing at tracing
Message-ID: <20221031054837.3a101e75@rorschach.local.home>
In-Reply-To: <87h6zklb6n.wl-tiwai@suse.de>
References: <87h6zklb6n.wl-tiwai@suse.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Oct 2022 08:11:28 +0100
Takashi Iwai <tiwai@suse.de> wrote:

> Hi Steven,
> 
> we've got a bug report indicating the NULL dereference at the recent
> tracing changes, showing at the start of KDE.  The details including
> the dmesg are found at:
>   https://bugzilla.opensuse.org/show_bug.cgi?id=1204705
> 
> It was reported at first for 6.0.3, and confirmed that the problem
> persists with 6.1-rc, too.
> 
> The culprit seems to be the commit
> f3ddb74ad0790030c9592229fb14d8c451f4e9a8
>     tracing: Wake up ring buffer waiters on closing of the file
> and reverting it seems fixing the problem.
> 
> Could you take a look?
> 

Thanks for the report, can you send me your .config.

Thanks!

-- Steve
