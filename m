Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BCD107B4
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 17:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B4D9C433C7;
	Mon, 10 Jul 2023 17:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689009390;
	bh=MqOW2M+FkW5a5sgAu73T5iHV7N8UuHF3eSn9x4ulp9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEaEjmNhYsi1socPRthS6VwOPYNayJ6S3042CdPxkBlblz4MxVSIchN9a4A9uIeSw
	 xTpSvo8HbaF2QOMpzAmWXdqt9bSsLZAsI8eR06fY67EM1XCwK+76SHcm0z73V8MR7Q
	 5TVQR0AEbcxZSwVaWxwIHcXA7ecQwmpwa8/N51C6J2hTe583ofrv2vH2IIqqVqbidm
	 XtBpCteBl5EFeG1exU2FEIGqaBGGDf8z7YxTr5cG+k6yNkrKbsq7v3zFOjU4IJOeOf
	 UwXmqiYdbbaWK4JUp2Jq8JVUzwJlZjULQDDIkFQwIMjzH1BSs26pQZQ4ocJrVi7oWS
	 0FuQ8UfFW82Jw==
Date: Mon, 10 Jul 2023 10:16:28 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: build failure after commit eb0481bbc4ce ("objtool: Fix
 reloc_hash size")
Message-ID: <20230710171628.vo4azoabe26kepij@treble>
References: <20230628115825.ahqejf5y4hgxhyqj@lion.mk-sys.cz>
 <fb93d107-c834-1849-2b14-1dd33c4f9955@leemhuis.info>
 <20230709140929.5sdcvyqquotkn752@carpenter>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230709140929.5sdcvyqquotkn752@carpenter>

On Sun, Jul 09, 2023 at 05:09:29PM +0300, Michal Kubecek wrote:
> On Sat, Jul 08, 2023 at 03:40:50PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > On 28.06.23 13:58, Michal Kubecek wrote:
> > > 
> > > this morning, mainline kernel builds started to fail on my desktop like
> > > this:
> > > 
> > >   mike@lion:~/work/git/kernel-upstream> mkdir /srv/ram/kobj
> > >   mike@lion:~/work/git/kernel-upstream> make -j24 CC=gcc-13 O=/srv/ram/kobj defconfig >/dev/null
> > >   mike@lion:~/work/git/kernel-upstream> make -j24 CC=gcc-13 O=/srv/ram/kobj all >/dev/null
> > >   net/ipv4/netfilter/iptable_nat.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/xt_mark.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/xt_nat.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/xt_LOG.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/xt_MASQUERADE.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/nf_log_syslog.o: warning: objtool: mmap fail reloc
> > >   net/netfilter/xt_addrtype.o: warning: objtool: mmap fail reloc
> > >   fs/efivarfs/efivarfs.o: warning: objtool: mmap fail reloc
> > >   drivers/thermal/intel/x86_pkg_temp_thermal.o: warning: objtool: mmap fail reloc
> > >   vmlinux.o: warning: objtool: mmap fail reloc
> > >   incomplete ORC unwind tables in file: vmlinux
> > >   Failed to sort kernel tables
> > >   make[2]: *** [/home/mike/work/git/kernel-upstream/scripts/Makefile.vmlinux:35: vmlinux] Error 1
> > >   make[2]: *** Deleting file 'vmlinux'
> > >   make[1]: *** [/home/mike/work/git/kernel-upstream/Makefile:1256: vmlinux] Error 2
> > >   make: *** [Makefile:226: __sub-make] Error 2
> > > 
> > > I bisected the failure to commit
> > > 
> > >   eb0481bbc4ce ("objtool: Fix reloc_hash size")
> > > 
> > > I also tried gcc11 and building on a normal filesystem (rather than
> > > tmpfs) but the result is still the same. Different configurations (e.g.
> > > allmodconfig) only show more modules with "mmap fail reloc". The machine
> > > has 64 GB of RAM and both ulimit -m and ulimit -v show "unlimited".
> > > Anything idea what else I should try?
> > 
> > Michal, thx for the report. Please correct me if I'm wrong: this as of
> > now is unfixed, as your patch to fix is afaics wasn't merged yet (at
> > least I can't see it even in next, but I might be missing something).
> 
> Yes, the fix has not been merged yet and current master (commit
> 1c7873e33645) still shows the issue.

Should be fixed in the tip tree with the following patch:

https://lkml.kernel.org/lkml/168897683429.404.6801969953192508868.tip-bot2@tip-bot2


> 
> Michal
> 
> > Hence adding it to the regression tracking now that the end of the merge
> > window is near:
> > 
> > #regzbot ^introduced eb0481bbc4ce
> > #regzbot title objtool: build failure
> > #regzbot monitor:
> > https://lore.kernel.org/all/20230629102051.42E8360467@lion.mk-sys.cz/
> > #regzbot fix: objtool: initialize all of struct elf
> > #regzbot ignore-activity



-- 
Josh
