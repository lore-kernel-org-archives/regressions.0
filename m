Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003AE18F2FA
	for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724155679; cv=none; b=avWFiN1lRjWPhGcLOOK3+7l6DpLn19oUEoCk67RHLIAVugPbs2qGl0MaEoEB7kOAW47zTlfFvPtsGAgviXT6l0ToVRqsu2JMx5DDWsVZ17LANv48lGH77sgeHw2SyhR8B5igA1VIJZWIb5gDFAwWmUK0URYPPL1g+nETLoy/DJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724155679; c=relaxed/simple;
	bh=U6X1jUGTNDoSPZFLySJaq842SmPOG2aRkDa3Sxm4K34=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UH8Lc+ikMrQz/7R5fsC/ie85sfZszpkPPB31TJKeoNzTciRzJP2A2AANrCGrgmX8dKuBM/AutC+RmrCs6I6cfHrf35MUMnjbC671F48O5PCSousi2jYnhfR1Y9NaA7nEqx5XsciZfe/XXBWjmb/EnKz2AdDnufbpGLAaz9P4BC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cvrGP7Sn; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cvrGP7Sn"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5becfd14353so4248628a12.1
        for <regressions@lists.linux.dev>; Tue, 20 Aug 2024 05:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724155674; x=1724760474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzCrzUMExiNjBpbJiLrzgmZv2V7Mgy2BOq9tPB3npWg=;
        b=cvrGP7SnIJ4+7PGeCAOcjVrnXiGg8TZj4YpXK+eeuhQTq68Q+PUBFuwc3q6RMU5XHv
         Z9WXWQ8a9m3opXQNoVemiyNes6PwS97l1QjhL7zjW2vz9icC/0lF4/M5KEqvvtxq60fq
         qJ04kmqqMTUdODry2fmG5IbhinKil8CzA6iABT/lgTymwNrYSthjP/A2FqB+CoXxsP5w
         R5aSEYl/tc/IbEfAnhQzkw64H7VQUe+C1d1LpdWwUlLZ3f5UIjdQ+iF0trJ20kPERhB3
         yNlAlUqWscPCzhsrCJB1yRrjTlQCl3QCf+9Wqdn8o0qYIZYZCmc+ZZFmTQttw8lSJBQW
         SP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724155674; x=1724760474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzCrzUMExiNjBpbJiLrzgmZv2V7Mgy2BOq9tPB3npWg=;
        b=wZHFXeK5ETDivx05ypGnQgpWzXgKNph2GYAJ0uWGm9u2Y6C6eS9X62HkMucjfayZB5
         axFn4s1AblZ4yA86YYLnTw//mKULVtcO8WBU18KYuQaVIcAHUURaDuj5pbOLWc3mmwNS
         xJTepujxG/UTGuKFvEWDWwEiDmHkae5r1px5rV3EJF4vYuMHtqOlvtNyp1Gcmmp/TQhq
         jUIZJVEEB4s0JpvGiFF24xByMdSJp1oLw3CQAUd4Mcc/4KIfQygqNSYk9TzY7ziJHGjU
         d57xaSM+ZgDmtx4EkLMLYis6CBQUGXiAJMzIMIDXK9rRxfP05lxSduWRyJ+aoDk00T7D
         DcLQ==
X-Forwarded-Encrypted: i=1; AJvYcCULpP7er4BIWEeKjUirOf6ECGJKZ1NhZy4Z2RWqdSHP2IzpChSihipoiDO6IWDhCl6aTSr5XYJMPlpntOV56hZQbf6LodaVHcB4Sbk=
X-Gm-Message-State: AOJu0YyOdJi/LUj7KyxqO1UpfYD1WpFzONZdoe9XEB60wwlWZufIzFNb
	+t9yyIt+qH2n+o/1VUGZcsAqmeytNNj0Mw1nBNSG1dDMLxis+rGb/lwy21SflKQ=
X-Google-Smtp-Source: AGHT+IEMAK9/CWzisXX0mnn4Qx1n/RO6x2Q0vBfTjmTGSttXg6zHwrAHn2G1s/O8uPZijeexW08a+Q==
X-Received: by 2002:a05:6402:1d4c:b0:5bf:afe:6294 with SMTP id 4fb4d7f45d1cf-5bf0afe638cmr1650532a12.17.1724155673544;
        Tue, 20 Aug 2024 05:07:53 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf004c2ebfsm1835410a12.1.2024.08.20.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 05:07:53 -0700 (PDT)
Date: Tue, 20 Aug 2024 14:07:51 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, regressions@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Bagas Sanjaya
 <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] docs: bug-bisect: rewrite to better match the other
 bisecting text
Message-ID: <20240820140751.0e024f21@mordecai>
In-Reply-To: <fbeae4056ae8174f454c3865bc45633281bb1b31.1723997526.git.linux@leemhuis.info>
References: <fbeae4056ae8174f454c3865bc45633281bb1b31.1723997526.git.linux@leemhuis.info>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Aug 2024 18:12:13 +0200
Thorsten Leemhuis <linux@leemhuis.info> wrote:

> Rewrite the short document on bisecting kernel bugs. The new text
> improves .config handling, brings a mention of 'git skip', and explains

Nitpick: git bisect skip

No big deal, because it's only in the commit message, not in the text,
but I have more comments below, so if you decide to make a v3, you may
also want to fix it here.

> what to do after the bisection finished -- including trying a revert to
> verify the result. The rewrite at the same time removes the unrelated
> and outdated section on 'Devices not appearing' and replaces some
> sentences about bug reporting with a pointer to the document covering
> that topic in detail.
> 
> This overall brings the approach close to the one in the recently added
> text Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst.
> As those two texts serve a similar purpose for different audiences,
> mention that document in the head of this one and outline when the
> other might be the better one to follow.
> 
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
> v2:
> - incorporate review feedback from Jonathan
> - rename to 'Bisecting a regression'
> 
> v1: https://lore.kernel.org/all/10a565e4ebca5e03a2e7abb7ffe1893136471bf9.1722846343.git.linux@leemhuis.info/
> - initial version
> ---
>  Documentation/admin-guide/bug-bisect.rst | 208 +++++++++++++++--------
>  MAINTAINERS                              |   1 +
>  2 files changed, 139 insertions(+), 70 deletions(-)
> 
> diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/admin-guide/bug-bisect.rst
> index 325c5d0ed34a0a..f3b8761d32123e 100644
> --- a/Documentation/admin-guide/bug-bisect.rst
> +++ b/Documentation/admin-guide/bug-bisect.rst
> @@ -1,76 +1,144 @@
> -Bisecting a bug
> -+++++++++++++++
> +.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
> +.. [see the bottom of this file for redistribution information]
>  
> -Last updated: 28 October 2016
> +======================
> +Bisecting a regression
> +======================
>  
> -Introduction
> -============
> +This document describes how to use a ``git bisect`` to find the source code
> +change that broke something -- for example when some functionality stopped
> +working after upgrading from Linux 6.0 to 6.1.
>  
> -Always try the latest kernel from kernel.org and build from source. If you are
> -not confident in doing that please report the bug to your distribution vendor
> -instead of to a kernel developer.
> +The text focuses on the gist of the process. If you are new to bisecting the
> +kernel, better follow Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +instead: it depicts everything from start to finish while covering multiple
> +aspects even kernel developers occasionally forget. This includes detecting
> +situations early where a bisection would be a waste of time, as nobody would
> +care about the result -- for example, because the problem happens after the
> +kernel marked itself as 'tainted', occurs in an abandoned version, was already
> +fixed, or is caused by a .config change you or your Linux distributor performed.
>  
> -Finding bugs is not always easy. Have a go though. If you can't find it don't
> -give up. Report as much as you have found to the relevant maintainer. See
> -MAINTAINERS for who that is for the subsystem you have worked on.
> +Finding the change causing a kernel issue using a bisection
> +===========================================================
>  
> -Before you submit a bug report read
> -'Documentation/admin-guide/reporting-issues.rst'.
> +*Note: the following process assumes you prepared everything for a bisection.
> +This includes having a Git clone with the appropriate sources, installing the
> +software required to build and install kernels, as well as a .config file stored
> +in a safe place (the following example assumes '~/prepared_kernel_.config') to
> +use as pristine base at each bisection step; you ideally want to have worked out
> +a fully reliable and straight-forward way to reproduce the regression, too.*

I'm not sure about the wording. On the one hand, you go to great
lengths to avoid the passive voice, and on the other hand you use the
past infinitive here ("to have worked out"). Would this sentence be
harder to understand if we remove "want to"?

  ideally, you have also worked out [...]

> -Devices not appearing
> -=====================
> -
> -Often this is caused by udev/systemd. Check that first before blaming it
> -on the kernel.
> -
> -Finding patch that caused a bug
> -===============================
> -
> -Using the provided tools with ``git`` makes finding bugs easy provided the bug
> -is reproducible.
> -
> -Steps to do it:
> -
> -- build the Kernel from its git source
> -- start bisect with [#f1]_::
> -
> -	$ git bisect start
> -
> -- mark the broken changeset with::
> -
> -	$ git bisect bad [commit]
> -
> -- mark a changeset where the code is known to work with::
> -
> -	$ git bisect good [commit]
> -
> -- rebuild the Kernel and test
> -- interact with git bisect by using either::
> -
> -	$ git bisect good
> -
> -  or::
> -
> -	$ git bisect bad
> -
> -  depending if the bug happened on the changeset you're testing
> -- After some interactions, git bisect will give you the changeset that
> -  likely caused the bug.
> -
> -- For example, if you know that the current version is bad, and version
> -  4.8 is good, you could do::
> -
> -           $ git bisect start
> -           $ git bisect bad                 # Current version is bad
> -           $ git bisect good v4.8
> -
> -
> -.. [#f1] You can, optionally, provide both good and bad arguments at git
> -	 start with ``git bisect start [BAD] [GOOD]``
> -
> -For further references, please read:
> -
> -- The man page for ``git-bisect``
> -- `Fighting regressions with git bisect <https://www.kernel.org/pub/software/scm/git/docs/git-bisect-lk2009.html>`_
> -- `Fully automated bisecting with "git bisect run" <https://lwn.net/Articles/317154>`_
> -- `Using Git bisect to figure out when brokenness was introduced <http://webchick.net/node/99>`_
> +* Preparation: start the bisection and tell Git about the points in the history
> +  you consider to be working and broken, which Git calls 'good' and 'bad'::
> +
> +     git bisect start
> +     git bisect good v6.0
> +     git bisect bad v6.1
> +
> +  Instead of Git tags like 'v6.0' and 'v6.1' you can specify commit-ids, too.
> +
> +1. Copy your prepared .config into the build directory and adjust it to the
> +   needs of the codebase Git checked out for testing::
> +
> +     cp ~/prepared_kernel_.config .config
> +     make olddefconfig
> +
> +2. Now build, install, and boot a kernel. This might fail for unrelated reasons,
> +   for example, when a compile error happens at the current stage of the
> +   bisection a later change resolves. In such cases run ``git bisect skip`` and
> +   go back to step 1.
> +
> +3. Check if the functionality that regressed works in the kernel you just built.
> +
> +   If it works, execute::
> +
> +     git bisect good
> +
> +   If it is broken, run::
> +
> +     git bisect bad
> +
> +   Note, getting this wrong just once will send the rest of the bisection
> +   totally off course. To prevent having to start anew later you thus want to
> +   ensure what you tell Git is correct; it is thus often wise to spend a few
> +   minutes more on testing in case your reproducer is unreliable.
> +
> +   Go back to back to step 1, if Git after issuing one of these two commands

One "back to" too many here. ;-)

> +   checks out another bisection point while printing something like 'Bisecting:
> +   675 revisions left to test after this (roughly 10 steps)'.
> +
> +   You have finished the bisection, if Git instead prints something like
> +   'cafecaca0c0dacafecaca0c0dacafecaca0c0da is the first bad commit'. In that


But it's still difficult to parse for me. Maybe it would be better to
reorder the sentence like this:

  After issuing one of these commands, if Git checks out another
  bisection point and prints something like 'Bisecting: 675 revisions
  left to test affter this (roughly 10 steps)', then go back to step 1.

  If Git prints something like 'cafecaca0c0dacafecaca0c0dacafecaca0c0da
  is the first bad commit', then you have finished the bisection. [...]

> +   case move to the next point below. Note, right after displaying that line
> +   Git will show some details about the culprit including its patch description;
> +   this can easily fill your terminal, so you might need to scroll up to see the
> +   message mentioning the culprit's commit-id.
> +
> +   In case you missed Git's output, you at any time of the bisection can run
> +   ``git bisect log`` to print the status: it will show how many steps remain
> +   or mention the result of the bisection.

Yeah, it's possible to insert a long adverbial phrase (such as "at any
time of the bisection") between the subject and verb between the
subject and verb, but would it be OK to use less words? For example:

  In case you missed Git's output, you can always run ``git bisect
  log`` [...]

> +
> +* Recommended complementary task: put the bisection log and the current .config
> +  file aside for the bug report; furthermore tell Git to reset the sources to
> +  the state before the bisection::
> +
> +     git bisect log > ~/bisection-log
> +     cp .config ~/bisection-config-culprit
> +     git bisect reset
> +
> +* Recommended optional task: try reverting the culprit on top of the latest
> +  codebase and check if that fixes your bug; if that is the case, it validates
> +  the bisection and enables developers to resolve the regression through a
> +  revert.
> +
> +  To try this, update your clone and check out latest mainline. Then tell Git
> +  to revert the change by specifying its commit-id::
> +
> +     git revert --no-edit cafec0cacaca0
> +
> +  Git might reject this, for example when the bisection landed on a merge
> +  commit. In that case, abandon the attempt. Do the same, if Git fails to revert
> +  the culprit on its own because later changes depend on it -- at least unless
> +  you bisected using a stable or longterm kernel series, in which case you want
> +  to retry using the latest code from that series.

Admittedly, this paragraph left me a bit confused. So, what is your
suggestion if I bisected using a stable or longterm kernel series (BTW
shouldn't we use Git-speak and call it a branch?) and Git fails to
revert the commit because some later changes depend on the commit?
Are you trying to say I should check out the current head of that
stable or longterm branch and retry the revert there?

Overall, it all looks good to me.
Thank you very much for your effort!

Petr T

> +
> +  If a revert succeeds, build and test another kernel to check if reverting
> +  resolved your regression.
> +
> +With that the process is complete. Now report the regression as described by
> +Documentation/admin-guide/reporting-issues.rst.
> +
> +
> +Additional reading material
> +---------------------------
> +
> +* The `man page for 'git bisect' <https://git-scm.com/docs/git-bisect>`_ and
> +  `fighting regressions with 'git bisect' <https://git-scm.com/docs/git-bisect-lk2009.html>`_
> +  in the Git documentation.
> +* `Working with git bisect <https://nathanchance.dev/posts/working-with-git-bisect/>`_
> +  from kernel developer Nathan Chancellor.
> +* `Using Git bisect to figure out when brokenness was introduced <http://webchick.net/node/99>`_.
> +* `Fully automated bisecting with 'git bisect run' <https://lwn.net/Articles/317154>`_.
> +
> +..
> +   end-of-content
> +..
> +   This document is maintained by Thorsten Leemhuis <linux@leemhuis.info>. If
> +   you spot a typo or small mistake, feel free to let him know directly and
> +   he'll fix it. You are free to do the same in a mostly informal way if you
> +   want to contribute changes to the text -- but for copyright reasons please CC
> +   linux-doc@vger.kernel.org and 'sign-off' your contribution as
> +   Documentation/process/submitting-patches.rst explains in the section 'Sign
> +   your work - the Developer's Certificate of Origin'.
> +..
> +   This text is available under GPL-2.0+ or CC-BY-4.0, as stated at the top
> +   of the file. If you want to distribute this text under CC-BY-4.0 only,
> +   please use 'The Linux kernel development community' for author attribution
> +   and link this as source:
> +   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/bug-bisect.rst
> +
> +..
> +   Note: Only the content of this RST file as found in the Linux kernel sources
> +   is available under CC-BY-4.0, as versions of this text that were processed
> +   (for example by the kernel's build system) might contain content taken from
> +   files which use a more restrictive license.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b34385f2e46d92..90c8681d4d311c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6719,6 +6719,7 @@ DOCUMENTATION REPORTING ISSUES
>  M:	Thorsten Leemhuis <linux@leemhuis.info>
>  L:	linux-doc@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/admin-guide/bug-bisect.rst
>  F:	Documentation/admin-guide/quickly-build-trimmed-linux.rst
>  F:	Documentation/admin-guide/reporting-issues.rst
>  F:	Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> 
> base-commit: 8663dd38a7ba5b2bfd2c7b4271e6e63bc0ef1e42

