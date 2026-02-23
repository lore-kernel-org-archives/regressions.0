Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E91286A4
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834863; cv=none; b=mQES1JY1dtRSaqpqVOBuQHOrJuhdCs3YR6iyRHfWvgdyYGoxZ/9OskxqjmTr9h4LUYdAckRK2G4zHs2qPcW7Sr7gZp0DMLhbeXAlsiPr+frTU5j76NdUIcOmieSBF9P+RJaDa+Rtv6MDoLZytpccoTRt1WHNli73Mtn/KQtjZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834863; c=relaxed/simple;
	bh=c4HU8wdJMyX/jMrX0rasmMdUGvqf1YhEOI56FRfqb28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QqTa7lURR3L9i9BRB5PoOnmkwn6AmZX7jPqpnS2fjzoEzI0x2hoLmWTgOu0xkBwJaot9TymW6BlWwTdaE6/dvnKg5iCirZHCvSlP5qZYyORiZi3m+8axW0cGXx1kwMf8Nx7BdP2RmUjvcFhxpZajsylo90im3DdbqFEX1PYNY0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=auG+zTvk; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="auG+zTvk"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fKDM62WJcz6D8R;
	Mon, 23 Feb 2026 09:20:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771834850;
	bh=c4HU8wdJMyX/jMrX0rasmMdUGvqf1YhEOI56FRfqb28=;
	h=From:To:Cc:Subject:Date:From;
	b=auG+zTvkhn7jWRLsbyQXiViitQlxsmr90/ZkoG8vFHo2tik/ld9nG4woLvP4w14iP
	 jZl2hLR3KjV7Cjg77LH6M6JoTMrS34KOXR2+Q4oFpelTncEK/vVTj7Sp5fIL1Bn+4q
	 Q5DCt7/2ZHlEPvgogIfdyYmATBcRjGzV3T1Ai9r6jQr1c/THLLPU7U9mi7UhfgJwdq
	 BkRBa9Zj35OQmdgHtjqGSiPCK1/4YAC6LRpmeG0QqePFPi4SVm+F7tHTCpk2ksO0/w
	 EcSFAQ46WxP0OAw0jennYBV8qN6gvuqGtIae2xzn4wiD2gZEnba+28PbnqVpGH33P3
	 qAtev/ZotlqAA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4fKDM61kTZz4xZG;
	Mon, 23 Feb 2026 09:20:50 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fKDM545dBz8sZw;
	Mon, 23 Feb 2026 09:20:49 +0100 (CET)
Received: from luggage.fritz.box (unknown [IPv6:2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C3F1466F46;
	Mon, 23 Feb 2026 09:20:48 +0100 (CET)
Authentication-Results: mxe9fb;
	spf=pass (sender IP is 2a02:8108:8984:1d00:a8ad:ebd4:6fc6:160) smtp.mailfrom=linux@leemhuis.info smtp.helo=luggage.fritz.box
Received-SPF: pass (mxe9fb: connection is authenticated)
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] docs: handling-regressions: add, trim,
 and sort quotes from Linus
Date: Mon, 23 Feb 2026 09:20:47 +0100
Message-ID: 
 <c825d7981e1badb22d15f3f6fc9c95001a017f09.1771833924.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177183484903.1296568.8311005621891759284@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C3F1466F46
X-NC-CID: SkPxaqCeqjZ7VW393m3qkLCA0J4D4q8mZsX/Lw/oY2vGZgiu5oM=

Add additional quotes from Linus while trimming the existing ones and
sorting them all into categories. That makes it easier for new
developers and maintainers to look up how Linus expects certain
situations wrt regressions to be handled. The earlier sections in the
document already explain this, but those parts are often questioned --
or not considered authoritative at all and plainly ignored. Having it
straight from the horse's mouth helps get everyone on the same page,
even if that makes the document quite a bit longer (the raw line count
of this section doubles, but the number of characters increases by
nearly 50%). In return, this covers a lot more aspects and, due to the
sub-headings, is easier to navigate.

In contrast to the more neutral description in the early sections of the
document, this also provides a better insight into how serious Linus is
about the "no regressions" rule and how he wants it to be interpreted in
practice; this makes it easier for new developers and maintainers to
understand things and prevent run-ins with higher-level maintainers.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---
 .../process/handling-regressions.rst          | 695 ++++++++++++------
 1 file changed, 463 insertions(+), 232 deletions(-)

diff --git a/Documentation/process/handling-regressions.rst b/Documentation/process/handling-regressions.rst
index 1f5ab49c48a480..c71b5d403f0c9c 100644
--- a/Documentation/process/handling-regressions.rst
+++ b/Documentation/process/handling-regressions.rst
@@ -461,325 +461,556 @@ which both cover more details than the above section.
 Quotes from Linus about regression
 ----------------------------------
 
-Find below a few real life examples of how Linus Torvalds expects regressions to
-be handled:
+The following statements from Linus Torvalds provide some insight into Linux
+"no regressions" rule and how he expects regressions to be handled:
 
- * From `2017-10-26 (1/2)
-   <https://lore.kernel.org/lkml/CA+55aFwiiQYJ+YoLKCXjN_beDVfu38mg=Ggg5LFOcqHE8Qi7Zw@mail.gmail.com/>`_::
+On how quickly regressions should be fixed
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       If you break existing user space setups THAT IS A REGRESSION.
+* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::
 
-       It's not ok to say "but we'll fix the user space setup".
+    But a user complaining should basically result in an immediate fix -
+    possibly a "revert and rethink".
 
-       Really. NOT OK.
+  With a later clarification on `2026-01-28 <https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/>`_::
 
-       [...]
+    It's also worth noting that "immediate" obviously doesn't mean "right
+    this *second* when the problem has been reported".
 
-       The first rule is:
+    But if it's a regression with a known commit that caused it, I think
+    the rule of thumb should generally be "within a week", preferably
+    before the next rc.
 
-        - we don't cause regressions
+* From `2023-04-21 <https://lore.kernel.org/all/CAHk-=wgD98pmSK3ZyHk_d9kZ2bhgN6DuNZMAJaV0WTtbkf=RDw@mail.gmail.com/>`_::
 
-       and the corollary is that when regressions *do* occur, we admit to
-       them and fix them, instead of blaming user space.
+    Known-broken commits either
+     (a) get a timely fix that doesn't have other questions
+    or
+     (b) get reverted
 
-       The fact that you have apparently been denying the regression now for
-       three weeks means that I will revert, and I will stop pulling apparmor
-       requests until the people involved understand how kernel development
-       is done.
+* From `2021-09-20(2) <https://lore.kernel.org/all/CAHk-=wgOvmtRw1TNbMC1rn5YqyTKyn0hz+sc4k0DGNn++u9aYw@mail.gmail.com/>`_::
 
- * From `2017-10-26 (2/2)
-   <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
+    [...] review shouldn't hold up reported regressions of existing code. That's
+    just basic _testing_ - either the fix should be applied, or - if the fix is
+    too invasive or too ugly - the problematic source of the regression should
+    be reverted.
 
-       People should basically always feel like they can update their kernel
-       and simply not have to worry about it.
+    Review should be about new code, it shouldn't be holding up "there's a
+    bug report, here's the obvious fix".
 
-       I refuse to introduce "you can only update the kernel if you also
-       update that other program" kind of limitations. If the kernel used to
-       work for you, the rule is that it continues to work for you.
+* From `2023-05-08 <https://lore.kernel.org/all/CAHk-=wgzU8_dGn0Yg+DyX7ammTkDUCyEJ4C=NvnHRhxKWC7Wpw@mail.gmail.com/>`_::
 
-       There have been exceptions, but they are few and far between, and they
-       generally have some major and fundamental reasons for having happened,
-       that were basically entirely unavoidable, and people _tried_hard_ to
-       avoid them. Maybe we can't practically support the hardware any more
-       after it is decades old and nobody uses it with modern kernels any
-       more. Maybe there's a serious security issue with how we did things,
-       and people actually depended on that fundamentally broken model. Maybe
-       there was some fundamental other breakage that just _had_ to have a
-       flag day for very core and fundamental reasons.
+    If something doesn't even build, it should damn well be fixed ASAP.
 
-       And notice that this is very much about *breaking* peoples environments.
+On how fixing regressions with reverts can help prevent maintainer burnout
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       Behavioral changes happen, and maybe we don't even support some
-       feature any more. There's a number of fields in /proc/<pid>/stat that
-       are printed out as zeroes, simply because they don't even *exist* in
-       the kernel any more, or because showing them was a mistake (typically
-       an information leak). But the numbers got replaced by zeroes, so that
-       the code that used to parse the fields still works. The user might not
-       see everything they used to see, and so behavior is clearly different,
-       but things still _work_, even if they might no longer show sensitive
-       (or no longer relevant) information.
+* From `2026-01-28 <https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2BLsMyJmcuMSA@mail.gmail.com/>`_::
 
-       But if something actually breaks, then the change must get fixed or
-       reverted. And it gets fixed in the *kernel*. Not by saying "well, fix
-       your user space then". It was a kernel change that exposed the
-       problem, it needs to be the kernel that corrects for it, because we
-       have a "upgrade in place" model. We don't have a "upgrade with new
-       user space".
+    > So how can I/we make "immediate fixes" happen more often without
+    > contributing to maintainer burnout?
 
-       And I seriously will refuse to take code from people who do not
-       understand and honor this very simple rule.
+    [...] the "revert and rethink" model [...] often a good idea in general [...]
 
-       This rule is also not going to change.
+    Exactly so that maintainers don't get stressed out over having a pending
+    problem report that people keep pestering them about.
 
-       And yes, I realize that the kernel is "special" in this respect. I'm
-       proud of it.
+    I think people are sometimes a bit too bought into whatever changes
+    they made, and reverting is seen as "too drastic", but I think it's
+    often the quick and easy solution for when there isn't some obvious
+    response to a regression report.
 
-       I have seen, and can point to, lots of projects that go "We need to
-       break that use case in order to make progress" or "you relied on
-       undocumented behavior, it sucks to be you" or "there's a better way to
-       do what you want to do, and you have to change to that new better
-       way", and I simply don't think that's acceptable outside of very early
-       alpha releases that have experimental users that know what they signed
-       up for. The kernel hasn't been in that situation for the last two
-       decades.
+On mainlining fixes when the last -rc or a new release is close
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       We do API breakage _inside_ the kernel all the time. We will fix
-       internal problems by saying "you now need to do XYZ", but then it's
-       about internal kernel API's, and the people who do that then also
-       obviously have to fix up all the in-kernel users of that API. Nobody
-       can say "I now broke the API you used, and now _you_ need to fix it
-       up". Whoever broke something gets to fix it too.
+* From `2026-02-01 <https://lore.kernel.org/all/CAHk-%3DwhXTw1oPsa%2BTLuY1Rc9D1OAiPVOdR_-R2xG45kwDObKdA@mail.gmail.com/>`_::
 
-       And we simply do not break user space.
+    So I think I'd rather see them hit rc8 (later today) and have a week
+    of testing in my tree and be reverted if they cause problems, than
+    have them go in after rc8 and then cause problems in the 6.19 release
+    instead.
 
- * From `2020-05-21
-   <https://lore.kernel.org/all/CAHk-=wiVi7mSrsMP=fLXQrXK_UimybW=ziLOwSzFTtoXUacWVQ@mail.gmail.com/>`_::
+* From `2023-04-20 <https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/>`_::
 
-       The rules about regressions have never been about any kind of
-       documented behavior, or where the code lives.
+    But something like this, where the regression was in the previous release
+    and it's just a clear fix with no semantic subtlety, I consider to be just a
+    regular regression that should be expedited - partly to make it into stable,
+    and partly to avoid having to put the fix into _another_ stable kernel.
 
-       The rules about regressions are always about "breaks user workflow".
+On sending merge requests with just one fix
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       Users are literally the _only_ thing that matters.
+* From `2024-04-24 <https://lore.kernel.org/all/CAHk-=wjy_ph9URuFt-pq+2AJ__p7gFDx=yzVSCsx16xAYvNw9g@mail.gmail.com/>`_::
 
-       No amount of "you shouldn't have used this" or "that behavior was
-       undefined, it's your own fault your app broke" or "that used to work
-       simply because of a kernel bug" is at all relevant.
+    If the issue is just that there's nothing else happening, I think people
+    should just point me to the patch and say "can you apply this single fix?"
 
-       Now, reality is never entirely black-and-white. So we've had things
-       like "serious security issue" etc that just forces us to make changes
-       that may break user space. But even then the rule is that we don't
-       really have other options that would allow things to continue.
+* From `2023-04-20 <https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/>`_::
 
-       And obviously, if users take years to even notice that something
-       broke, or if we have sane ways to work around the breakage that
-       doesn't make for too much trouble for users (ie "ok, there are a
-       handful of users, and they can use a kernel command line to work
-       around it" kind of things) we've also been a bit less strict.
+    I'm always open to direct fixes when there is no controversy about the fix.
+    No problem. I still happily deal with individual patches.
 
-       But no, "that was documented to be broken" (whether it's because the
-       code was in staging or because the man-page said something else) is
-       irrelevant. If staging code is so useful that people end up using it,
-       that means that it's basically regular kernel code with a flag saying
-       "please clean this up".
+On the importance of pointing to bug reports using Link:/Closes: tags
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       The other side of the coin is that people who talk about "API
-       stability" are entirely wrong. API's don't matter either. You can make
-       any changes to an API you like - as long as nobody notices.
+* From `2025-07-29(1) <https://lore.kernel.org/all/CAHk-=wj2kJRPWx8B09AAtzj+_g+T6UBX11TP0ebs1WJdTtv=WQ@mail.gmail.com/>`_::
 
-       Again, the regression rule is not about documentation, not about
-       API's, and not about the phase of the moon.
+    [...] revert like this, it really would be good to link to the problems, so
+    that when people try to re-enable it, they have the history for why it
+    didn't work the first time.
 
-       It's entirely about "we caused problems for user space that used to work".
+* From `2022-05-08 <https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/>`_::
 
- * From `2017-11-05
-   <https://lore.kernel.org/all/CA+55aFzUvbGjD8nQ-+3oiMBx14c_6zOj2n7KLN3UsJ-qsd4Dcw@mail.gmail.com/>`_::
+    So I have to once more complain [...]
 
-       And our regression rule has never been "behavior doesn't change".
-       That would mean that we could never make any changes at all.
+    [...] There's no link to the actual problem the patch fixes.
 
-       For example, we do things like add new error handling etc all the
-       time, which we then sometimes even add tests for in our kselftest
-       directory.
+* From `2022-06-22 <https://lore.kernel.org/all/CAHk-=wjxzafG-=J8oT30s7upn4RhBs6TX-uVFZ5rME+L5_DoJA@mail.gmail.com/>`_::
 
-       So clearly behavior changes all the time and we don't consider that a
-       regression per se.
+    See, *that* link [to the report] would have been useful in the commit.
 
-       The rule for a regression for the kernel is that some real user
-       workflow breaks. Not some test. Not a "look, I used to be able to do
-       X, now I can't".
+On why the "no regressions" rule exists
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
- * From `2018-08-03
-   <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::
+* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::
 
-       YOU ARE MISSING THE #1 KERNEL RULE.
+    But the basic rule is: be so good about backwards compatibility that
+    users never have to worry about upgrading. They should absolutely feel
+    confident that any kernel-reported problem will either be solved, or
+    have an easy solution that is appropriate for *them* (ie a
+    non-technical user shouldn't be expected to be able to do a lot).
 
-       We do not regress, and we do not regress exactly because your are 100% wrong.
+    Because the last thing we want is people holding back from trying new
+    kernels.
 
-       And the reason you state for your opinion is in fact exactly *WHY* you
-       are wrong.
+* From `2024-05-28 <https://lore.kernel.org/all/CAHk-=wgtb7y-bEh7tPDvDWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/>`_::
 
-       Your "good reasons" are pure and utter garbage.
+    I introduced that "no regressions" rule something like two decades
+    ago, because people need to be able to update their kernel without
+    fear of something they relied on suddenly stopping to work.
 
-       The whole point of "we do not regress" is so that people can upgrade
-       the kernel and never have to worry about it.
+* From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::
 
-       > Kernel had a bug which has been fixed
+    The whole point of "we do not regress" is so that people can upgrade
+    the kernel and never have to worry about it.
 
-       That is *ENTIRELY* immaterial.
+    [...]
 
-       Guys, whether something was buggy or not DOES NOT MATTER.
+    Because the only thing that matters IS THE USER.
 
-       Why?
+* From `2017-10-26(1) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
 
-       Bugs happen. That's a fact of life. Arguing that "we had to break
-       something because we were fixing a bug" is completely insane. We fix
-       tens of bugs every single day, thinking that "fixing a bug" means that
-       we can break something is simply NOT TRUE.
+    If the kernel used to work for you, the rule is that it continues to work
+    for you.
 
-       So bugs simply aren't even relevant to the discussion. They happen,
-       they get found, they get fixed, and it has nothing to do with "we
-       break users".
+    [...]
 
-       Because the only thing that matters IS THE USER.
+    People should basically always feel like they can update their kernel
+    and simply not have to worry about it.
 
-       How hard is that to understand?
+    I refuse to introduce "you can only update the kernel if you also
+    update that other program" kind of limitations. If the kernel used to
+    work for you, the rule is that it continues to work for you.
 
-       Anybody who uses "but it was buggy" as an argument is entirely missing
-       the point. As far as the USER was concerned, it wasn't buggy - it
-       worked for him/her.
+On exceptions to the "no regressions" rule
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       Maybe it worked *because* the user had taken the bug into account,
-       maybe it worked because the user didn't notice - again, it doesn't
-       matter. It worked for the user.
+* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::
 
-       Breaking a user workflow for a "bug" is absolutely the WORST reason
-       for breakage you can imagine.
+    There are _very_ few exceptions to that rule, the main one being "the
+    problem was a fundamental huge and gaping security issue and we *had* to
+    make that change, and we couldn't even make your limited use-case just
+    continue to work".
 
-       It's basically saying "I took something that worked, and I broke it,
-       but now it's better". Do you not see how f*cking insane that statement
-       is?
+    The other exception is "the problem was reported years after it was
+    introduced, and now most people rely on the new behavior".
 
-       And without users, your program is not a program, it's a pointless
-       piece of code that you might as well throw away.
+    [...]
 
-       Seriously. This is *why* the #1 rule for kernel development is "we
-       don't break users". Because "I fixed a bug" is absolutely NOT AN
-       ARGUMENT if that bug fix broke a user setup. You actually introduced a
-       MUCH BIGGER bug by "fixing" something that the user clearly didn't
-       even care about.
+    Now, if it's one or two users and you can just get them to recompile,
+    that's one thing. Niche hardware and odd use-cases can sometimes be
+    solved that way, and regressions can sometimes be fixed by handholding
+    every single reporter if the reporter is willing and able to change
+    his or her workflow.
 
-       And dammit, we upgrade the kernel ALL THE TIME without upgrading any
-       other programs at all. It is absolutely required, because flag-days
-       and dependencies are horribly bad.
+* From `2023-04-20 <https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/>`_::
 
-       And it is also required simply because I as a kernel developer do not
-       upgrade random other tools that I don't even care about as I develop
-       the kernel, and I want any of my users to feel safe doing the same
-       time.
+    And yes, I do consider "regression in an earlier release" to be a
+    regression that needs fixing.
 
-       So no. Your rule is COMPLETELY wrong. If you cannot upgrade a kernel
-       without upgrading some other random binary, then we have a problem.
+    There's obviously a time limit: if that "regression in an earlier
+    release" was a year or more ago, and just took forever for people to
+    notice, and it had semantic changes that now mean that fixing the
+    regression could cause a _new_ regression, then that can cause me to
+    go "Oh, now the new semantics are what we have to live with".
 
- * From `2021-06-05
-   <https://lore.kernel.org/all/CAHk-=wiUVqHN76YUwhkjZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com/>`_::
+* From `2017-10-26(2) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
 
-       THERE ARE NO VALID ARGUMENTS FOR REGRESSIONS.
+    There have been exceptions, but they are few and far between, and they
+    generally have some major and fundamental reasons for having happened,
+    that were basically entirely unavoidable, and people _tried_hard_ to
+    avoid them. Maybe we can't practically support the hardware any more
+    after it is decades old and nobody uses it with modern kernels any
+    more. Maybe there's a serious security issue with how we did things,
+    and people actually depended on that fundamentally broken model. Maybe
+    there was some fundamental other breakage that just _had_ to have a
+    flag day for very core and fundamental reasons.
 
-       Honestly, security people need to understand that "not working" is not
-       a success case of security. It's a failure case.
+On situations where updating something in userspace can resolve regressions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       Yes, "not working" may be secure. But security in that case is *pointless*.
+* From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::
 
- * From `2011-05-06 (1/3)
-   <https://lore.kernel.org/all/BANLkTim9YvResB+PwRp7QTK-a5VNg2PvmQ@mail.gmail.com/>`_::
+    And dammit, we upgrade the kernel ALL THE TIME without upgrading any
+    other programs at all. It is absolutely required, because flag-days
+    and dependencies are horribly bad.
 
-       Binary compatibility is more important.
+    And it is also required simply because I as a kernel developer do not
+    upgrade random other tools that I don't even care about as I develop the
+    kernel, and I want any of my users to feel safe doing the same time.
 
-       And if binaries don't use the interface to parse the format (or just
-       parse it wrongly - see the fairly recent example of adding uuid's to
-       /proc/self/mountinfo), then it's a regression.
+* From `2017-10-26(3) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
 
-       And regressions get reverted, unless there are security issues or
-       similar that makes us go "Oh Gods, we really have to break things".
+    But if something actually breaks, then the change must get fixed or
+    reverted. And it gets fixed in the *kernel*. Not by saying "well, fix your
+    user space then". It was a kernel change that exposed the problem, it needs
+    to be the kernel that corrects for it, because we have a "upgrade in place"
+    model. We don't have a "upgrade with new user space".
 
-       I don't understand why this simple logic is so hard for some kernel
-       developers to understand. Reality matters. Your personal wishes matter
-       NOT AT ALL.
+    And I seriously will refuse to take code from people who do not understand
+    and honor this very simple rule.
 
-       If you made an interface that can be used without parsing the
-       interface description, then we're stuck with the interface. Theory
-       simply doesn't matter.
+    This rule is also not going to change.
 
-       You could help fix the tools, and try to avoid the compatibility
-       issues that way. There aren't that many of them.
+    And yes, I realize that the kernel is "special" in this respect. I'm proud
+    of it.
 
-   From `2011-05-06 (2/3)
-   <https://lore.kernel.org/all/BANLkTi=KVXjKR82sqsz4gwjr+E0vtqCmvA@mail.gmail.com/>`_::
+* From `2017-10-26(4) <https://lore.kernel.org/all/CA+55aFwiiQYJ+YoLKCXjN_beDVfu38mg=Ggg5LFOcqHE8Qi7Zw@mail.gmail.com/>`_::
 
-       it's clearly NOT an internal tracepoint. By definition. It's being
-       used by powertop.
+    If you break existing user space setups THAT IS A REGRESSION.
 
-   From `2011-05-06 (3/3)
-   <https://lore.kernel.org/all/BANLkTinazaXRdGovYL7rRVp+j6HbJ7pzhg@mail.gmail.com/>`_::
+    It's not ok to say "but we'll fix the user space setup".
 
-       We have programs that use that ABI and thus it's a regression if they break.
+    Really. NOT OK.
 
- * From `2012-07-06 <https://lore.kernel.org/all/CA+55aFwnLJ+0sjx92EGREGTWOx84wwKaraSzpTNJwPVV8edw8g@mail.gmail.com/>`_::
+On what qualifies as userspace interface, ABI, API, documented interfaces, etc.
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-       > Now this got me wondering if Debian _unstable_ actually qualifies as a
-       > standard distro userspace.
+* From `2026-01-20 <https://lore.kernel.org/all/CAHk-=wga8Qu0-OSE9VZbviq9GuqwhPhLUXeAt-S7_9+fMCLkKg@mail.gmail.com/>`_::
 
-       Oh, if the kernel breaks some standard user space, that counts. Tons
-       of people run Debian unstable
+    So I absolutely detest the whole notion of "ABI changes". It's a
+    meaningless concept, and I hate it with a passion, [...]
 
- * From `2019-09-15
-   <https://lore.kernel.org/lkml/CAHk-=wiP4K8DRJWsCo=20hn_6054xBamGKF2kPgUzpB5aMaofA@mail.gmail.com/>`_::
+    The Linux rule for regressions is basically based on the philosophical
+    question of "If a tree falls in the forest, and nobody is around to
+    hear it, does it make a sound?".
 
-       One _particularly_ last-minute revert is the top-most commit (ignoring
-       the version change itself) done just before the release, and while
-       it's very annoying, it's perhaps also instructive.
+    So the only thing that matters is if something breaks user-*conscious*
+    behavior.
 
-       What's instructive about it is that I reverted a commit that wasn't
-       actually buggy. In fact, it was doing exactly what it set out to do,
-       and did it very well. In fact it did it _so_ well that the much
-       improved IO patterns it caused then ended up revealing a user-visible
-       regression due to a real bug in a completely unrelated area.
+    And when that happens, the distinction between "bug fix" and "new
+    feature" and "ABI change" matters not one whit, and the change needs
+    to be done differently.
 
-       The actual details of that regression are not the reason I point that
-       revert out as instructive, though. It's more that it's an instructive
-       example of what counts as a regression, and what the whole "no
-       regressions" kernel rule means. The reverted commit didn't change any
-       API's, and it didn't introduce any new bugs. But it ended up exposing
-       another problem, and as such caused a kernel upgrade to fail for a
-       user. So it got reverted.
+    [...]
 
-       The point here being that we revert based on user-reported _behavior_,
-       not based on some "it changes the ABI" or "it caused a bug" concept.
-       The problem was really pre-existing, and it just didn't happen to
-       trigger before. The better IO patterns introduced by the change just
-       happened to expose an old bug, and people had grown to depend on the
-       previously benign behavior of that old issue.
+    I just wanted to point out that the argument about whether it's an ABI
+    change or not is irrelevant. If it turns out that some program - not a test
+    script, but something with relevance to conscious user expectations ~
+    depended on the old broken behavior, then it needs to be done some other
+    way.
 
-       And never fear, we'll re-introduce the fix that improved on the IO
-       patterns once we've decided just how to handle the fact that we had a
-       bad interaction with an interface that people had then just happened
-       to rely on incidental behavior for before. It's just that we'll have
-       to hash through how to do that (there are no less than three different
-       patches by three different developers being discussed, and there might
-       be more coming...). In the meantime, I reverted the thing that exposed
-       the problem to users for this release, even if I hope it will be
-       re-introduced (perhaps even backported as a stable patch) once we have
-       consensus about the issue it exposed.
+* From `2026-02-13 <https://lore.kernel.org/all/CAHk-=whY-N8kjm8kiFUV5Ei-8AuYw--EPGD-AR3Pd+5GTx2sAQ@mail.gmail.com/>`_::
 
-       Take-away from the whole thing: it's not about whether you change the
-       kernel-userspace ABI, or fix a bug, or about whether the old code
-       "should never have worked in the first place". It's about whether
-       something breaks existing users' workflow.
+    > [...] this should not fall under the don't break user space rule [...]
 
-       Anyway, that was my little aside on the whole regression thing.  Since
-       it's that "first rule of kernel programming", I felt it is perhaps
-       worth just bringing it up every once in a while
+    Note that the rule is about breaking *users*, not breaking user space per
+    se. [...]
+
+    If some user setup breaks, things need fixing.
+
+    [...] but I want to make it very clear that there are no excuses about "user
+    space applications".
+
+* From `2021-09-20(4) <https://lore.kernel.org/all/CAHk-=wi7DB2SJ-wngVvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/>`_::
+
+    [...] a regression is a bit like Schrödinger's cat - if nobody is around
+    to notice it and it doesn't actually affect any real workload, then you
+    can treat the regression as if it doesn't exist.
+
+* From `2020-05-21 <https://lore.kernel.org/all/CAHk-=wiVi7mSrsMP=fLXQrXK_UimybW=ziLOwSzFTtoXUacWVQ@mail.gmail.com/>`_::
+
+    The rules about regressions have never been about any kind of documented
+    behavior, or where the code lives.
+
+    The rules about regressions are always about "breaks user workflow".
+
+    Users are literally the _only_ thing that matters.
+
+* From `2019-09-15 <https://lore.kernel.org/lkml/CAHk-=wiP4K8DRJWsCo=20hn_6054xBamGKF2kPgUzpB5aMaofA@mail.gmail.com/>`_::
+
+    One _particularly_ last-minute revert is the top-most commit (ignoring
+    the version change itself) done just before the release, and while
+    it's very annoying, it's perhaps also instructive.
+
+    What's instructive about it is that I reverted a commit that wasn't
+    actually buggy. In fact, it was doing exactly what it set out to do,
+    and did it very well. In fact it did it _so_ well that the much
+    improved IO patterns it caused then ended up revealing a user-visible
+    regression due to a real bug in a completely unrelated area.
+
+    The actual details of that regression are not the reason I point that
+    revert out as instructive, though. It's more that it's an instructive
+    example of what counts as a regression, and what the whole "no
+    regressions" kernel rule means.
+
+    [...] The reverted commit didn't change any API's, and it didn't introduce
+    any new bugs. But it ended up exposing another problem, and as such caused
+    a kernel upgrade to fail for a user. So it got reverted.
+
+    The point here being that we revert based on user-reported _behavior_, not
+    based on some "it changes the ABI" or "it caused a bug" concept. The problem
+    was really pre-existing, and it just didn't happen to trigger before. [...]
+
+    Take-away from the whole thing: it's not about whether you change the
+    kernel-userspace ABI, or fix a bug, or about whether the old code
+    "should never have worked in the first place". It's about whether
+    something breaks existing users' workflow.
+
+* From `2017-11-05 <https://lore.kernel.org/all/CA+55aFzUvbGjD8nQ-+3oiMBx14c_6zOj2n7KLN3UsJ-qsd4Dcw@mail.gmail.com/>`_::
+
+    And our regression rule has never been "behavior doesn't change".
+    That would mean that we could never make any changes at all.
+
+* From `2020-05-21 <https://lore.kernel.org/all/CAHk-=wiVi7mSrsMP=fLXQrXK_UimybW=ziLOwSzFTtoXUacWVQ@mail.gmail.com/>`_::
+
+    No amount of "you shouldn't have used this" or "that behavior was
+    undefined, it's your own fault your app broke" or "that used to work
+    simply because of a kernel bug" is at all relevant.
+
+* From `2021-05-21 <https://lore.kernel.org/all/CAHk-=wiVi7mSrsMP=fLXQrXK_UimybW=ziLOwSzFTtoXUacWVQ@mail.gmail.com/>`_::
+
+    But no, "that was documented to be broken" (whether it's because the code
+    was in staging or because the man-page said something else) is irrelevant.
+    If staging code is so useful that people end up using it, that means that
+    it's basically regular kernel code with a flag saying "please clean this
+    up".
+
+    [...]
+
+    The other side of the coin is that people who talk about "API stability" are
+    entirely wrong. API's don't matter either. You can make any changes to an
+    API you like - as long as nobody notices.
+
+    Again, the regression rule is not about documentation, not about API's, and
+    not about the phase of the moon.
+
+* From `2012-07-06 <https://lore.kernel.org/all/CA+55aFwnLJ+0sjx92EGREGTWOx84wwKaraSzpTNJwPVV8edw8g@mail.gmail.com/>`_::
+
+    > Now this got me wondering if Debian _unstable_ actually qualifies as a
+    > standard distro userspace.
+
+    Oh, if the kernel breaks some standard user space, that counts. Tons
+    of people run Debian unstable
+
+* From `2011-05-06 <https://lore.kernel.org/all/BANLkTi=KVXjKR82sqsz4gwjr+E0vtqCmvA@mail.gmail.com/>`_::
+
+    It's clearly NOT an internal tracepoint. By definition. It's being
+    used by powertop.
+
+On regressions noticed by users or test-suites/CIs
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::
+
+    Users complaining is the only real line in the end.
+
+    [...] a test-suite complaining is then often a *very* good indication that
+    maybe users will hit some problem, and test suite issues should be taken
+    very seriously [...]
+
+    But a test-suite error isn't necessarily where you have to draw the
+    line - it's a big red flag [...]
+
+* From `2024-29-01 <https://lore.kernel.org/all/CAHk-=wg8BrZEzjJ5kUyZzHPZmFqH6ooMN1gRBCofxxCfucgjaw@mail.gmail.com/>`_::
+
+    The "no regressions" rule is not about made-up "if I do this, behavior
+    changes".
+
+    The "no regressions" rule is about *users*.
+
+    If you have an actual user that has been doing insane things, and we
+    change something, and now the insane thing no longer works, at that
+    point it's a regression, and we'll sigh, and go "Users are insane" and
+    have to fix it.
+
+    But if you have some random test that now behaves differently, it's
+    not a regression. It's a *warning* sign, sure: tests are useful.
+
+On accepting when a regression occurred
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2026-01-22 <https://lore.kernel.org/all/CAHk-=wheQNiW_WtHGO7bKkT7Uib-p+ai2JP9M+z+FYcZ6CAxYA@mail.gmail.com/>`_::
+
+    But starting to argue about users reporting breaking changes is
+    basically the final line for me. I have a couple of people that I have
+    in my spam block-list and refuse to have anything to do with, and they
+    have generally been about exactly that.
+
+    Note how it's not about making mistakes and _causing_ the regression.
+    That's normal. That's development. But then arguing about it is a
+    no-no.
+
+* From `2024-06-23 <https://lore.kernel.org/all/CAHk-=wi_KMO_rJ6OCr8mAWBRg-irziM=T9wxGC+J1VVoQb39gw@mail.gmail.com/>`_::
+
+    We don't introduce regressions and then blame others.
+
+    There's a very clear rule in kernel development: things that break
+    other things ARE NOT FIXES.
+
+    EVER.
+
+    They get reverted, or the thing they broke gets fixed.
+
+* From `2021-06-05 <https://lore.kernel.org/all/CAHk-=wiUVqHN76YUwhkjZzwTdjMMJf_zN4+u7vEJjmEGh3recw@mail.gmail.com/>`_::
+
+    THERE ARE NO VALID ARGUMENTS FOR REGRESSIONS.
+
+    Honestly, security people need to understand that "not working" is not
+    a success case of security. It's a failure case.
+
+    Yes, "not working" may be secure. But security in that case is *pointless*.
+
+* From `2017-10-26(5) <https://lore.kernel.org/lkml/CA+55aFwiiQYJ+YoLKCXjN_beDVfu38mg=Ggg5LFOcqHE8Qi7Zw@mail.gmail.com/>`_::
+
+    [...] when regressions *do* occur, we admit to them and fix them, instead of
+    blaming user space.
+
+    The fact that you have apparently been denying the regression now for
+    three weeks means that I will revert, and I will stop pulling apparmor
+    requests until the people involved understand how kernel development
+    is done.
+
+On back-and-forth
+~~~~~~~~~~~~~~~~~
+
+* From `2024-05-28 <https://lore.kernel.org/all/CAHk-=wgtb7y-bEh7tPDvDWru7ZKQ8-KMjZ53Tsk37zsPPdwXbA@mail.gmail.com/>`_::
+
+    The "no regressions" rule is that we do not introduce NEW bugs.
+
+    It *literally* came about because we had an endless dance of "fix two
+    bugs, introduce one new one", and that then resulted in a system that
+    you cannot TRUST.
+
+* From `2021-09-20(1) <https://lore.kernel.org/all/CAHk-=wi7DB2SJ-wngVvsJ7Ak2cM556Q8437sOXo4EJt2BWPdEg@mail.gmail.com/>`_::
+
+    And the thing that makes regressions special is that back when I
+    wasn't so strict about these things, we'd end up in endless "seesaw
+    situations" where somebody would fix something, it would break
+    something else, then that something else would break, and it would
+    never actually converge on anything reliable at all.
+
+* From `2015-08-13 <https://lore.kernel.org/all/CA+55aFxk8-BsiKwr_S-c+4G6wihKPQVMLE34H9wOZpeua6W9+Q@mail.gmail.com/>`_::
+
+    The strict policy of no regressions actually originally started mainly wrt
+    suspend/resume issues, where the "fix one machine, break another" kind of
+    back-and-forth caused endless problems, and meant that we didn't actually
+    necessarily make any forward progress, just moving a problem around.
+
+On changes with a risk of causing regressions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2023-06-02 <https://lore.kernel.org/all/CAHk-=wgyAGUMHmQM-5Eb556z5xiHZB7cF05qjrtUH4F7P-1rSA@mail.gmail.com/>`_::
+
+    So what I think you should do is to fix the bug right, with a clean
+    patch, and no crazy hacks. That is something we can then apply and
+    test. All the while knowing full well that "uhhuh, this is a visible
+    change, we may have to revert it".
+
+    If then some *real* load ends up showing a regression, we may just be
+    screwed. Our current behavior may be buggy, but we have the rule that
+    once user space depends on kernel bugs, they become features pretty
+    much by definition, however much we might dislike it.
+
+On in-kernel workarounds to avoid regressions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2017-10-26(6) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
+
+    Behavioral changes happen, and maybe we don't even support some
+    feature any more. There's a number of fields in /proc/<pid>/stat that
+    are printed out as zeroes, simply because they don't even *exist* in
+    the kernel any more, or because showing them was a mistake (typically
+    an information leak). But the numbers got replaced by zeroes, so that
+    the code that used to parse the fields still works. The user might not
+    see everything they used to see, and so behavior is clearly different,
+    but things still _work_, even if they might no longer show sensitive
+    (or no longer relevant) information.
+
+On regressions caused by bugfixes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2018-08-03 <https://lore.kernel.org/all/CA+55aFwWZX=CXmWDTkDGb36kf12XmTehmQjbiMPCqCRG2hi9kw@mail.gmail.com/>`_::
+
+    > Kernel had a bug which has been fixed
+
+    That is *ENTIRELY* immaterial.
+
+    Guys, whether something was buggy or not DOES NOT MATTER.
+
+    [...]
+
+    It's basically saying "I took something that worked, and I broke it,
+    but now it's better". Do you not see how f*cking insane that statement
+    is?
+
+On internal API changes
+~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2017-10-26(7) <https://lore.kernel.org/lkml/CA+55aFxW7NMAMvYhkvz1UPbUTUJewRt6Yb51QAx5RtrWOwjebg@mail.gmail.com/>`_::
+
+    We do API breakage _inside_ the kernel all the time. We will fix
+    internal problems by saying "you now need to do XYZ", but then it's
+    about internal kernel API's, and the people who do that then also
+    obviously have to fix up all the in-kernel users of that API. Nobody
+    can say "I now broke the API you used, and now _you_ need to fix it
+    up". Whoever broke something gets to fix it too.
+
+On regressions only found after a long time
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2024-03-28 <https://lore.kernel.org/all/CAHk-=wgFuoHpMk_Z_R3qMXVDgq0N1592+bABkyGjwwSL4zBtHA@mail.gmail.com/>`_::
+
+    I'm definitely not reverting a patch from almost a decade ago as a
+    regression.
+
+    If it took that long to find, it can't be that critical of a regression.
+
+    So yes, let's treat it as a regular bug.
+
+On testing regressions fixes in linux-next
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* On `maintainers summit 2024 <https://lwn.net/Articles/990599/>`_::
+
+   So running fixes though linux-next is just a waste of time.
+
+On a few other aspects related to regressions
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+* From `2025-07-29(2) <https://lore.kernel.org/all/CAHk-=wjj9DvOZtmTkoLtyfHmy5mNKy6q_96d9=4FUEDXre=cww@mail.gmail.com/>`_
+  [which `is not quite a regression, but a huge inconvenience <https://lore.kernel.org/all/CAHk-=wgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV5HeQ@mail.gmail.com/>`_]::
+
+    I no longer have sound.
+
+    I also suspect that it's purely because "make oldconfig" doesn't work,
+    and probably turned off my old Intel HDA settings. Or something.
+
+    Renaming config parameters is *bad*. I've harped on the Kconfig phase
+    of the kernel build probably being our nastiest point, and a real pain
+    point to people getting involved with development simply because
+    building your own kernel can be so daunting with hundreds of fairly
+    esoteric questions.
 
 ..
    end-of-content

base-commit: e1e828a1e9a79af76a7cdc271e0a506e496c2eaa
-- 
2.53.0

