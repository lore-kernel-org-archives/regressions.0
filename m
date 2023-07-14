Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5C20E8
	for <regressions@lists.linux.dev>; Fri, 14 Jul 2023 14:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A055DC433C8;
	Fri, 14 Jul 2023 14:00:21 +0000 (UTC)
Date: Fri, 14 Jul 2023 10:00:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: <kkabe@vega.pgw.jp>
Cc: regressions@lists.linux.dev, bagasdotme@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: radeon.ko/i586: BUG: kernel NULL pointer dereference,
 address:00000004
Message-ID: <20230714100019.6bf9b1ab@gandalf.local.home>
In-Reply-To: <230714143404.M0123570@vega.pgw.jp>
References: <55a3bbb1-5b3c-f454-b529-8ee9944cc67c@leemhuis.info>
	<230714143404.M0123570@vega.pgw.jp>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 14:34:04 +0900
<kkabe@vega.pgw.jp> wrote:

> >> > So I'm confused about why it's mentioned. Was it backported?  
> >> 
> >> Taketo Kabe, could you please help to clean this confusion up? Did you
> >> mean 5.19 in https://bugzilla.kernel.org/show_bug.cgi?id=217669#c5 ? And
> >> BTW: did you really use a vanilla kernel for your bisection?  
> 
> 
> Reporter Me:
> I bisected using freedesktop.org kernel tree, which git commit ID is
> in sync with kernel.org
> but version number in ./Makefile could be slighty behind. 
> 
> Patch in
> https://bugzilla.kernel.org/show_bug.cgi?id=217669#c4
> fixed the problem in freedesktop.org kernel 5.18.0-rc2 .
> This may explain that in kernel.org tree, the said commit is in kernel-5.19.

Even if the bisect did land on this commit, it doesn't make sense. I would
think that one of the results of the bisect was incorrect (a pass that
should have failed?), as that would lead the bisect down to the wrong
conclusion.

Now if you you remove this commit and everything works fine, and add it
back again and it fails reliably, then I can't argue it is not the commit.

But the commit in question kicks off a worker thread at boot up to search
for weak functions that were tagged to be traced by the function tracer and
sets them to "disabled" to never be traced.

Is the function tracer used at all here? I really do not see how this
commit affects the code that is crashing. Unless there's something wrong
with the way the kworker was set up and it corrupted other kworkers :-/

-- Steve
