Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9E72
	for <regressions@lists.linux.dev>; Tue,  8 Jun 2021 11:59:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F9AC6124B;
	Tue,  8 Jun 2021 11:59:32 +0000 (UTC)
Date: Tue, 8 Jun 2021 13:59:28 +0200
From: Christian Brauner <christian.brauner@ubuntu.com>
To: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	regressions@lists.linux.dev,
	Andrea Righi <andrea.righi@canonical.com>
Subject: Re: Regression when writing to /proc/<pid>/attr/
Message-ID: <20210608115928.5ocvtyoekxa2a6vw@wittgenstein>
References: <20210607142245.eikvyeacqwwu6dn3@wittgenstein>
 <202106071621.C11535A@keescook>
 <CAHk-=wg8Bqjf8vxythgN9EV-XTttf7GXeus14kDkVZuUwLibrw@mail.gmail.com>
 <202106071856.5D68C05638@keescook>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202106071856.5D68C05638@keescook>

On Mon, Jun 07, 2021 at 07:15:36PM -0700, Kees Cook wrote:
> On Mon, Jun 07, 2021 at 05:02:28PM -0700, Linus Torvalds wrote:
> > On Mon, Jun 7, 2021 at 4:38 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > I'm assuming the issue is the latter (open, drop privs, write). And
> > > I assume fsuid/fsgid has changed? (i.e. cred_fscmp() couldn't be used
> > > either?)
> > 
> > Hmm. Do we have some place to hide self_exec_id at open time, and then
> > just verify that it's still the same at IO time?
> > 
> > IOW, replace that f_cred comparison with a "self_exec_id has not
> > changed" comparison instead?
> 
> I think we can't use self_exec_id because the original flaw could just
> be changed to have the parent open two children (the fd opener and the
> victim), which would have the same self_exec_id.

Hm, but doesn't the mm check have the same problem? It's not checking
the mm of the opener against the mm of the writer. To stay with the
example in this thread, it's checking the mm of the <attached process>
at open time against the mm of the <attached process> at write time if I
read this correctly.

> 
> > Perhaps squirrel it away in file->f_private? Or are we already using
> > that (didn't check)?
> 
> But we can do tracking via file->private_data since the attr files don't
> use a custom opener. I think an mm_struct comparison is likely what's
> needed here? (This is actually what several of these special proc files

So ok, looking at your original fix it tried to make sure that the
credentials stay invariant during open and write time, i.e. only the
opener can write. The main worry being that a process with more
privileges could potentially be tricked into writing say an lsm profile
for itself it didn't want to.

This solution would mean for the example in this thread that f_cred
would be set to the creds of the <initial process> and would then be
compared to the creds of the <attached process>. Which is how this
regression happens. Afaict, any non-threaded scenario where one process
opens an attr fd and sends it to another one to write would be broken. :)

Iiuc, your mm change does something different now. __mem_open() records
the mm of the <attached process> during open and then compares it
against the <attached process> mm during write. And only if they match
are you allowed to write. So the semantics change from enforcing the
writer be the opener to the writer not having changed mm.

Just for the record, this still implies that if a process calls
unshare(CLONE_VM) and then writes its LSM profile afterwards it will
fail where it would have succeeded before. It's probably a very rare
scenario so it's probably fine but still.

But afaiu, the mm check is about making sure that the <attached process>
hasn't execed and thus changed creds that way in between the open and
the write. So in that case wouldn't a self_exec_id check indeed be
simpler?

Christian
