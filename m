Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A076B163;
	Sat,  7 Feb 2026 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770425174; cv=none; b=SHcxFnp5nR+cajEIi4VqEhQ0PpwNT48cN9D20g5iRvPAvgZMB0h4zSWEf3H0IPSzb8pmZ/Jon+6H5oULoIjVDZN2IOM4Ai0idf8ok4SUXmhalELtXcR0PEQQod+PqxwogHKmii7D8lRnN4ckRPdbQlE+8pHGoMMfTwsKfmRu1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770425174; c=relaxed/simple;
	bh=8T8XZK0dd2C3J0EhXXcN+kPqV35X8PkAzoKiJxRqG0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGKf9ZgNZEa79oUVs00KeMVb0HVJ7O00jo51FUkpYu6BdYZpvdrECrc629eD0M9oTuQU19jKT8kIP5XIz2GkwSjgf5omMwJS/I9yNghYNqlTPMeDGiENPtdqQCmsQleCzMRGud9CsrDkKZH9IWbzXCql5c3QIkFEqAGUfd8Qs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rluDwJNf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rluDwJNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385F8C116C6;
	Sat,  7 Feb 2026 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770425174;
	bh=8T8XZK0dd2C3J0EhXXcN+kPqV35X8PkAzoKiJxRqG0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rluDwJNfaXGLwVG14Au2fr6IDHEEzq8bf8wFQm9uGbVmKIKWT6rkiu6+yoMJ7fXhu
	 pMCiDelNkrkLCRd1b9qBBcLPCOJMBRmoEshKO+yIDrWLGEfqIbf1C6rYtxDBfNLOdq
	 CS8xhr/1MvYECqHM7R+tlW+4V7N95qnyyuFOux/EPauWXa2NhpoMfArwjtBZA1HEYc
	 59RlrHZ295PPlJ94qhkHPQTQemgw/WYe3wn64ktZ+5RRMltHXjAy+ZdeWhLPB/V7Ke
	 vpHme0ihC5lquLoJHW4X8EIYdFbWYgLzAGxh1dVFJlTAYwggkimDg4gPEnueiUcq4Y
	 k55s2rySbnQsA==
Date: Fri, 6 Feb 2026 16:46:11 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@glx-um.de>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Justin Forbes <jforbes@fedoraproject.org>, Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
Message-ID: <cwxcn2oufcpvzenyicg27umr3gbuow26ufotfhck6vauxyqmam@e6ssitydnafx>
References: <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
 <kv4bv3jng2iap3qwvk36pciggiho4yhavnfvsisri67jkdt6kr@szokbl6qdibl>
 <87jywq18yt.ffs@tglx>
 <uc62gsttzmh5o35uh7viy326bqwpq5gxmcxqqyqb4zp4blp7tg@v3kfsotqtaay>
 <CAHk-=wivx7pi+h+hGmvNFAJm6StQLiQ-b8DdsE5J=LMOWae8Ng@mail.gmail.com>
 <2aoadlgueumiq6hf74baskvk5eomsil7jfsxg4vf4ofaggbecl@7seilp4ou5nl>
 <CAHk-=wgeoGrqgd4n7CntnF8hCPr3qvVVgzF7evhacyqstByYmg@mail.gmail.com>
 <nchtwtwjqwm444au4rsojawomqslolr3hb4ao4rwsi3t7hqawe@ktggphxq2rhd>
 <CAHk-=wjzFZMAoJkrOg7LWsQcVOuZhOgMFWGC-sBHOACE8B4+Mw@mail.gmail.com>
 <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjEwfcj6DWWh8mKr+O4ospkfNSC1GAvAcwfWAUAyTRq5A@mail.gmail.com>

On Fri, Feb 06, 2026 at 03:08:29PM -0800, Linus Torvalds wrote:
> On Fri, 6 Feb 2026 at 14:38, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I'm going to change that commit message to make it clear that it's a
> > QEMU bug, plain and simple. There's no point in claiming this fixes a
> > kernel bug when it's a pure workaround for a bug elsewhere.
> 
> I have created an issue at gitlab:
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/3293
> 
> and hopefully this will get fixed in QEMU at some point.
> 
> Adding Paolo to the participants, since he presumably knows what to do
> with qemu, since he touched that qemu file a couple of months ago.
> 
> (The fix looks trivial, as suggested by Alexey: just change the
> "uint32_t data[6];" to use target_ulong instead of uint32_t, but
> somebody needs to test it and maybe qemu has other rules for register
> types)

I posted a QEMU fix here:

  https://lists.gnu.org/archive/html/qemu-devel/2026-02/msg01713.html

(using uint64_t instead of target_ulong at the maintainer's request as
they are phasing out the target_ulong type).

-- 
Josh
